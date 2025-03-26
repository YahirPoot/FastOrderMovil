import 'package:dio/dio.dart';
import 'package:fast_order/domain/index.dart';
import 'package:fast_order/config/index.dart';
import 'package:fast_order/infrastructure/errors/auth_errors.dart';

class RenderAuthDatasourceImpl implements AuthDatasource {

  final Dio dio; //Dio is a coupled dependency Datasources

  RenderAuthDatasourceImpl()
    : dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        ),
      );

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      final User user = User.mapJsonToUserEntity(response.data);

      return user;

    } on DioException catch (e) {
      if( e.response?.statusCode == 404 || e.response?.statusCode == 400) throw WrongCredentials( message: e.response?.data['error']);
      if( e.type == DioExceptionType.connectionTimeout ) throw ConnectionTimeout();
      throw CustomError('Unexpected DioException', 500);
    }

  }

  @override
  Future<TokenPair> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
  
}