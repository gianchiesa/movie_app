import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/wish_list_model.dart';

class WatchlistMoviesService {
  Future<List<WatchlistMovie>> getWatchlistMovies() async {
    // final queryParameters = {
    //   'api_key': Urls.apiKey,
    // };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session = prefs.getString('session_id').toString();
    var url = Uri.parse(
        "https://api.themoviedb.org/3/account/chiesa/watchlist/movies?api_key=59f583eafafc993371713ae20a84d390&session_id=$session");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movie = data['results'];
      List<WatchlistMovie> movies = [];

      for (var item in movie) {
        movies.add(WatchlistMovie.fromJson(item));
      }

      return movies;
    } else {
      throw Exception('Gagal Get Movies!');
    }
  }
}
