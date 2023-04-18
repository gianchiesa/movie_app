import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/theme.dart';

import '../../controllers/home/dashboard_controller.dart';
import '../profile/profile_page.dart';
import '../wishlist/wishlist_page.dart';
import 'home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late String username;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                const WishlistPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: transparentColor,
            color: backgroundColor3,
            height: 80,
            buttonBackgroundColor: primaryColor,
            onTap: controller.changeTabIndex,
            index: controller.tabIndex,
            items: [
              CurvedNavigationBarItem(
                  child: const Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                  label: 'Home',
                  labelStyle: controller.tabIndex == 0
                      ? const TextStyle(color: Color(0xffFEA9BD))
                      : const TextStyle(color: Colors.white)),
              CurvedNavigationBarItem(
                  child: const Icon(
                    Icons.watch_later,
                    size: 30,
                    color: Colors.white,
                  ),
                  label: 'Watchlist',
                  labelStyle: controller.tabIndex == 1
                      ? const TextStyle(color: Color(0xffFEA9BD))
                      : const TextStyle(color: Colors.white)),
              CurvedNavigationBarItem(
                  child: const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  ),
                  label: 'Credit',
                  labelStyle: controller.tabIndex == 2
                      ? const TextStyle(color: Color(0xffFEA9BD))
                      : const TextStyle(color: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}
