// lib/features/goals/domain/usecases/get_goals.dart
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';
import 'package:mis_metas_app/features/goals/domain/repositories/goal_repository.dart';

class GetGoals {
  final GoalRepository repository;

  GetGoals(this.repository);

  // La función 'call'
  Future<List<Goal>> call({required String token}) async {
    // Aquí podrías agregar validaciones si el token está vacío, etc.
    return await repository.getGoals(token);
  }
}