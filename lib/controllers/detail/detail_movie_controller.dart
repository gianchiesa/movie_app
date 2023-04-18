// ignore_for_file: unused_import

import 'dart:developer';

import 'package:get/get.dart';
import 'package:movie_app/models/cast_model.dart';
import 'package:movie_app/models/crew_model.dart';
import 'package:movie_app/models/detail_movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/credit_services.dart';
import '../../services/detail_movie_services.dart';

class DetailMovieController extends GetxController {
  var isLoading = false.obs;
  final detailMovieData = DetailMovie().obs;
  final castData = <CastMovie>[].obs;
  final crewData = <CrewMovie>[].obs;
  var genre = '';
  var cast = '';
  var crew = '';
  var isWatchlist = false.obs;

  Future<void> getDetailData(String id) async {
    isLoading.value = true;
    genre = '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String watchlistId = prefs.getString('watchlist$id').toString();
    DetailMovie detailMovie =
        await DetailMoviesService().getDetailMovies(int.parse(id));
    detailMovieData.value = detailMovie;
    var lenghtchecker = detailMovie.genre!.length;
    var index = 1;
    for (var i in detailMovie.genre!) {
      genre += i.name.toString();
      if (index < lenghtchecker) {
        genre += ', ';
        index += 1;
      }
    }
    if (id == watchlistId) {
      isWatchlist.value = true;
    } else {
      isWatchlist.value = false;
    }
    getCastData(id);
  }

  Future<void> getCastData(String id) async {
    isLoading.value = true;
    castData.clear();
    cast = '';
    List<CastMovie> castMovieData =
        await CreditService().getCast(int.parse(id));
    castData.addAll(castMovieData);
    for (var i in castMovieData) {
      var index = castMovieData.indexOf(i);
      if (index < 6) {
        cast += i.name.toString();

        if (index < 5) {
          cast += ', ';
        }
      } else {
        break;
      }
    }
    getCrewData(id);
  }

  Future<void> getCrewData(String id) async {
    crewData.clear();
    crew = '';
    List<CrewMovie> crewMovieData =
        await CreditService().getCrew(int.parse(id));
    crewData.addAll(crewMovieData);
    for (var i in crewMovieData) {
      var index = crewMovieData.indexOf(i);
      if (index < 6) {
        crew += i.name.toString();
        if (index < 5) {
          crew += ', ';
        }
      } else {
        break;
      }
    }
    isLoading.value = false;
  }

  Future<void> postWatchlistData(String mediaId) async {
    isWatchlist.value = true;
    // ignore: unused_local_variable
    bool value = await DetailMoviesService().postWatchlist(
        mediaType: 'movie', mediaId: int.parse(mediaId), watchlist: true);
  }

  Future<void> deleteWatchlistData(String mediaId) async {
    isWatchlist.value = false;
    // ignore: unused_local_variable
    bool value = await DetailMoviesService().deleteWatchlist(
        mediaType: 'movie', mediaId: int.parse(mediaId), watchlist: false);
  }
}
