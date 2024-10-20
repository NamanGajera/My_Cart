import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiService {
  final http.Client httpClient;

  ApiService({http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  // ~~~~~~~~~~~~~~~~~~ Reusable Methods for HTTP Requests ~~~~~~~~~~~~~~~~~~

  /// GET request handler
  Future<dynamic> get(String baseUrl, String endpoint,
      {String query = "", String? token}) async {
    final url = query.isNotEmpty ? "$baseUrl$endpoint?$query" : "$baseUrl$endpoint";
    final headers = _buildHeaders(token);
    debugPrint("GET Request: URL: $url, Headers: $headers");

    try {
      final response = await httpClient.get(Uri.parse(url), headers: headers);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  /// POST request handler
  Future<dynamic> post(String baseUrl, String endpoint, dynamic body,
      {String? token}) async {
    final url = '$baseUrl$endpoint';
    final headers = _buildHeaders(token);
    final encodedBody = json.encode(body);
    debugPrint("POST Request: URL: $url, Headers: $headers, Body: $encodedBody");

    try {
      final response = await httpClient.post(Uri.parse(url), headers: headers, body: encodedBody);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  /// PUT request handler
  Future<dynamic> put(String baseUrl, String endpoint, dynamic body,
      {String? token}) async {
    final url = '$baseUrl$endpoint';
    final headers = _buildHeaders(token);
    final encodedBody = json.encode(body);
    debugPrint("PUT Request: URL: $url, Headers: $headers, Body: $encodedBody");

    try {
      final response = await httpClient.put(Uri.parse(url), headers: headers, body: encodedBody);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  /// DELETE request handler
  Future<dynamic> delete(String baseUrl, String endpoint,
      {String? token}) async {
    final url = '$baseUrl$endpoint';
    final headers = _buildHeaders(token);
    debugPrint("DELETE Request: URL: $url, Headers: $headers");

    try {
      final response = await httpClient.delete(Uri.parse(url), headers: headers);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  // ~~~~~~~~~~~~~~~~~~ Helper Methods ~~~~~~~~~~~~~~~~~~

  /// Builds headers for the HTTP requests
  Map<String, String> _buildHeaders(String? token) {
    final headers = {"Content-Type": "application/json"};
    if (token != null) headers["Authorization"] = token;
    return headers;
  }

  /// Processes the HTTP response and returns a dynamic response
  dynamic _processResponse(http.Response response) {
    debugPrint("Response Status: ${response.statusCode}, Body: ${response.body}");

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw ServerValidationError(_extractMessage(response));
      case 401:
        throw UnAuthorizedException(_extractMessage(response));
      case 404:
        throw DoesNotExistException(_extractMessage(response));
      case 500:
      case 503:
        throw UnderMaintenanceError('Application Under Maintenance');
      default:
        throw Exception("Something went wrong: ${response.statusCode}");
    }
  }

  /// Extracts error messages from the response
  String _extractMessage(http.Response response) {
    try {
      final decodedResponse = json.decode(response.body);
      return decodedResponse["message"] ?? "No message provided";
    } catch (e) {
      return "An error occurred";
    }
  }
}
