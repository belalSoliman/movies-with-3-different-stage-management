import 'package:flutter/material.dart';
import 'package:movies/models/movies_genre.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/repository/movies_repo.dart';
import 'package:movies/service/init_getit.dart';

class MoviesProvider with ChangeNotifier {
  final List<MovieModel> _moviesList = [];
  List<MovieModel> get movies => _moviesList;
  List<MoviesGenre> _genersList = [];
  List<MoviesGenre> get genersList => _genersList;
  int _currentPage = 1;
  bool _isloading = false;
  bool get isLoading => _isloading;

  final MoviesRepository moviesRepository = getIt<MoviesRepository>();
  Future<void> getMovies() async {
    _isloading = true;
    notifyListeners();
    try {
      if (_genersList.isEmpty) {
        _genersList = await moviesRepository.fetchGenres();
      }
      List<MovieModel> movies =
          await moviesRepository.fetchMovies(page: _currentPage);

      _moviesList.addAll(movies);
      _currentPage++;
    } catch (e) {
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
