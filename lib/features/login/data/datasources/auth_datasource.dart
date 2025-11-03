// lib/features/login/data/datasources/auth_datasource.dart
import 'dart:convert';
import 'package:mis_metas_app/core/error/exception.dart';
import 'package:mis_metas_app/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {

  AuthDataSourceImpl(); // Ya no necesita http

  @override
  Future<UserModel> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Simula una espera
    await Future.delayed(const Duration(seconds: 1));

    // 2. Busca al usuario
    final userString = prefs.getString('user_$email');
    if (userString == null) {
      throw ServerException("Credenciales inválidas"); // No existe
    }

    final userMap = json.decode(userString) as Map<String, dynamic>;

    // 3. Compara la contraseña (simulación)
    final storedPassword = userMap['password'];
    if (storedPassword != 'hashed_$password') {
      throw ServerException("Credenciales inválidas"); // Contraseña incorrecta
    }

    // 4. Crea un nuevo token de sesión
    final token = 'fake-local-token-for-$email';
    await prefs.setString('session_token', token);

    // 5. Devuelve el UserModel (¡con el token!)
    return UserModel(
      id: userMap['id'] as int,
      name: userMap['name'] as String,
      email: userMap['email'] as String,
      token: token,
    );
  }
}