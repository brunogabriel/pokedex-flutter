class NetworkException implements Exception {
  final int? statusCode;

  NetworkException(this.statusCode);
}
