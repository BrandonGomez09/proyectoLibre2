// lib/features/goals/domain/usecases/create_goal.dart
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';
import 'package:mis_metas_app/features/goals/domain/repositories/goal_repository.dart';

class CreateGoal {
  final GoalRepository repository;

  CreateGoal(this.repository);

  Future<Goal> call({
    required String title,
    required String description,
    required String token,
  }) async {
    if (title.isEmpty) {
      throw Exception("El título no puede estar vacío");
    }
    return await repository.createGoal(title, description, token);
  }
}