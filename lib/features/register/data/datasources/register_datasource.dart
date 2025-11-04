import 'dart:convert';
import 'package:mis_metas_app/core/error/exception.dart';
import 'package:mis_metas_app/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RegisterDataSource {
  Future<UserModel> register(String name, String email, String password);
}

class RegisterDataSourceImpl implements RegisterDataSource {

  RegisterDataSourceImpl();

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));

    if (prefs.containsKey('user_$email')) {
      throw ServerException("El email ya está registrado");
    }

    final userMap = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'name': name,
      'email': email,
      'password': 'hashed_$password'
    };
    await prefs.setString('user_$email', json.encode(userMap));
    final token = 'local-token-for-$email';
    await prefs.setString('session_token', token);

    return UserModel(
      id: userMap['id'] as int,
      name: name,
      email: email,
      token: token,
    );
  }
}