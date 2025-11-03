// lib/theme/typography.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Usamos la fuente 'Poppins' que se menciona en tu repo 'designresponsive.txt'
final TextTheme appTypography = GoogleFonts.poppinsTextTheme(
  // Usamos la tipografía base de Material 2021 como referencia
  Typography.material2021().black,
);
