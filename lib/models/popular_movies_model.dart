class PopularMovie {
  num? id;
  String? backdropPath;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  String? posterPath;
  List? genre;
  String? title;
  num? popularity;

  PopularMovie(
      {required this.id,
      required this.originalTitle,
      required this.title,
      required this.overview,
      required this.backdropPath,
      required this.posterPath,
      required this.releaseDate,
      required this.genre,
      required this.popularity});

  factory PopularMovie.fromJson(Map<String, dynamic> json) {
    return PopularMovie(
        id: json['id'],
        originalTitle: json['original_title'],
        title: json['title'],
        overview: json['overview'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        popularity: json['popularity'],
        genre: json['genre_ids']);
  }
}
