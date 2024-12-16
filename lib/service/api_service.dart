import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movies/constants/api_const.dart';
import 'package:movies/models/geners_model.dart';

class ApiService {
  Future<void> fetchMovie({int page = 1}) async {
    final url = Uri.parse(
        "${ApiConst.baseUrl}/movie/popular?language=en-US&page=$page");

    try {
      final response = await http.get(url, headers: ApiConst.headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
      } else {}
    } catch (e) {
      log('Error fetching movie: $e');
    }
  }

  Future<List<Genres>> fetchgener() async {
    final url = Uri.parse("${ApiConst.baseUrl}/genre/movie/list?language=en");

    final generResponse = await http.get(url, headers: ApiConst.headers);
    if (generResponse.statusCode == 200) {
      final data = jsonDecode(generResponse.body);
      return List.from(data['genres'].map((ele) => Genres.fromJson(ele)));
    } else {
      throw Exception("faild");
    }
  }
}
