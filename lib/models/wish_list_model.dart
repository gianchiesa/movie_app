class WatchlistMovie {
  num? id;
  String? backdropPath;
  String? originalTitle;
  String? posterPath;
  List? genre;
  String? title;

  WatchlistMovie({
    required this.id,
    required this.originalTitle,
    required this.title,
    required this.posterPath,
    required this.genre,
  });

  factory WatchlistMovie.fromJson(Map<String, dynamic> json) {
    return WatchlistMovie(
        id: json['id'],
        originalTitle: json['original_title'],
        title: json['title'],
        posterPath: json['poster_path'],
        genre: json['genre_ids']);
  }
}
