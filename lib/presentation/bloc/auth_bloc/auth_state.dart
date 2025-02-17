part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoggedIn;
  const AuthState({this.isLoggedIn = false});

  AuthState copyWith({bool? isLoggedIn}) {
    return AuthState(isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }
  
  @override
  List<Object> get props => [isLoggedIn];
}

final class AuthInitial extends AuthState {}
