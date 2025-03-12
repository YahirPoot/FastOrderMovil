import 'package:fast_order/domain/entities/index.dart';

// const List<String> validRoles = ['ADMIN', 'OPERATOR', 'DELIVERY', 'SUPER_ADMIN'];

class User {
  final int id;
  final String fullName;
  final String email;
  final String accessToken;
  final String refreshToken;
  final String role;
  final bool emailVerified;
  final int? kitchenId;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
    this.emailVerified = false,
    this.kitchenId,
  });

  static User mapJsonToUserEntity(Map<String, dynamic> json) {
    final user = json['user'];
    final tokenPair = TokenPair.mapJsonToTokenPair(json);
    return User(
      id:  user['userId'] as int,
      fullName: user['name'] as String,
      email: user['email'] as String,
      emailVerified: user['emailVerified'] as bool,
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
      role: user['rol'] as String,
      kitchenId: user['kitchenId'] as int?,
    );

  }

}