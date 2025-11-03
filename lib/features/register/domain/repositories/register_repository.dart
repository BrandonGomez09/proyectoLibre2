// lib/features/register/domain/repositories/register_repository.dart
import 'package:mis_metas_app/features/login/domain/entities/user.dart'; // Reutilizamos User

abstract class RegisterRepository {
  // Define lo que el register debe hacer:
  // Recibe nombre, email y password, y devuelve un Usuario.
  Future<User> register(String name, String email, String password);
}