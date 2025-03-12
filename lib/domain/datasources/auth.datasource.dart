import 'package:fast_order/domain/entities/index.dart';

abstract class AuthDatasource {
  Future<User> login(String email, String password);
  Future<TokenPair> refreshToken(String refreshToken);
  //TODO: ADD CHECK TOKEN METHOD
}