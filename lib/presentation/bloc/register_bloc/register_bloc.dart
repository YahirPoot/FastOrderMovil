import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_order/infrastructure/inputs/index.dart';
import 'package:fast_order/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterFormState> {
  final AuthBloc authBloc;

  RegisterBloc({ required this.authBloc }) : super(RegisterFormState()) {

    void touchEveryField(Emitter<RegisterFormState> emit) {
      final email = Email.dirty(value: state.email.value);
      final password = Password.dirty(value: state.password.value);
        
      emit(state.copyWith(
        email: email,
        password: password,
        isFormPosted: true,
        isValid: Formz.validate([email, password]),
      ));

      // print('state: ${{
      //   "isFormPosted": state.isFormPosted,
      //   "isValid": state.isValid,
      //   "email": state.email,
      //   "password": state.password
      // }}');
    }

    on<SubmitForm>((event, emit) {
        touchEveryField(emit);

        if (!state.isValid) return;

        authBloc.add(
          LoginEvent(
            state.email.value, 
            state.password.value
          ));
          
    });

    on<UpdateEmail>((event, emit) {
      final newEmail = Email.dirty(value: event.email);
      emit(state.copyWith(
        email: newEmail,
        isValid: Formz.validate([newEmail, state.password]),
      ));
    });

    on<UpdatePassword>((event, emit) {
      final newPassword = Password.dirty(value: event.password);
      emit(state.copyWith(
        password: newPassword,
        isValid: Formz.validate([state.email, newPassword]),
      ));
    });
  }
}
