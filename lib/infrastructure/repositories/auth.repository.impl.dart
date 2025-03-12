
import 'package:fast_order/domain/index.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<User> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<TokenPair> refreshToken(String refreshToken) {
    return datasource.refreshToken(refreshToken);
  }
  
}