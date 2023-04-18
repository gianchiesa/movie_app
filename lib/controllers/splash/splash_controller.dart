import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/home/dashboard_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../pages/home/init_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/authentication/token/new?api_key=59f583eafafc993371713ae20a84d390");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    // ignore: unused_local_variable
    String token = '';
    if (response.statusCode == 200) {
      token += data['request_token'];
    } else {
      token = '';
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session = prefs.getString('session_id').toString();
    Timer(const Duration(seconds: 2), () {
      if (session == 'null') {
        Get.off(InitPage(
          token: token,
        ));
      } else {
        Get.off(const DashboardPage());
      }
    });
  }
}
