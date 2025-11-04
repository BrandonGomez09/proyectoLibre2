import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';

abstract class GoalRepository {
  Future<List<Goal>> getGoals(String token);
  Future<Goal> createGoal(String title, String description, String token);
}