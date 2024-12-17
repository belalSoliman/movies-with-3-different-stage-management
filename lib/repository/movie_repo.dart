import 'package:movies/models/geners_model.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/service/api_service.dart';
import 'package:movies/service/init_getit.dart';

class MovieRepo {
  final ApiService _apiService;
  MovieRepo(this._apiService);
  Future<List<MoviesModle>> fetchMovie({int page = 1}) async {
    return await _apiService.fetchMovie(page: page);
  }

  List<Genres> cachedGeners = [];

  Future<void> fetchAndCacheGenres() async {
    final List<Genres> genres = await getIt<ApiService>().fetchgener();
    cachedGeners = genres;
  }
}
