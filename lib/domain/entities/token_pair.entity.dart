class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair({
    required this.accessToken,
    required this.refreshToken,
  });

  static TokenPair mapJsonToTokenPair(Map<String, dynamic> json) {
    return TokenPair(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }
}
