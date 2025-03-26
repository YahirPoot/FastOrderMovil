import 'package:fast_order/infrastructure/errors/auth_errors.dart';

class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair({
    
    required this.accessToken,
    required this.refreshToken,
  });

  static TokenPair mapJsonToTokenPair(Map<String, dynamic> json) {
    final accessToken = json['acessToken']; //FIXME: Error de escritura cambiar en la api y en el cliente
    final refreshToken = json['refreshToken'];

    if(accessToken is! String ) throw MappingError('Invalid or missing "accessToken"');
    if (refreshToken is! String) throw MappingError('Invalid or missing "refreshToken"');

    return TokenPair(
      accessToken: json['acessToken'] as String, //FIXME: Error de escritura cambiar en la api y en el cliente
      refreshToken: json['refreshToken'] as String,
    );
  }
}
