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

    Future<bool> refreshTokens(Emitter<AuthState> emit, String refreshToken) async {
      try {
        final TokenPair newTokens = await _authRepository.refreshToken(refreshToken);
        // Guardar los nuevos tokens en el almacenamiento
        await _keyValueStorageService.setKeyValue('accessToken', newTokens.accessToken);
        await _keyValueStorageService.setKeyValue('refreshToken', newTokens.refreshToken);
        return true; // Indica que el refresh token fue exitoso
      } on InvalidToken{
        logout(emit: emit, errorMessage: 'Session expired. Please log in again.');
        return false;
      } catch (e) {
        logout(emit: emit, errorMessage: 'Error not controlled');
        return false;
      }
    }

    on<CheckAuthStatus>((event, emit) async { //* Check if the user is authenticated every time the app starts
      final accessToken = await _keyValueStorageService.getValue<String>('accessToken');
      final refreshToken = await _keyValueStorageService.getValue<String>('refreshToken');

      if (accessToken == null || refreshToken == null) {
        return logout(emit: emit);
      }

      try {
        final User user = await _authRepository.checkAuthStatus(accessToken, refreshToken);
        setLoggedUser(user: user, emit: emit);
      } on InvalidToken { //* tengo ambos tokens pero el accessToken es inválido
        final refreshed = await refreshTokens(emit, refreshToken);
        if (refreshed) add(CheckAuthStatus());
      } catch (e) {
        logout(emit: emit, errorMessage: 'Error not controlled');
      }
    });

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
