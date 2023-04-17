import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:get/get.dart';
import '../../controllers/search/search_movie_controller.dart';
import '../../services/url_api.dart';

class SearchMoviePage extends StatelessWidget {
  SearchMoviePage({Key? key}) : super(key: key);

  final SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    Widget movieTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          "Search Movie",
          style: pinkTextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
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
          'Find you favorite movies here!',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget searchInputMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: TextFormField(
          controller: controller.searchController,
          onChanged: ((value) async {
            controller.getSearchData(value);
          }),
          style: const TextStyle(color: Colors.grey),
          decoration: InputDecoration(
              hintText: "Search Movies",
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: backgroundColor3,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none)),
        ),
      );
    }

    Widget listSearch() {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.searchMovieList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (() {}),
                child: Container(
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
                                        .searchMovieList[index].posterPath ==
                                    null
                                ? const AssetImage('assets/logo_movieapp.png')
                                    as ImageProvider
                                : NetworkImage(
                                    '${Urls.imgUrl}${controller.searchMovieList[index].posterPath.toString()}'),
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
                              controller.searchMovieList[index].title
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
                                  .idTostr(
                                      controller.searchMovieList[index].genre)
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

    Widget logo() {
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
            "Cannot find the movie",
            textAlign: TextAlign.center,
            style: pinkTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          Text(
            "Please try with another keyword",
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              movieTitle(),
              const SizedBox(
                height: 8,
              ),
              genreMovie(),
              const SizedBox(
                height: 8,
              ),
              searchInputMovie(),
              const SizedBox(
                height: 20,
              ),
              controller.searchMovieList.isEmpty ? logo() : listSearch()
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
