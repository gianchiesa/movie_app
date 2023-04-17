import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/detail_movies_model.dart';

class DetailMoviesService {
  Future<List<DetailMovie>> getDetailMovies(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id?api_key=59f583eafafc993371713ae20a84d390");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // var movie = data['results'];
      List<DetailMovie> movies = [];
      movies.add(DetailMovie.fromJson(data));
      return movies;
    } else {
      throw Exception('Gagal Get Movies!');
    }
  }
}
