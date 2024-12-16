import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConst {
  static String apiKey = dotenv.get('moviesApiKey');

  static String bearkey = dotenv.get('firstValue');
  static const String baseUrl = "https://api.themoviedb.org/3";
  static Map<String, String> get headers =>
      {'Authorization': 'Bearer $bearkey ', 'accept': 'application/json'};
}
