import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:get/get.dart';
import '../../controllers/detail/detail_movie_controller.dart';
import '../../controllers/wishlist/wishlist_controller.dart';
import '../../services/url_api.dart';

class DetailMoviePage extends StatefulWidget {
  final String movieId;
  const DetailMoviePage({Key? key, required this.movieId}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  final DetailMovieController controller = Get.put(DetailMovieController());
  final WishlistController watchlistcontroller = Get.put(WishlistController());
  @override
  void initState() {
    super.initState();
    controller.getDetailData(widget.movieId);
  }

  void dialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title:
                  const Text('Success', style: TextStyle(color: Colors.green)),
              content: const Text(
                'Let`s check your watchlist now',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: backgroundColor1,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    Widget poster() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                  "${Urls.imgUrl}${controller.detailMovieData.value.posterPath}"),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget movieTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          controller.detailMovieData.value.title.toString(),
          style: whiteTextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget synopsisTitleMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          "Synopsis",
          style: whiteTextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget synopsisMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          controller.detailMovieData.value.overview.toString(),
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget genreMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Genre: ${controller.genre}',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget rateMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.visibility,
              color: primaryColor,
            ),
            const SizedBox(width: 4),
            Text(
              'Release Date: ${controller.detailMovieData.value.releaseDate.toString()}',
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.star,
              color: primaryColor,
            ),
            const SizedBox(width: 4),
            Text(
              controller.detailMovieData.value.vote.toString(),
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      );
    }

    Widget watchlistButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            controller.postWatchlistData(
                controller.detailMovieData.value.id!.toString());
            dialog();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Add To Watchlist',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget removeWatchlistButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            controller.deleteWatchlistData(
                controller.detailMovieData.value.id!.toString());
            dialog();
          },
          style: TextButton.styleFrom(
            backgroundColor: dangerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Remove From Watchlist',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget castMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Cast: ${controller.cast}',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget crewMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Crew: ${controller.crew}',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            )),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                // Get.back();

                Navigator.pop(context);

                watchlistcontroller.getWatchlistData();
              },
            ),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              poster(),
              movieTitle(),
              const SizedBox(
                height: 8,
              ),
              genreMovie(),
              const SizedBox(
                height: 8,
              ),
              rateMovie(),
              const Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: Color(0xffFEA9BD),
              ),
              const SizedBox(
                height: 4,
              ),
              controller.isWatchlist.value
                  ? removeWatchlistButton()
                  : watchlistButton(),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: Color(0xffFEA9BD),
              ),
              const SizedBox(
                height: 4,
              ),
              synopsisTitleMovie(),
              const SizedBox(
                height: 4,
              ),
              synopsisMovie(),
              const SizedBox(
                height: 4,
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: Color(0xffFEA9BD),
              ),
              const SizedBox(
                height: 4,
              ),
              castMovie(),
              const SizedBox(
                height: 4,
              ),
              crewMovie(),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      }
    });
  }
}
