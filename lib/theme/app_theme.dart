// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:mis_metas_app/theme/color_schemes.dart';
import 'package:mis_metas_app/theme/typography.dart';

class AppTheme {

  // Tema para el modo claro (light)
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor, // <-- Usa la semilla de color_schemes.dart
        brightness: Brightness.light,
      ),
      textTheme: appTypography, // <-- Usa la tipografía de typography.dart
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      )
  );

  // Tema para el modo oscuro (dark)
  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor, // <-- Usa la semilla de color_schemes.dart
        brightness: Brightness.dark,
      ),
      textTheme: appTypography, // <-- Usa la tipografía de typography.dart
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      )
  );
}
