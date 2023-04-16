import 'package:get/get.dart';
import 'package:movie_app/models/popular_movies_model.dart';

import '../../models/toprated_movies_model.dart';
import '../../services/popular_movies_services.dart';
import '../../services/toprated_movie_services.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  final popularMovieList = <PopularMovie>[].obs;
  final topRatedMovieList = <TopRatedMovie>[].obs;
  @override
  void onInit() {
    getPopularData();
    getTopRatedData();
    super.onInit();
  }

  List idTostr(List? genre) {
    List genreStr = [];
    for (var i in genre!) {
      if (i == 28) {
        genreStr.add('Action');
      } else if (i == 12) {
        genreStr.add('Adventure');
      } else if (i == 16) {
        genreStr.add('Animation');
      } else if (i == 35) {
        genreStr.add('Comedy');
      } else if (i == 80) {
        genreStr.add('Crime');
      } else if (i == 99) {
        genreStr.add('Documentary');
      } else if (i == 18) {
        genreStr.add('Drama');
      } else if (i == 14) {
        genreStr.add('Fantasy');
      } else if (i == 10751) {
        genreStr.add('Family');
      } else if (i == 36) {
        genreStr.add('History');
      } else if (i == 10402) {
        genreStr.add('Music');
      } else if (i == 9648) {
        genreStr.add('Mistery');
      } else if (i == 10749) {
        genreStr.add('Romance');
      } else if (i == 878) {
        genreStr.add('Sci-Fi');
      } else if (i == 53) {
        genreStr.add('Thriller');
      } else {
        genreStr.add("Other");
      }
    }
    return genreStr;
  }

  Future<void> getPopularData() async {
    isLoading.value = true;
    popularMovieList.clear();
    List<PopularMovie> popularMovieData =
        await PopularMoviesService().getPopularMovies();
    popularMovieList.addAll(popularMovieData);
    isLoading.value = false;
  }

  Future<void> getTopRatedData() async {
    isLoading.value = true;
    topRatedMovieList.clear();
    List<TopRatedMovie> topRatedMovieData =
        await TopRatedMoviesService().getTopRatedMovies();
    topRatedMovieList.addAll(topRatedMovieData);
    isLoading.value = false;
  }
}
