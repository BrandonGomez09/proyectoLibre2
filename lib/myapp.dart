// lib/myapp.dart
import 'package:flutter/material.dart';
import 'package:mis_metas_app/theme/app_theme.dart';
import 'package:mis_metas_app/core/router/app_router.dart';
import 'package:mis_metas_app/shared/providers/session_provider.dart';
import 'package:device_preview/device_preview.dart';

class MyApp extends StatelessWidget {
  final SessionProvider sessionProvider;
  const MyApp({
    super.key,
    required this.sessionProvider
  });

  @override
  Widget build(BuildContext context) {
    // ELIMINADA LA LÍNEA: const Color seedColor = Colors.green;
    return MaterialApp.router(
      // --- Configuración de DevicePreview ---
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // --- Fin de la conexión ---

      routerConfig: appRouter(sessionProvider),

      // *** CORRECCIÓN CLAVE: Usamos los temas predefinidos ***
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // *******************************************************

      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}