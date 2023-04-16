import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:get/get.dart';
import '../../controllers/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
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
            "Movie App",
            textAlign: TextAlign.center,
            style: pinkTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          Text(
            "by Gian Chiesa Maghriza",
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
              logo(),
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
