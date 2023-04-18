import 'package:get/get.dart';
import 'package:movie_app/models/detail_movies_model.dart';

import '../../models/wish_list_model.dart';
import '../../services/watchlist_services.dart';

class WishlistController extends GetxController {
  var isLoading = false.obs;
  final watchlistMovieList = <WatchlistMovie>[].obs;
  final testing = <DetailMovie>[].obs;

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

  Future<void> getWatchlistData() async {
    watchlistMovieList.clear();
    List<WatchlistMovie> watchlistMovieData =
        await WatchlistMoviesService().getWatchlistMovies();
    watchlistMovieList.addAll(watchlistMovieData);
  }
}
