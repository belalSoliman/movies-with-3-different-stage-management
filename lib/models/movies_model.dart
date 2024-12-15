class MoviesModle {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  MoviesModle({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });
  factory MoviesModle.fromJson(Map<String, dynamic> json) {
    return MoviesModle(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'],
      id: json['id'],
      originCountry: json['origin_country'].cast<String>(),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      name: json['name'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
  Map<String, dynamic> toJson() {
   return{
'adult': this.adult,
    'backdrop_path' : this.backdropPath,
    'genre_ids' : this.genreIds,
    'id' : this.id,
    'origin_country' : this.originCountry,
    'original_language' : this.originalLanguage,
    'original_name' : this.originalName,
    'overview' : this.overview,
    'popularity' : this.popularity,
    'poster_path' : this.posterPath,
    'first_air_date' : this.firstAirDate,
    'name' : this.name,
    'vote_average' : this.voteAverage,
    'vote_count' : this.voteCount,
  
   }
    
  }
}
