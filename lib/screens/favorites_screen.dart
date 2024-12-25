import 'package:flutter/material.dart';
import 'package:movies/view_models/fav_provider.dart';
import 'package:provider/provider.dart';

import '../constants/my_app_icons.dart';
import '../widgets/movies/movies_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyAppIcons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Consumer<FavProvider>(
        builder: (context, FavProvider fav, child) {
          return ListView.builder(
            itemCount: fav.movies.length,
            itemBuilder: (context, index) {
              final movie = fav.movies[index];

              return ChangeNotifierProvider.value(
                  value: movie,
                  child: const MoviesWidget()); //const Text("data");
            },
          );
        },
      ),
    );
  }
}
