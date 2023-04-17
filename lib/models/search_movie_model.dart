class SearchMovie {
  num? id;
  String? backdropPath;
  String? originalTitle;
  String? posterPath;
  List? genre;
  String? title;

  SearchMovie({
    required this.id,
    required this.originalTitle,
    required this.title,
    required this.posterPath,
    required this.genre,
  });

  factory SearchMovie.fromJson(Map<String, dynamic> json) {
    return SearchMovie(
        id: json['id'],
        originalTitle: json['original_title'],
        title: json['title'],
        posterPath: json['poster_path'],
        genre: json['genre_ids']);
  }
}
