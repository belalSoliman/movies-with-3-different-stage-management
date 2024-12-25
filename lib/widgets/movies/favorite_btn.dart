import 'package:flutter/material.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/view_models/fav_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/my_app_icons.dart';

class FavoriteBtnWidget extends StatelessWidget {
  final MovieModel movieefav;
  const FavoriteBtnWidget({super.key, required this.movieefav});

  @override
  Widget build(BuildContext context) {
    final moviesFAav = Provider.of<FavProvider>(context, listen: false);
    return IconButton(
      onPressed: () {
        moviesFAav.addMovies(movieefav);
      },
      icon: Icon(
        MyAppIcons.favoriteOutlineRounded,
        color: moviesFAav.isFav(movieefav)
            ? Colors.red
            : null, // isFavorite ? Colors.red : null,
        size: 20,
      ),
    );
  }
}
