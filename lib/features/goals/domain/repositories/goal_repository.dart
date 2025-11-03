// lib/features/goals/domain/repositories/goal_repository.dart
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';

abstract class GoalRepository {
  // Define lo que la feature "goals" debe hacer:

  // 1. Obtener la lista de metas (seguramente pedirá el token)
  Future<List<Goal>> getGoals(String token);

  // 2. Crear una nueva meta
  Future<Goal> createGoal(String title, String description, String token);

// (Aquí podríamos agregar updateGoal, deleteGoal, etc.)
}