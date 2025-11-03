// lib/myapp.dart
import 'package:flutter/material.dart';
import 'package:mis_metas_app/theme/app_theme.dart'; // Corregido a 'theme/'
import 'package:mis_metas_app/core/router/app_router.dart';
import 'package:mis_metas_app/shared/providers/session_provider.dart';
import 'package:device_preview/device_preview.dart'; // <-- 1. IMPORTA

class MyApp extends StatelessWidget {
  final SessionProvider sessionProvider;

  const MyApp({
    super.key,
    required this.sessionProvider
  });

  @override
  Widget build(BuildContext context) {
    const Color seedColor = Colors.green;

    return MaterialApp.router(
      // --- 2. AÑADE ESTAS DOS LÍNEAS ---
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // --- Fin de la conexión ---

      routerConfig: appRouter(sessionProvider),

      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(centerTitle: true)
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark,
          ),
          appBarTheme: const AppBarTheme(centerTitle: true)
      ),

      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}