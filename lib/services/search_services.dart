import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/search_movie_model.dart';

class SearchMoviesService {
  Future<List<SearchMovie>> getSearchMovies(String keyword) async {
    // final queryParameters = {
    //   'api_key': Urls.apiKey,
    // };

    String key = keyword.replaceAll(RegExp('\\s+'), '+');
    var url = Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=59f583eafafc993371713ae20a84d390&query=$key&page=1");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movie = data['results'];
      List<SearchMovie> movies = [];

      for (var item in movie) {
        movies.add(SearchMovie.fromJson(item));
      }

      return movies;
    } else {
      throw Exception('Gagal Get Movies!');
    }
  }
}
