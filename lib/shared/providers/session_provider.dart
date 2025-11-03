import 'package:flutter/material.dart';
import 'package:mis_metas_app/features/login/domain/entities/user.dart';

enum AuthStatus {
  authenticated,
  notAuthenticated,
  checking
}

class SessionProvider with ChangeNotifier {

  User? _user;
  AuthStatus _authStatus = AuthStatus.notAuthenticated;

  User? get user => _user;
  AuthStatus get authStatus => _authStatus;

  // Método para cuando el login es EXITOSO
  void login(User user) {
    _user = user;
    _authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  // Método para cerrar sesión
  Future<void> logout() async {
    _user = null;
    _authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}