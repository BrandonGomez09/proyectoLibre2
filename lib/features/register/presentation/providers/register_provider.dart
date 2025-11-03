// lib/features/register/presentation/providers/register_provider.dart
import 'package:flutter/material.dart';
import 'package:mis_metas_app/features/register/domain/usecases/register_user.dart';
import 'package:mis_metas_app/shared/providers/session_provider.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterUser registerUserUseCase;
  final SessionProvider sessionProvider;

  RegisterProvider({
    required this.registerUserUseCase,
    required this.sessionProvider,
  });

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  // Función que llamará el botón "Crear Cuenta"
  Future<bool> attemptRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // 1. Llama al Caso de Uso
      final user = await registerUserUseCase(
        name: name,
        email: email,
        password: password,
      );
      _isLoading = false;

      // 2. ¡Avisa al SessionProvider que el login fue exitoso!
      sessionProvider.login(user);

      notifyListeners();
      return true; // Registro exitoso
    } catch (e) {
      // 3. Maneja el error
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false; // Registro fallido
    }
  }
}