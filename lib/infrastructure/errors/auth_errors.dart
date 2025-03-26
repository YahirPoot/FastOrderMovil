
class WrongCredentials implements Exception {
  final String? message;
  final int? statusCode;
  WrongCredentials({
    this.message,
    this.statusCode
    });
}
class InvalidToken implements Exception {}
class ConnectionTimeout implements Exception {}
class CustomError implements Exception {
  final String message;
  final int statusCode;
  CustomError(
    this.message,
    this.statusCode
    );
}
class MappingError implements Exception {
  final String message;
  MappingError(this.message);
}