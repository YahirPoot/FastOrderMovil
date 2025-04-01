
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fast_order/domain/index.dart';
import 'package:fast_order/infrastructure/index.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final KeyValueStorageService _keyValueStorageService;

  AuthBloc({
    AuthRepository? authRepository,
    KeyValueStorageService? keyValueStorageService,
    })
    : _authRepository = authRepository ?? AuthRepositoryImpl(),
      _keyValueStorageService = keyValueStorageService ?? KeyValueStorageServiceImpl(),
      super(AuthState()) {

    void setLoggedUser({ required user, required Emitter<AuthState> emit}) async {
      await _keyValueStorageService.setKeyValue('accessToken', user.accessToken);
      await _keyValueStorageService.setKeyValue('refreshToken', user.refreshToken);
      emit(state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: user,
      ));
    }

    void logout({String? errorMessage, required Emitter<AuthState> emit}) async {
      await _keyValueStorageService.removeKey('accessToken');
      await _keyValueStorageService.removeKey('refreshToken');
      emit(state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage,
      ));
    }

    void checkAuthStatus({required Emitter<AuthState> emit}) async {
      final accessToken = await  _keyValueStorageService.getValue('accessToken');
      final refreshToken = await _keyValueStorageService.getValue('refreshToken');

      if (accessToken == null || refreshToken == null) return logout(emit: emit,);

      try {

        //TODO: LLAMAR A UN CHECK AUTH STATUS DE LA API???? no se que hacer.... 
        //setLoggedUser(user: user, emit: emit);

      } catch (e) {
        
      }

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

  }
}
