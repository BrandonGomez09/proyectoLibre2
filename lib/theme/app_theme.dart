import 'package:flutter/material.dart';
import 'package:mis_metas_app/theme/color_schemes.dart';
import 'package:mis_metas_app/theme/typography.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),
      textTheme: lightTextTheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      )
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),

      textTheme: darkTextTheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      )
  );
}