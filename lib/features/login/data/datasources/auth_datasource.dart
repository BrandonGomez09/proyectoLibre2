import 'dart:convert';
import 'package:mis_metas_app/core/error/exception.dart';
import 'package:mis_metas_app/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {

  AuthDataSourceImpl();

  @override
  Future<UserModel> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 1));

    final userString = prefs.getString('user_$email');
    if (userString == null) {
      throw ServerException("Credenciales inválidas");
    }

    final userMap = json.decode(userString) as Map<String, dynamic>;

    final storedPassword = userMap['password'];
    if (storedPassword != 'hashed_$password') {
      throw ServerException("Credenciales inválidas");
    }

    final token = 'local-token-for-$email';
    await prefs.setString('session_token', token);

    return UserModel(
      id: userMap['id'] as int,
      name: userMap['name'] as String,
      email: userMap['email'] as String,
      token: token,
    );
  }
}