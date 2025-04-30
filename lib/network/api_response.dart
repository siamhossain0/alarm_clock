/// Generic API response class
class ApiResponse<T> {
  final int statusCode;
  final T? data;
  final dynamic rawData;
  final Map<String, String> headers;
  final bool isSuccess;

  ApiResponse({
    required this.statusCode,
    this.data,
    this.rawData,
    required this.headers,
  }) : isSuccess = statusCode >= 200 && statusCode < 300;

  /// Check if the response is successful
  bool get isSuccessful => isSuccess;

  /// Check if the response has data
  bool get hasData => data != null;

  /// Get a header value by key
  String? getHeader(String key) => headers[key];

  /// Get the content type of the response
  String? get contentType => getHeader('content-type');

  /// Get the ETag of the response
  String? get etag => getHeader('etag');

  /// Get the date of the response
  String? get date => getHeader('date');

  /// Get the server of the response
  String? get server => getHeader('server');

  /// Get the cache control of the response
  String? get cacheControl => getHeader('cache-control');

  /// Get the content length of the response
  int? get contentLength {
    final length = getHeader('content-length');
    return length != null ? int.tryParse(length) : null;
  }
}