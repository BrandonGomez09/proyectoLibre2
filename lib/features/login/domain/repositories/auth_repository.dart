import 'package:mis_metas_app/features/login/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
}