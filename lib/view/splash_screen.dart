import 'package:flutter/material.dart';
import 'package:movies/service/init_getit.dart';
import 'package:movies/service/navigation_service/navigation_sevice.dart';
import 'package:movies/view/movies_screen.dart';
import 'package:movies/view/widget/error_widget.dart';
import 'package:movies/repository/movie_repo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isfetching = false;

  @override
  void initState() {
    super.initState();
    _fetchGenres();
  }

  Future<void> _fetchGenres() async {
    try {
      setState(() {
        _isfetching = true;
      });
      await getIt<MovieRepo>().fetchAndCacheGenres();
      setState(() {
        _isfetching = false;
      });
      getIt<NavigationSevice>().navigate(const MoviesScreen());
    } catch (e) {
      setState(() {
        _isfetching = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch genres')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isfetching
            ? const CircularProgressIndicator()
            : ErrorWidgets(
                onRetry: _fetchGenres,
              ),
      ),
    );
  }
}
