import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.get('moviesApiKey');
  static String bearerToken = dotenv.get('firstValue');

  static String baseUrl = "https://api.themoviedb.org/3";
  static Map<String, String> get headers => {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      };
}
