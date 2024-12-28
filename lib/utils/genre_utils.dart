import 'package:movies/models/movies_genre.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenresNames(List<int> genreIds) {
    final cachedGenres = []; //TODO: We need to get the correct cachedGenres
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
