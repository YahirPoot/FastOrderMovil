import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>((event, emit) {
      emit(state.copyWith(isLoggedIn: true));
    });

    on<LogoutEvent>((event, emit) {
      emit(state.copyWith(isLoggedIn: false));
    });
  }
}
