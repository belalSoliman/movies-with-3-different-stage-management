import 'package:flutter/material.dart';
import 'package:movies/service/api_service.dart';
import 'package:movies/service/init_getit.dart';
import 'package:movies/view/widget/error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isfetching = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isfetching = true;
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
