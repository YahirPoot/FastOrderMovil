
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fast_order/domain/index.dart';
import 'package:fast_order/infrastructure/index.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({AuthRepository? authRepository})
    : _authRepository = authRepository ?? AuthRepositoryImpl(),
      super(AuthState()) {

    void setLoggedUser({ required user, required Emitter<AuthState> emit}) {
      //TODO: SAVE TOKEN IN LOCAL STORAGE
      emit(state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: user,
      ));
      print(state);
    }

    void logout({required String? errorMessage, required Emitter<AuthState> emit}) {
      //TODO: REMOVE TOKEN FROM LOCAL STORAGE
      emit(state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage,
      ));
    }
    
    on<LoginEvent>((event, emit) async {

      try {

        final User user = await _authRepository.login(event.email, event.password);
        setLoggedUser(user: user, emit: emit);

      } on WrongCredentials catch (e) {
        logout(
          errorMessage: e.message, 
          emit: emit
          );
      } on CustomError catch (e) {
        logout(
          errorMessage: e.message, 
          emit: emit
          );
      } on MappingError catch (e) {
        logout(
          errorMessage: e.message, 
          emit: emit
          );
      } on ConnectionTimeout {
        logout(
          errorMessage: 'Timeout de conexión', 
          emit: emit
          );
      } catch (e) {
        logout(
          emit: emit,
          errorMessage: 'Erorr not controlled', 
        );
      }

    });

    //TODO: CheckAuthStatus

  }
}
