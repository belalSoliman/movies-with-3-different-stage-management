import 'package:movies/models/geners_model.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/service/api_service.dart';

class MovieRepo {
  final ApiService _apiService;
  MovieRepo(this._apiService);
  Future<List<MoviesModle>> fetchMovie({int page = 1}) async {
    return await _apiService.fetchMovie(page: page);
  }

  Future<List<Genres>> fetchgener() async {
    return await _apiService.fetchgener();
  }
}
