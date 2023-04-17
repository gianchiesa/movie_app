import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/pages/detail/detail_movie_page.dart';
import 'package:movie_app/services/url_api.dart';
import 'package:movie_app/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../controllers/home/home_controller.dart';
import '../search/search_movie_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    Widget popularTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Movies',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              'More',
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget topRatedTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Rated Movies',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              'More',
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget carouselSlider() {
      return CarouselSlider(
        options: CarouselOptions(
          height: 190.0,
          enlargeCenterPage: true,
        ),
        items: controller.popularMovieList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailMoviePage(
                                movieId: i.id.toString(),
                              )));
                }),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: backgroundColor3.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                3, 12), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(children: [
                          Image.network(
                            "${Urls.imgUrl}${i.backdropPath.toString()}",
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.9)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.2, 0.90]),
                          ))),
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  i.title.toString(),
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.idTostr(i.genre).toString(),
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                                Text(
                                  'Popularity: ${i.popularity.toString()}',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      )),
                ),
              );
            },
          );
        }).toList(),
      );
    }

    Widget topRated() {
      return SizedBox(
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.topRatedMovieList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailMoviePage(
                                movieId: controller.topRatedMovieList[index].id
                                    .toString(),
                              )));
                }),
                child: Container(
                  margin: const EdgeInsets.only(right: 4, left: 16),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: backgroundColor3.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  3, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "${Urls.imgUrl}${controller.topRatedMovieList[index].posterPath}",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 180,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        controller.topRatedMovieList[index].title.toString(),
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: primaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            controller.topRatedMovieList[index].vote.toString(),
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            })),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor3,
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            )),
            title: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: pinkTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        'Yubi Technology',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xffFEA9BD),
                    child: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(
                          'assets/yubi_logo.png',
                        )),
                  )
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 20, left: 16, right: 16),
                  child: TextFormField(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchMoviePage()));
                    },
                    readOnly: true,
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        hintText: "Search Movies",
                        hintStyle: const TextStyle(color: Colors.grey),
                        fillColor: backgroundColor1,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none)),
                  ),
                )),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              popularTitle(),
              const SizedBox(
                height: 16,
              ),
              carouselSlider(),
              const SizedBox(
                height: 16,
              ),
              topRatedTitle(),
              const SizedBox(
                height: 16,
              ),
              topRated(),
              const SizedBox(
                height: 32,
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
