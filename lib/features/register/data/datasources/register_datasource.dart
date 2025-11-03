// lib/features/register/data/datasources/register_datasource.dart
import 'dart:convert';
import 'package:mis_metas_app/core/error/exception.dart';
import 'package:mis_metas_app/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RegisterDataSource {
  Future<UserModel> register(String name, String email, String password);
}

class RegisterDataSourceImpl implements RegisterDataSource {

  // No necesitamos 'http', usamos SharedPreferences
  RegisterDataSourceImpl();

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Simula una espera (como si fuera una API)
    await Future.delayed(const Duration(seconds: 1));

    // 2. Comprueba si el email ya existe (simulación de 'UNIQUE' en BD)
    if (prefs.containsKey('user_$email')) {
      throw ServerException("El email ya está registrado");
    }

    // 3. Guarda el nuevo usuario (simulamos la contraseña encriptada)
    final userMap = {
      'id': DateTime.now().millisecondsSinceEpoch, // ID único falso
      'name': name,
      'email': email,
      'password': 'hashed_$password' // Simulación de encriptación
    };
    await prefs.setString('user_$email', json.encode(userMap));

    // 4. "Iniciamos sesión" creando un token falso
    final token = 'fake-local-token-for-$email';
    await prefs.setString('session_token', token);

    // 5. Devolvemos el UserModel (¡con el token!)
    return UserModel(
      id: userMap['id'] as int,
      name: name,
      email: email,
      token: token,
    );
  }
}