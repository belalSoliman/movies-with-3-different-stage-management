import 'package:flutter/material.dart';
import 'package:movies/constants/my_theme_data.dart';
import 'package:movies/view/movies_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: MyThemeData.themeDataLight,
      home: const MoviesScreen(),
    );
  }
}
