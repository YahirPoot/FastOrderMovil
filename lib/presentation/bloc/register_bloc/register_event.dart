part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

// Evento para actualizar el correo
class UpdateEmail extends RegisterEvent {
  final String email;
  const UpdateEmail(this.email);

  @override
  List<Object> get props => [email];
}

// Evento para actualizar la contraseña
class UpdatePassword extends RegisterEvent {
  final String password;
  const UpdatePassword(this.password);

  @override
  List<Object> get props => [password];
}

// Evento para enviar el formulario
class SubmitForm extends RegisterEvent {}
