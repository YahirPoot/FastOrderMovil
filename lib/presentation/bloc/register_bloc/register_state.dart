part of 'register_bloc.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Email email;
  final Password password;
  const RegisterFormState({
    this.formStatus = FormStatus.invalid, //Este es el estado en el que se encuentra el formulario.
    this.isValid = false,// no son validos hasta que las personas lo llenen.
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Email? email,
    Password? password,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
  
  @override
  List<Object> get props => [isValid, email, password];
}
