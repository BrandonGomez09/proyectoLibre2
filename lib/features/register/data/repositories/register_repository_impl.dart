// lib/features/register/data/repositories/register_repository_impl.dart
import 'package:mis_metas_app/features/register/data/datasources/register_datasource.dart';
import 'package:mis_metas_app/features/login/domain/entities/user.dart'; // Reutilizamos User
import 'package:mis_metas_app/features/register/domain/repositories/register_repository.dart';

// 1. Hereda del "contrato" (RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {

  // 2. Pide el DataSource por inyección de dependencias
  final RegisterDataSource dataSource;
  RegisterRepositoryImpl({required this.dataSource});

  // 3. Implementa el método
  @override
  Future<User> register(String name, String email, String password) async {
    // Llama al dataSource y devuelve el modelo (que ya es una Entidad User)
    return await dataSource.register(name, email, password);
  }
}