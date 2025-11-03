// lib/features/login/domain/usecases/login_user.dart
import 'package:mis_metas_app/features/login/domain/entities/user.dart';
import 'package:mis_metas_app/features/login/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  // Recibe el repositorio por inyección de dependencias
  LoginUser(this.repository);

  // La función 'call' es el estándar para los casos de uso
  Future<User> call(String email, String password) async {
    return await repository.login(email, password);
  }
}