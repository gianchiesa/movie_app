import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/theme.dart';

import '../../controllers/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Get.put(HomeController(), permanent: false);

    Widget title() {
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
              'Welcome, Yubi Tech',
              style: pinkTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
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
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return ListView(
          children: [
            title(),
            const SizedBox(
              height: 10,
            )
          ],
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
