// lib/features/goals/presentation/providers/goal_provider.dart
import 'package:flutter/material.dart';
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';
import 'package:mis_metas_app/features/goals/domain/usecases/get_goals.dart';
// --- 1. IMPORTA ---
import 'package:mis_metas_app/features/goals/domain/usecases/create_goal.dart';
import 'package:mis_metas_app/shared/providers/session_provider.dart';

class GoalProvider with ChangeNotifier {
  final GetGoals getGoalsUseCase;
  // --- 2. AÑADE ---
  final CreateGoal createGoalUseCase;
  final SessionProvider sessionProvider;

  GoalProvider({
    required this.getGoalsUseCase,
    required this.createGoalUseCase, // --- 3. AÑADE ---
    required this.sessionProvider,
  });

  List<Goal> _goals = [];
  bool _isLoading = false;
  String? _error;

  List<Goal> get goals => _goals;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchGoals() async {
    // ... (código existente sin cambios) ...
    if (sessionProvider.authStatus != AuthStatus.authenticated) {
      _error = "No estás autenticado.";
      notifyListeners();
      return;
    }
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final token = sessionProvider.user!.token;
      _goals = await getGoalsUseCase(token: token);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // --- 4. NUEVO MÉTODO PARA AÑADIR METAS ---
  Future<bool> addGoal({
    required String title,
    required String description,
  }) async {
    if (sessionProvider.authStatus != AuthStatus.authenticated) {
      _error = "No estás autenticado.";
      notifyListeners();
      return false;
    }

    try {
      final token = sessionProvider.user!.token;
      final newGoal = await createGoalUseCase(
        title: title,
        description: description,
        token: token,
      );

      // Añade la nueva meta a la lista local y notifica
      _goals.insert(0, newGoal);
      notifyListeners();
      return true;

    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}