class TopRatedMovie {
  num? id;
  String? backdropPath;
  String? originalTitle;
  String? posterPath;
  String? title;
  String? releaseDate;
  num? vote;

  TopRatedMovie(
      {required this.id,
      required this.originalTitle,
      required this.title,
      required this.backdropPath,
      required this.releaseDate,
      required this.posterPath,
      required this.vote});

  factory TopRatedMovie.fromJson(Map<String, dynamic> json) {
    return TopRatedMovie(
        id: json['id'],
        originalTitle: json['original_title'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        vote: json['vote_average']);
  }
}
