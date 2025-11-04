import 'package:mis_metas_app/features/register/data/datasources/register_datasource.dart';
import 'package:mis_metas_app/features/login/domain/entities/user.dart'; // Reutilizamos User
import 'package:mis_metas_app/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource dataSource;
  RegisterRepositoryImpl({required this.dataSource});

  @override
  Future<User> register(String name, String email, String password) async {
    return await dataSource.register(name, email, password);
  }
}