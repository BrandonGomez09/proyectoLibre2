import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';
import 'package:mis_metas_app/features/goals/domain/repositories/goal_repository.dart';

class GetGoals {
  final GoalRepository repository;

  GetGoals(this.repository);
  Future<List<Goal>> call({required String token}) async {
    return await repository.getGoals(token);
  }
}