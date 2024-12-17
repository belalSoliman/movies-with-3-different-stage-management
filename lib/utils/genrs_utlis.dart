import 'package:movies/models/geners_model.dart';
import 'package:movies/repository/movie_repo.dart';
import 'package:movies/service/init_getit.dart';

class GenrsUtlis {
  static List<Genres> genersNames(List<int> genId) {
    final movieRepo = getIt<MovieRepo>();
    final List<Genres> generss = [];
    for (var id in genId) {
      final genre = movieRepo.cachedGeners.firstWhere(
        (g) => g.id == id,
        orElse: () => Genres(id: 21212, name: "Unknown"),
      );
      generss.add(genre);
    }
    return generss;
  }
}
