// lib/features/login/domain/repositories/auth_repository.dart
import 'package:mis_metas_app/features/login/domain/entities/user.dart';

abstract class AuthRepository {
  // Define lo que el login debe hacer:
  // Recibe email y password, y devuelve un Usuario.
  Future<User> login(String email, String password);

// (Aquí podríamos agregar register, logout, etc. en el futuro)
}