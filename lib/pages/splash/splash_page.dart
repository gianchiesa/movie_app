import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/theme.dart';
import '../../controllers/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo_movieapp.png',
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Movie App",
            textAlign: TextAlign.center,
            style: pinkTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          Text(
            "by Gian Chiesa Maghriza",
            style: secondaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(
            color: primaryColor,
          ),
        ]),
      ),
    );
  }
}
