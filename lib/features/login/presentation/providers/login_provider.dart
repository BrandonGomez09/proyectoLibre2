// lib/features/login/presentation/providers/login_provider.dart
import 'package:flutter/material.dart';
// <-- 1. IMPORTA (Ruta corregida a 'shared/')
import 'package:mis_metas_app/shared/providers/session_provider.dart';
import 'package:mis_metas_app/features/login/domain/entities/user.dart';
import 'package:mis_metas_app/features/login/domain/usecases/login_user.dart';

class LoginProvider with ChangeNotifier {
  final LoginUser loginUserUseCase;
  final SessionProvider sessionProvider; // <-- 2. AÑADE

  LoginProvider({
    required this.loginUserUseCase,
    required this.sessionProvider, // <-- 3. AÑADE
  });

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> attemptLogin(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = await loginUserUseCase(email, password);
      _isLoading = false;

      // --- 4. AVISA AL SESSION PROVIDER ---
      sessionProvider.login(user); // ¡Login exitoso!

      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}