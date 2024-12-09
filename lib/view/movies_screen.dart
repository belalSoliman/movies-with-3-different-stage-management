//movies screen main screen

import 'package:flutter/material.dart';
import 'package:movies/view/widget/custom_appbar.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      children: [
        CustomAppbar(),
      ],
    ))));
  }
}
