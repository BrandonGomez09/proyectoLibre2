import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mis_metas_app/core/router/routes.dart';
import 'package:provider/provider.dart'; // <-- 1. Importa Provider

// Importa los widgets y el provider
import 'package:mis_metas_app/features/login/presentation/providers/login_provider.dart';
import 'package:mis_metas_app/shared/widgets/auth_layout.dart';
import 'package:mis_metas_app/shared/widgets/custom_filled_button.dart';
import 'package:mis_metas_app/shared/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(LoginProvider provider) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final bool loginOk = await provider.attemptLogin(email, password);

    if (!context.mounted) return;

    if (loginOk) {
      context.goNamed(AppRoutes.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.error ?? 'Error desconocido'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<LoginProvider>(context);

    return AuthLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Login', style: textTheme.headlineMedium),
          const SizedBox(height: 24),

          CustomTextFormField(
            label: 'Email',
            prefixIcon: Icons.email_outlined,
            controller: _emailController,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            label: 'Contraseña',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            controller: _passwordController,
          ),
          const SizedBox(height: 24),

          if (provider.error != null && !provider.isLoading)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                provider.error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),

          provider.isLoading
              ? const CircularProgressIndicator()
              : CustomFilledButton(
            text: 'Ingresar',
            onPressed: () => _handleLogin(provider),
          ),

          const SizedBox(height: 16),
          TextButton(
            onPressed: provider.isLoading
                ? null
                : () => context.goNamed(AppRoutes.register),
            child: const Text('¿No tienes cuenta? Regístrate'),
          )
        ],
      ),
    );
  }
}