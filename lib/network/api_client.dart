import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_response.dart';
import 'network_exceptions.dart';

class ApiClient {
  final String baseUrl;
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  ApiClient({required this.baseUrl});

  /// Set the authorization token for API requests
  void setAuthToken(String token) {
    _headers['Authorization'] = 'Bearer $token';
  }

  /// Add a custom header
  void addHeader(String key, String value) {
    _headers[key] = value;
  }

  /// Remove a header
  void removeHeader(String key) {
    _headers.remove(key);
  }

  /// Make a GET request
  Future<ApiResponse<T>> get<T>(
      String endpoint, {
        Map<String, dynamic>? queryParams,
        T Function(dynamic)? fromJson,
      }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint').replace(
        queryParameters: queryParams,
      );

      final response = await http.get(uri, headers: _headers);
      return _processResponse<T>(response, fromJson);
    } on SocketException {
      throw NetworkException('No internet connection');
    } catch (e) {
      throw NetworkException('Failed to make GET request: $e');
    }
  }

  /// Make a POST request
  Future<ApiResponse<T>> post<T>(
      String endpoint, {
        dynamic body,
        T Function(dynamic)? fromJson,
      }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.post(
        uri,
        headers: _headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _processResponse<T>(response, fromJson);
    } on SocketException {
      throw NetworkException('No internet connection');
    } catch (e) {
      throw NetworkException('Failed to make POST request: $e');
    }
  }

  /// Make a PUT request
  Future<ApiResponse<T>> put<T>(
      String endpoint, {
        dynamic body,
        T Function(dynamic)? fromJson,
      }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.put(
        uri,
        headers: _headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _processResponse<T>(response, fromJson);
    } on SocketException {
      throw NetworkException('No internet connection');
    } catch (e) {
      throw NetworkException('Failed to make PUT request: $e');
    }
  }

  /// Make a DELETE request
  Future<ApiResponse<T>> delete<T>(
      String endpoint, {
        T Function(dynamic)? fromJson,
      }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.delete(uri, headers: _headers);
      return _processResponse<T>(response, fromJson);
    } on SocketException {
      throw NetworkException('No internet connection');
    } catch (e) {
      throw NetworkException('Failed to make DELETE request: $e');
    }
  }

  /// Process the HTTP response
  ApiResponse<T> _processResponse<T>(
      http.Response response,
      T Function(dynamic)? fromJson,
      ) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final dynamic responseBody =
      response.body.isNotEmpty ? jsonDecode(response.body) : null;

      final T? data = responseBody != null && fromJson != null
          ? fromJson(responseBody)
          : null;

      return ApiResponse<T>(
        statusCode: response.statusCode,
        data: data,
        rawData: responseBody,
        headers: response.headers,
      );
    } else {
      final errorMessage = _getErrorMessage(response);
      throw ApiException(
        message: errorMessage,
        statusCode: response.statusCode,
        response: response,
      );
    }
  }

  /// Extract error message from response
  String _getErrorMessage(http.Response response) {
    try {
      final body = jsonDecode(response.body);
      return body['message'] ?? body['error'] ?? 'Unknown error occurred';
    } catch (e) {
      return 'Error ${response.statusCode}: ${response.reasonPhrase}';
    }
  }
}