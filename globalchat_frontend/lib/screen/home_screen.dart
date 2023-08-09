import 'dart:io';
import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:globalchat_flutter/screen/home_pages/chat_page.dart';
import 'package:globalchat_flutter/screen/home_pages/profile_page.dart';
import 'package:globalchat_flutter/screen/home_pages/shop_page.dart';
import 'package:globalchat_flutter/widget/app_bar/main_appbar.dart';
import 'package:globalchat_flutter/widget/app_bar/profile_appbar.dart';
import 'package:globalchat_flutter/widget/app_bar/shop_appbar.dart';
import 'package:provider/provider.dart';

import '../util/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _index = 0;
  List<Widget> pages = [];
  List<AppBar> appbars = [];
  Random random = Random(4664);

  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();
    return Scaffold(
      backgroundColor: Styles.COLOR_BACKGROUND,
      appBar: appbars[_index],
      body: pages[_index],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.white,
        inactiveColor: Styles.COLOR_BOTTOM_BAR,
        backgroundColor: Styles.COLOR_MAIN,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
        icons: const [
          Icons.public,
          Icons.shopping_cart,
          Icons.account_circle,
        ],
        activeIndex: _index,
        onTap: (index) => setState(() => _index = index),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pages.add( ChatPage());
    pages.add(const ShopPage());
    pages.add(const ProfilPage());

    AppBar mainAppbar = MainAppBar();
    AppBar shopAppbar = ShopAppBar();
    AppBar profileAppbar = ProfileAppBar();
    appbars.add(mainAppbar);
    appbars.add(shopAppbar);
    appbars.add(profileAppbar);
  }

  @override
  void dispose() {
    super.dispose();
    pages.clear();
    appbars.clear();
  }
}
