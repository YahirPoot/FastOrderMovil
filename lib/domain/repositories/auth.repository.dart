import 'package:fast_order/domain/entities/index.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<TokenPair> refreshToken(String refreshToken);
  Future<User> checkAuthStatus(String accessToken);
}