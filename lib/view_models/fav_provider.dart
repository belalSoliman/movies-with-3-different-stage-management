import 'package:flutter/material.dart';
import 'package:movies/models/movies_model.dart';

class FavProvider with ChangeNotifier {
  final List<MovieModel> _moviesList = [];

  List<MovieModel> get movies => _moviesList;

  void addMovies(MovieModel movie) {
    if (!_moviesList.contains(movie)) {
      _moviesList.add(movie);
      notifyListeners();
    }
  }

  void removeFav(MovieModel movie) {
    // Corrected method name
    if (_moviesList.contains(movie)) {
      _moviesList.remove(movie);
      notifyListeners();
    }
  }

  bool isFav(MovieModel movie) {
    return _moviesList.contains(movie); // Simplified method
  }
}
