import 'package:fast_order/domain/index.dart';
import 'package:fast_order/infrastructure/datasources/render-auth.datasource.impl.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl({AuthDatasource? datasource})
  : _datasource = datasource ?? RenderAuthDatasourceImpl();

  @override
  Future<User> login(String email, String password) {
    return _datasource.login(email, password);
  }

  @override
  Future<TokenPair> refreshToken(String refreshToken) {
    return _datasource.refreshToken(refreshToken);
  }
  
}