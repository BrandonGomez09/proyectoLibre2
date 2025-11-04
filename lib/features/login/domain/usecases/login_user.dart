import 'package:mis_metas_app/features/login/domain/entities/user.dart';
import 'package:mis_metas_app/features/login/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<User> call(String email, String password) async {
    return await repository.login(email, password);
  }
}