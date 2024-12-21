import 'package:flutter/material.dart';
import 'package:movies/constants/my_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String themeKey = "theme_mode";
  ThemeData _themeData;

  ThemeProvider() : _themeData = MyThemeData.lightTheme {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(themeKey) ?? false;
    _themeData = isDarkMode ? MyThemeData.darkTheme : MyThemeData.lightTheme;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = _themeData == MyThemeData.darkTheme;
    _themeData = isDarkMode ? MyThemeData.lightTheme : MyThemeData.darkTheme;
    await prefs.setBool(themeKey, !isDarkMode);
    notifyListeners();
  }
}
