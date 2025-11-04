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

  Future<bool> attemptRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = await registerUserUseCase(
        name: name,
        email: email,
        password: password,
      );
      _isLoading = false;
      sessionProvider.login(user);

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