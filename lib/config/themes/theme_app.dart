import 'package:flutter/material.dart';

const List<Color> colorList = [
  Color(0xFFF48C06),// #008000 verde oscuro
  Color.fromARGB(255, 255, 94, 0) // #90EE90 verde claro
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
  }) : 
  assert(selectedColor >= 0, 'selectedColor must be greater than 0'),
  assert(selectedColor <= colorList.length -1, 'selectedColor must be less or equal than ${colorList.length - 1}' );

    ThemeData getTheme() {
    final primary = colorList[selectedColor];
    final secondary = Color(0xFFFFC300); // Ejemplo de color secundario
    final surface = Colors.white;
    final error = Colors.red;

    final colorScheme = ColorScheme(
      brightness: isDarkMode ? Brightness.dark : Brightness.light, //Define si la paleta de colores es clara u oscura
      primary: primary, //El color pirncipal de la app - en componentes de material.
      onPrimary: Colors.white, // Color de texto sobre el color primario - asegura tener contraste y legibilidad sobre el color principal.
      secondary: secondary, // Color secundario de la app - resaltar elementos menos importantes que el color primario.
      onSecondary: Colors.black, // Color de texto sobre el color secundario.
      error: error, // Color de error - para mostrar errores o advertencias.
      onError: Colors.white, // Color de texto sobre el color de error.
      surface: surface,  // Color de superficie - para fondos de componentes como tarjetas o listas.
      onSurface: Colors.black, // Color de texto sobre la superficie.
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // Puedes personalizar más propiedades aquí si lo deseas
    );
  }

  AppTheme copyWith({
    bool? isDarkMode,
    int? selectedColor
  }) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode,
    selectedColor: selectedColor ?? this.selectedColor
  );

}