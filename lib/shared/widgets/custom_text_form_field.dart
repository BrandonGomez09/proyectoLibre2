// lib/shared/widgets/custom_text_form_field.dart
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller; // <-- 1. AÑADIMOS EL CONTROLLER

  const CustomTextFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.obscureText = false,
    this.controller, // <-- 2. AÑADIMOS AL CONSTRUCTOR
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // <-- 3. LO ASIGNAMOS AQUÍ
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}