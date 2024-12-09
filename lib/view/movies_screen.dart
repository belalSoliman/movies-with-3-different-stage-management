//movies screen main screen

import 'package:flutter/material.dart';
import 'package:movies/view/widget/custom_appbar.dart';
import 'package:movies/view/widget/movies_item.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      children: [
        const CustomAppbar(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 100,
          itemBuilder: (context, index) {
            return const MoviesItem();
          },
        ),
      ],
    ))));
  }
}
