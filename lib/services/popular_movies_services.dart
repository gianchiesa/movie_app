import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/popular_movies_model.dart';

class PopularMoviesService {
  Future<List<PopularMovie>> getPopularMovies() async {
    // final queryParameters = {
    //   'api_key': Urls.apiKey,
    // };
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=59f583eafafc993371713ae20a84d390");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movie = data['results'];
      List<PopularMovie> movies = [];

      for (var item in movie) {
        movies.add(PopularMovie.fromJson(item));
      }

      return movies;
    } else {
      throw Exception('Gagal Get Movies!');
    }
  }
}
