part of 'auth_bloc.dart';



sealed class AuthEvent extends Equatable {
  
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {}
class LogoutEvent extends AuthEvent {}


