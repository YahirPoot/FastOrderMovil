import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_order/infrastructure/inputs/index.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterFormState> {
  RegisterBloc() : super(RegisterFormState()) {

    void touchEveryField(Emitter<RegisterFormState> emit) {
      final email = Email.dirty(value: state.email.value);
      final password = Password.dirty(value: state.password.value);
      emit(
        state.copyWith(
          formStatus: FormStatus.posting,
          email: email,
          password: password,
          isValid: Formz.validate([email, password]), //cada vez que escriba o llene el formulario se validará.
        ),
      );
    }

    on<SubmitForm>((event, emit) {
      touchEveryField(emit);
      print(state);
    });

    // Actualiza el email
    on<UpdateEmail>((event, emit) {
      final email = Email.dirty(value: event.email); //cada que vez que ensucié el cambio, valida que sea correcto el input.
      emit(state.copyWith(
        isValid: Formz.validate([email, state.password]), //En este caso, valida estos 2 inputs para saber si el formulario en general esta valido.
        email: email,
      ));
    });

    // Actualiza la contraseña
    on<UpdatePassword>((event, emit) {
      final password = Password.dirty(value: event.password);
      emit(state.copyWith(
        isValid: Formz.validate([state.email, password]),
        password: password,
      ));
    });
    
  }
}
