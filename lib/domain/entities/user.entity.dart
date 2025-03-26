import 'package:fast_order/domain/entities/index.dart';
import 'package:fast_order/infrastructure/errors/auth_errors.dart';

const List<String> validRoles = ['ADMIN', 'OPERATOR', 'DELIVERY', 'SUPER_ADMIN'];

class User {
  final int id;
  final String fullName;
  final String email;
  final String accessToken;
  final String refreshToken;
  final String role;
  final bool emailVerified;
  final int kitchenId;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
    required this.kitchenId,
    this.emailVerified = false,
  });

  static User mapJsonToUserEntity(Map<String, dynamic> json) {
    final user = json['user'];
    final id = user['userId'];
    final fullName = user['name'];
    final email = user['email'];
    final emailVerified = user['emailVerified'];
    final tokenPair = TokenPair.mapJsonToTokenPair(json);
    final role = user['rol'];
    final kitchenId = user['kitchenId'];

    if(id is! int) throw MappingError('Invalid or missing "userId"');
    if(fullName is! String) throw MappingError('Invalid or missing "name"');
    if(email is! String) throw MappingError('Invalid or missing "email"');
    if(emailVerified is! bool) throw MappingError('Invalid or missing "emailVerified"');
    if(role is! String) throw MappingError('Invalid or missing "rol"');
    if(kitchenId is! int) throw MappingError('Invalid or missing "kitchenId"');

    return User(
      id: id,
      fullName: fullName,
      email: email,
      emailVerified: emailVerified,
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
      role: role,
      kitchenId: kitchenId,
    );

  }

}