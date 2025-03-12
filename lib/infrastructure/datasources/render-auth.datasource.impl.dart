import 'package:fast_order/domain/index.dart';

class RenderAuthDatasourceImpl implements AuthDatasource {

  @override
  Future<User> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<TokenPair> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
  
}