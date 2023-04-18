import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/home/init_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dashboard_page.dart';

class InitPage extends StatefulWidget {
  final String token;
  const InitPage({Key? key, required this.token}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  late SharedPreferences prefs;
  final InitController controller = Get.put(InitController());
  @override
  void initState() {
    initSharedPrefs(widget.token);
    super.initState();
  }

  void initSharedPrefs(String token) async {
    prefs = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    final response = await http.post(
      Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=59f583eafafc993371713ae20a84d390'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "username": 'chiesa',
        "password": '12345678',
        "request_token": token
      },
    );
  }

  void startedApp() async {
    final response = await http.post(
      Uri.parse(
          'https://api.themoviedb.org/3/authentication/session/new?api_key=59f583eafafc993371713ae20a84d390'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "request_token": widget.token,
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var mySession = data['session_id'];
      prefs.setString(
        'session_id',
        mySession,
      );
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashboardPage()));
    } else {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Started Error',
                    style: TextStyle(color: Colors.red)),
                content: const Text(
                  'Silahkan Coba Lagi/Restart',
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
  }

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

    Widget getStartedButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            startedApp();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Get Started',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
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
                height: 24,
              ),
              getStartedButton()
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
