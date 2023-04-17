import 'package:get/get.dart';
import 'package:movie_app/models/cast_model.dart';
import 'package:movie_app/models/crew_model.dart';
import 'package:movie_app/models/detail_movies_model.dart';

import '../../services/credit_services.dart';
import '../../services/detail_movie_services.dart';

class DetailMovieController extends GetxController {
  var isLoading = false.obs;
  final detailMovieData = <DetailMovie>[].obs;
  final castData = <CastMovie>[].obs;
  final crewData = <CrewMovie>[].obs;
  var genre = '';
  var cast = '';
  var crew = '';

  Future<void> getDetailData(String id) async {
    isLoading.value = true;
    detailMovieData.clear();
    genre = '';
    var detailMovie =
        await DetailMoviesService().getDetailMovies(int.parse(id));
    detailMovieData.addAll(detailMovie);
    var lenghtchecker = detailMovie[0].genre!.length;
    var index = 1;
    for (var i in detailMovie[0].genre!) {
      genre += i.name.toString();
      if (index < lenghtchecker) {
        genre += ', ';
        index += 1;
      }
    }
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
    isLoading.value = false;
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
  }
}
