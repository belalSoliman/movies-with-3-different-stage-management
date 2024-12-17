import 'package:flutter/material.dart';
import 'package:movies/models/geners_model.dart';
import 'package:movies/service/api_service.dart';
import 'package:movies/service/init_getit.dart';
import 'package:movies/service/navigation_service/navigation_sevice.dart';
import 'package:movies/view/movies_screen.dart';
import 'package:movies/view/widget/error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isfetching = false;
  final List<Genres> _genres = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetcgeners();
  }

  Future<void> _fetcgeners() async {
    try {
      setState(() {
        _isfetching = true;
      });
      final List<Genres> genr = await getIt<ApiService>().fetchgener();
      setState(() {
        _genres.addAll(genr);
        getIt<NavigationSevice>().navigate(MoviesScreen(
          genrz: _genres,
        ));
        print(_genres);
      });
    } catch (e) {
      throw Exception("dssd");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isfetching
            ? const CircularProgressIndicator()
            : ErrorWidgets(
                onRetry: () {},
              ),
      ),
    );
  }
}
