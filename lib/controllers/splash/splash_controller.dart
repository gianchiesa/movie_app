import 'dart:async';
import 'package:get/get.dart';

import '../../pages/home/dashboard_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 2), () {
      Get.off(const DashboardPage());
    });
  }
}
