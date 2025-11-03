// lib/core/network/http_client.dart

import 'package:http/http.dart' as http;

// Esto nos permite usar el mismo cliente http en toda la app (Singleton)
class HttpClient {
  static final HttpClient _instance = HttpClient._internal();
  late final http.Client client;

  factory HttpClient() {
    return _instance;
  }

  HttpClient._internal() {
    client = http.Client();
  }

  void dispose() {
    client.close();
  }
}