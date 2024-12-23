import 'package:flutter/material.dart';
import 'package:movies/screens/movies_screen.dart';
import 'package:movies/service/init_getit.dart';
import 'package:movies/service/navigation_service.dart';
import 'package:movies/view_models/movies_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDataAndNavigate();
    });
  }

  Future<void> _loadDataAndNavigate() async {
    try {
      await Provider.of<MoviesProvider>(context, listen: false).getMovies();
      // Once the data is fetched, navigate
      getIt<NavigationService>().navigateReplace(const MoviesScreen());
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
