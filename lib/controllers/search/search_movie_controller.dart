import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/search_movie_model.dart';
import '../../services/search_services.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  final searchMovieList = <SearchMovie>[].obs;
  TextEditingController searchController = TextEditingController();

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

  Future<void> getSearchData(String keyword) async {
    searchMovieList.clear();
    List<SearchMovie> searchMovieData =
        await SearchMoviesService().getSearchMovies(keyword);
    searchMovieList.addAll(searchMovieData);
  }
}
