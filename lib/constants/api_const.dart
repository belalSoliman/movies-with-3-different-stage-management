class ApiConst {
  static const String apiKey = "e7c736d727b558e620648fa10a04e3e8";
  static const String bearkey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlN2M3MzZkNzI3YjU1OGU2MjA2NDhmYTEwYTA0ZTNlOCIsIm5iZiI6MTczNDIxODA5OC45NjYsInN1YiI6IjY3NWUxMTcyNWQ3MDM0ZGI1YTQ5MTE1NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.m62ddg6sX91Nl3O14GyA5NGf1sQESjM1rWgZLWZHBuQ";
  static const String baseUrl = "'https://api.themoviedb.org/3";
  static Map<String, String> get headers =>
      {'Authorization': '$bearkey ', 'accept': 'application/json'};
}
