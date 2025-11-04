import 'package:mis_metas_app/features/login/domain/entities/user.dart';

abstract class RegisterRepository {
  Future<User> register(String name, String email, String password);
}