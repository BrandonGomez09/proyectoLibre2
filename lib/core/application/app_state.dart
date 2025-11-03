import 'package:flutter/material.dart';
import 'package:mis_metas_app/features/login/domain/entities/user.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated
}

class AppState with ChangeNotifier {

  User? _user;
  AuthStatus _authStatus = AuthStatus.unknown;

  User? get user => _user;
  AuthStatus get authStatus => _authStatus;

  AppState() {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    _authStatus = AuthStatus.unauthenticated;
    notifyListeners();
  }

  // Método para cuando el login es EXITOSO
  void login(User user) {
    _user = user;
    _authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  // Método para cerrar sesión
  Future<void> logout() async {
    _user = null;
    _authStatus = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
