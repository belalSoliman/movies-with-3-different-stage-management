import 'package:flutter/material.dart';
import 'package:movies/view/widget/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ErrorWidgets(
          onRetry: () {},
        ),
      ),
    );
  }
}
