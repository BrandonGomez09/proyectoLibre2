// lib/core/error/exception.dart

// Excepción para errores del servidor (ej. 404, 500)
class ServerException implements Exception {
  final String message;
  ServerException([this.message = "Error en el servidor"]);
}

// Excepción para errores de conexión (ej. no hay internet)
class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "Error de red"]);
}