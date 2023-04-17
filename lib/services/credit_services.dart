import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/crew_model.dart';

import '../models/cast_model.dart';

class CreditService {
  Future<List<CrewMovie>> getCrew(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=59f583eafafc993371713ae20a84d390");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movie = data['crew'];
      List<CrewMovie> crew = [];

      for (var item in movie) {
        crew.add(CrewMovie.fromJson(item));
      }

      return crew;
    } else {
      throw Exception('Gagal Get Crew!');
    }
  }

  Future<List<CastMovie>> getCast(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=59f583eafafc993371713ae20a84d390");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movie = data['cast'];
      List<CastMovie> cast = [];

      for (var item in movie) {
        cast.add(CastMovie.fromJson(item));
      }

      return cast;
    } else {
      throw Exception('Gagal Get Cast!');
    }
  }
}
