import 'package:http/http.dart' as http;

/// Base exception class for network errors
class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

/// Exception for API errors
class ApiException extends NetworkException {
  final int statusCode;
  final http.Response response;

  ApiException({
    required String message,
    required this.statusCode,
    required this.response,
  }) : super(message);

  @override
  String toString() => 'ApiException: $message (Status Code: $statusCode)';

  /// Check if the error is a client error (4xx)
  bool get isClientError => statusCode >= 400 && statusCode < 500;

  /// Check if the error is a server error (5xx)
  bool get isServerError => statusCode >= 500 && statusCode < 600;

  /// Check if the error is an authentication error (401)
  bool get isAuthError => statusCode == 401;

  /// Check if the error is a forbidden error (403)
  bool get isForbiddenError => statusCode == 403;

  /// Check if the error is a not found error (404)
  bool get isNotFoundError => statusCode == 404;

  /// Check if the error is a validation error (422)
  bool get isValidationError => statusCode == 422;

  /// Check if the error is a rate limit error (429)
  bool get isRateLimitError => statusCode == 429;
}

/// Exception for timeout errors
class TimeoutException extends NetworkException {
  TimeoutException([String message = 'Request timed out']) : super(message);
}

/// Exception for connection errors
class ConnectionException extends NetworkException {
  ConnectionException([String message = 'Connection error']) : super(message);
}

/// Exception for parsing errors
class ParseException extends NetworkException {
  ParseException([String message = 'Failed to parse response']) : super(message);
}

/// Exception for cache errors
class CacheException extends NetworkException {
  CacheException([String message = 'Cache error']) : super(message);
}