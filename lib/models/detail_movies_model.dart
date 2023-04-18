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
      {this.id,
      this.originalTitle,
      this.title,
      this.overview,
      this.backdropPath,
      this.posterPath,
      this.releaseDate,
      this.genre,
      this.vote,
      this.popularity});

  DetailMovie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalTitle = json['original_title'];
    title = json['title'];
    overview = json['overview'];
    backdropPath = json['backdrop_path'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    vote = json['vote_average'];
    popularity = json['popularity'];
    genre = GenreMovie.fromJsonList(json['genres']);
  }
}
