import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/detail_movies_model.dart';

class DetailMoviesService {
  Future<DetailMovie> getDetailMovies(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id?api_key=59f583eafafc993371713ae20a84d390");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // var movie = data['results'];
      DetailMovie movies = DetailMovie.fromJson(data);
      return movies;
    } else {
      throw Exception('Gagal Get Movies!');
    }
  }

  Future<bool> postWatchlist({
    required String? mediaType,
    required int? mediaId,
    required bool? watchlist,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session = prefs.getString('session_id').toString();
    var data = {
      "media_type": mediaType,
      "media_id": mediaId,
      "watchlist": watchlist,
    };
    var watch = jsonEncode(data);
    // var watch = jsonEncode(data);
    final response = await http.post(
      Uri.parse(
          'https://api.themoviedb.org/3/account/chiesa/watchlist?api_key=59f583eafafc993371713ae20a84d390&session_id=$session'),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      encoding: Encoding.getByName('utf-8'),
      body: watch,
    );
    prefs.setString("watchlist$mediaId", mediaId.toString());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteWatchlist({
    required String? mediaType,
    required int? mediaId,
    required bool? watchlist,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session = prefs.getString('session_id').toString();
    var data = {
      "media_type": mediaType,
      "media_id": mediaId,
      "watchlist": watchlist,
    };
    var watch = jsonEncode(data);
    // var watch = jsonEncode(data);
    final response = await http.post(
      Uri.parse(
          'https://api.themoviedb.org/3/account/chiesa/watchlist?api_key=59f583eafafc993371713ae20a84d390&session_id=$session'),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      encoding: Encoding.getByName('utf-8'),
      body: watch,
    );
    prefs.remove("watchlist$mediaId");

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
