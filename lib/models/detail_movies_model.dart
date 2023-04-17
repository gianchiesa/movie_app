import 'package:movie_app/models/genre_movies_model.dart';

class DetailMovie {
  num? id;
  String? backdropPath;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  String? posterPath;
  List<GenreMovie>? genre;
  String? title;
  num? vote;
  num? popularity;

  DetailMovie(
      {required this.id,
      required this.originalTitle,
      required this.title,
      required this.overview,
      required this.backdropPath,
      required this.posterPath,
      required this.releaseDate,
      required this.genre,
      required this.vote,
      required this.popularity});

  factory DetailMovie.fromJson(Map<String, dynamic> json) {
    return DetailMovie(
      id: json['id'],
      originalTitle: json['original_title'],
      title: json['title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      vote: json['vote_average'],
      popularity: json['popularity'],
      genre: GenreMovie.fromJsonList(json['genres']),
    );
  }
}
