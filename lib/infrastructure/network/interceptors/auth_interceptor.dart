import 'package:dio/dio.dart';
import 'package:fast_order/infrastructure/index.dart'; // para tu KeyValueStorageService
import 'package:fast_order/domain/index.dart'; // si quieres manejar errores propios como InvalidToken, etc.

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final KeyValueStorageService keyValueStorageService;
  final AuthRepository authRepository;

  AuthInterceptor({
    required this.dio,
    required this.keyValueStorageService,
    required this.authRepository,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await keyValueStorageService.getValue<String>('accessToken');
    
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options); // Continúa la ejecución
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Si el error es 401, intentamos refrescar el token
    if (err.response?.statusCode == 401) {
      final refreshToken = await keyValueStorageService.getValue<String>('refreshToken');
      
      if (refreshToken == null) {
        return handler.reject(err); // No podemos refrescar, no hay refreshToken
      }

      try {
        // Intentar refrescar
        final TokenPair tokenPair = await authRepository.refreshToken(refreshToken);
        
        // Guardar nuevos tokens
        await keyValueStorageService.setKeyValue('accessToken', tokenPair.accessToken);
        await keyValueStorageService.setKeyValue('refreshToken', tokenPair.refreshToken);

        // Clonar la petición fallida
        final RequestOptions requestOptions = err.requestOptions;

        // Actualizar header con el nuevo token
        final newRequestOptions = requestOptions.copyWith(
          headers: {
            ...requestOptions.headers,
            'Authorization': 'Bearer ${tokenPair.accessToken}',
          },
        );

        // Repetir la petición con el nuevo token
        final response = await dio.fetch(newRequestOptions);

        return handler.resolve(response);
      } catch (e) { //error del refresh token

        if (e is InvalidToken) {
          return handler.reject(
            DioException( // mandar el error de invalid refresh token
              requestOptions: err.requestOptions,
              error: InvalidRefreshToken(message: 'Refresh token invalid'),
              type: DioExceptionType.unknown,
            ),
          );
        }

        return handler.reject(err); // mandar el error orginal.

      }

    }

    return handler.next(err); // Otro error diferente, lo pasamos
  }
}
