// lib/features/login/data/models/user_model.dart
import 'package:mis_metas_app/features/login/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
  });

  // Factory para crear un UserModel desde el JSON de la API
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'no-name',
      email: json['email'] ?? 'no-email',
      token: json['token'] ?? 'no-token',
    );
  }

  // Método para convertir nuestro modelo a JSON (para enviar datos)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}