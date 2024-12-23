import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/screens/splash_screen.dart';
import 'package:movies/view_models/movies_provider.dart';
import 'package:movies/view_models/theme_provider.dart';
import 'package:provider/provider.dart';

import 'service/init_getit.dart';
import 'service/navigation_service.dart';

void main() {
  setupLocator(); // Initialize GetIt
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]).then((_) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Movies App',
            theme: themeProvider.themeData,
            home: const SplashScreen(),
            // const SplashScreen(), //const MovieDetailsScreen(), //const FavoritesScreen(), //const MoviesScreen(),
          );
        },
      ),
    );
  }
}
