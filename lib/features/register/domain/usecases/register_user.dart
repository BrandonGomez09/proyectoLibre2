import 'package:mis_metas_app/features/login/domain/entities/user.dart'; // Reutilizamos User
import 'package:mis_metas_app/features/register/domain/repositories/register_repository.dart';

class RegisterUser {
  final RegisterRepository repository;

  RegisterUser(this.repository);

  Future<User> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await repository.register(name, email, password);
  }
}