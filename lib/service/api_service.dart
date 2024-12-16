import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movies/constants/api_const.dart';

class ApiService {
  Future<void> fetchMovie({int page = 1}) async {
    final url = Uri.parse(
        "${ApiConst.baseUrl}/movie/popular?language=en-US&page=$page");

    try {
      log(ApiConst.apiKey);
      log(ApiConst.bearkey);
      final response = await http.get(url, headers: ApiConst.headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Response data: $data');
      } else {
        print('Failed to fetch movie. Status code: ${response.statusCode}');
        log('Failed to fetch movie. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching movie: $e');
      log('Error fetching movie: $e');
    }
  }
}
