import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/constants/api_const.dart';
import 'package:movies/models/geners_model.dart';
import 'package:movies/models/movies_model.dart';

class ApiService {
  Future<List<MoviesModle>> fetchMovie({int page = 1}) async {
    final url = Uri.parse(
        "${ApiConst.baseUrl}/movie/popular?language=en-US&page=$page");

    final response = await http.get(url, headers: ApiConst.headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List.from(data['results'].map((ele) => MoviesModle.fromJson(ele)));
    } else {
      throw Exception("dasdasd");
    }
  }

  Future<List<Genres>> fetchgener() async {
    final url =
        Uri.parse("${ApiConst.baseUrl}/genre/movie/list?language=en-US");

    final response = await http.get(url, headers: ApiConst.headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Genres>.from(
          data['genres'].map((genre) => Genres.fromJson(genre)));
    } else {
      throw Exception('Failed to fetch genres');
    }
  }
}
