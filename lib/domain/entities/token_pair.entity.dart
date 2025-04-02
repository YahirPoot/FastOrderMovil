import 'package:fast_order/infrastructure/errors/auth_errors.dart';

class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair({
    
    required this.accessToken,
    required this.refreshToken,
  });

  static TokenPair mapJsonToTokenPair(Map<String, dynamic> json) {
    final accessToken = json['accessToken'];
    final refreshToken = json['refreshToken'];

    if(accessToken is! String ) throw MappingError('Invalid or missing "accessToken"');
    if (refreshToken is! String) throw MappingError('Invalid or missing "refreshToken"');

    return TokenPair(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }
}
