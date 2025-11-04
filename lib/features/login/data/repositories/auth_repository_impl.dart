import 'package:mis_metas_app/features/login/data/datasources/auth_datasource.dart';
import 'package:mis_metas_app/features/login/domain/entities/user.dart';
import 'package:mis_metas_app/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<User> login(String email, String password) async {
    return await dataSource.login(email, password);
  }
}