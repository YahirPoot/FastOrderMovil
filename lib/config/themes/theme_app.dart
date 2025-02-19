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

  ThemeData getTheme() => ThemeData(
    //*segun el modo oscuro o claro se cambia el brillo para los componentes de material
    brightness: isDarkMode ? Brightness.dark : Brightness.light ,
    useMaterial3: true,
    //*este color se usa solo para material components, como por ejemplo: BottomNavigationBar
    colorSchemeSeed: colorList[selectedColor],
  );

  AppTheme copyWith({
    bool? isDarkMode,
    int? selectedColor
  }) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode,
    selectedColor: selectedColor ?? this.selectedColor
  );

}