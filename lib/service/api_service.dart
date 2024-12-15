import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:movies/constants/api_const.dart';

class ApiService {
  Future<void> fetchMovie({int page = 1}) async {
    final url =
        Uri.parse("${ApiConst.baseUrl}/movie/popular?language=en-US&page=1");

    final response = await http.get(url, headers: ApiConst.headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log(data);
    } else {
      log(404);
    }
  }
}
