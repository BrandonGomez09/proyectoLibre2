// lib/features/login/data/repositories/auth_repository_impl.dart
import 'package:mis_metas_app/features/login/data/datasources/auth_datasource.dart';
import 'package:mis_metas_app/features/login/domain/entities/user.dart';
import 'package:mis_metas_app/features/login/domain/repositories/auth_repository.dart';

// 1. Hereda del "contrato" (AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  // 2. Pide el DataSource por inyección de dependencias
  final AuthDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});

  // 3. Implementa el método
  @override
  Future<User> login(String email, String password) async {
    // Simplemente llama al dataSource.
    // Aquí es donde podrías manejar la conversión de UserModel a User si fueran diferentes.
    // También podrías manejar las excepciones (ServerException) y convertirlas
    // en "Failures" de dominio, pero por ahora lo mantenemos simple.
    return await dataSource.login(email, password);
  }
}