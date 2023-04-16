import 'package:flutter/services.dart';
import 'package:movie_app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff151515),
    statusBarColor: Color(0xff151515), // Status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      home: SplashPage(),
    );
  }
}
