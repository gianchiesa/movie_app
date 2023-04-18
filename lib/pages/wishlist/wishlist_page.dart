import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:get/get.dart';
import '../../controllers/wishlist/wishlist_controller.dart';
import '../../services/url_api.dart';
import '../detail/detail_movie_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistController controller = Get.put(WishlistController());

  @override
  void initState() {
    super.initState();
    controller.getWatchlistData();
  }

  @override
  Widget build(BuildContext context) {
    Widget listWatchlist() {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.watchlistMovieList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailMoviePage(
                                movieId: controller.watchlistMovieList[index].id
                                    .toString(),
                              )));
                }),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Color(0xff151515)),
                  margin: const EdgeInsets.only(top: 16, right: 20, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: controller
                                        .watchlistMovieList[index].posterPath ==
                                    null
                                ? const AssetImage('assets/logo_movieapp.png')
                                    as ImageProvider
                                : NetworkImage(
                                    '${Urls.imgUrl}${controller.watchlistMovieList[index].posterPath.toString()}'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.watchlistMovieList[index].title
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              controller
                                  .idTostr(controller
                                      .watchlistMovieList[index].genre)
                                  .toString(),
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
      );
    }

    Widget watchlistTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          "Movie Watchlist",
          style: pinkTextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget subtitleMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'This is your watchlist movies here!',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget emptyList() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo_movieapp.png',
                ),
              ),
            ),
          ),
          Text(
            "You have not watch list movie",
            textAlign: TextAlign.center,
            style: pinkTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          Text(
            "Let's add watchlist movie first",
            style: secondaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          )
        ]),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              watchlistTitle(),
              const SizedBox(
                height: 8,
              ),
              subtitleMovie(),
              const Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: Color(0xffFEA9BD),
              ),
              const SizedBox(
                height: 4,
              ),
              controller.watchlistMovieList.isEmpty
                  ? emptyList()
                  : listWatchlist()
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
