import 'package:flutter/material.dart';
import 'package:movies/models/movies_genre.dart';
import 'package:movies/view_models/movies_provider.dart';
import 'package:provider/provider.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenresNames(
      List<int> genreIds, BuildContext context) {
    final movies = Provider.of<MoviesProvider>(context, listen: false);

    final cachedGenres = movies.genersList;
    List<MoviesGenre> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenre(id: 5448484, name: 'Unknown'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
