import 'package:flutter/material.dart';

class MyThemeData {
  static final ThemeData themeDataLight = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      colorScheme: const ColorScheme.light(
        surface: Color.fromARGB(26, 13, 184, 246),
      ));
  static final ThemeData themeDataDark = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      colorScheme: const ColorScheme.dark());
}
