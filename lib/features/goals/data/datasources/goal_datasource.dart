import 'dart:convert';
import 'package:mis_metas_app/core/error/exception.dart';
import 'package:mis_metas_app/features/goals/data/models/goal_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GoalDataSource {
  Future<List<GoalModel>> getGoals(String token);
  Future<GoalModel> createGoal(String title, String description, String token);
}

class GoalDataSourceImpl implements GoalDataSource {

  GoalDataSourceImpl();
  String _getEmailFromToken(String token) {
    try {
      return token.substring(23);
    } catch (e) {
      throw ServerException("Token inválido");
    }
  }

  @override
  Future<List<GoalModel>> getGoals(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final email = _getEmailFromToken(token);
      final goalsKey = 'goals_$email';

      final goalsString = prefs.getString(goalsKey);

      if (goalsString == null) {
        return [];
      }

      final List<dynamic> decodedList = json.decode(goalsString);

      return decodedList
          .map((map) => GoalModel.fromJson(map as Map<String, dynamic>))
          .toList();

    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  @override
  Future<GoalModel> createGoal(String title, String description, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final email = _getEmailFromToken(token);
      final goalsKey = 'goals_$email';

      final goalsString = prefs.getString(goalsKey);
      List<dynamic> goalsList = [];
      if (goalsString != null) {
        goalsList = json.decode(goalsString);
      }

      final newGoal = GoalModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
      );

      goalsList.add(newGoal.toJson());
      await prefs.setString(goalsKey, json.encode(goalsList));

      return newGoal;

    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}