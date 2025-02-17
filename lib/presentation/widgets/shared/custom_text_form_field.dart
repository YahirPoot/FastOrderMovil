import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? icon;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black54;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4), // Sombra hacia abajo
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 16, color: textColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: colors.surface, // Mantiene coherencia con el tema
          prefixIcon:
              icon != null ? Icon(icon, color: const Color(0xFFF48C06)) : null,
          labelText: label,
          labelStyle: const TextStyle(
              color: Color(0xFFF48C06), fontWeight: FontWeight.bold),
          hintText: hint,
          errorText: errorMessage,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Sin bordes para mejor integración
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF48C06), width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF48C06)),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
