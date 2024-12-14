import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/constants/my_theme_data.dart';
import 'package:movies/view/splash_screen.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(360, 640),
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: MyThemeData.themeDataLight,
      home: const SplashScreen(),
    );
  }
}
