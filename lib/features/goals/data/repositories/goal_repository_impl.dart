// lib/features/goals/data/repositories/goal_repository_impl.dart
import 'package:mis_metas_app/features/goals/data/datasources/goal_datasource.dart';
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';
import 'package:mis_metas_app/features/goals/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalDataSource dataSource;

  GoalRepositoryImpl({required this.dataSource});

  @override
  Future<List<Goal>> getGoals(String token) async {
    // Llama al datasource y devuelve los modelos (que ya son Entidades)
    return await dataSource.getGoals(token);
  }

  @override
  Future<Goal> createGoal(String title, String description, String token) async {
    return await dataSource.createGoal(title, description, token);
  }
}