import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/toprated_movies_model.dart';

class TopRatedMoviesService {
  Future<List<TopRatedMovie>> getTopRatedMovies() async {
    // final queryParameters = {
    //   'api_key': Urls.apiKey,
    // };
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=59f583eafafc993371713ae20a84d390");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movie = data['results'];
      List<TopRatedMovie> movies = [];

      for (var item in movie) {
        movies.add(TopRatedMovie.fromJson(item));
      }

      return movies;
    } else {
      throw Exception('Gagal Get Movies!');
    }
  }
}
