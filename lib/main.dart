import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/constants/my_theme_data.dart';
import 'package:movies/service/init_getit.dart';
import 'package:movies/service/navigation_service/navigation_sevice.dart';
import 'package:movies/view/movies_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    print(details.exceptionAsString());
  };

  setUpLocator();

  await dotenv.load(fileName: 'assets/.env');

  runApp(ScreenUtilInit(
    designSize: const Size(360, 640),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationSevice>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: MyThemeData.themeDataLight,
      home: const MoviesScreen(),
    );
  }
}
