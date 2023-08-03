import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:globalchat_flutter/screen/home_pages/chat_page.dart';
import 'package:globalchat_flutter/screen/home_pages/profile_page.dart';
import 'package:globalchat_flutter/screen/home_pages/shop_page.dart';

import '../util/constants.dart';

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
    return Scaffold(
      backgroundColor: Constants.COLOR_BACKGROUND,
      appBar: appbars[_index],
      body: pages[_index],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.white,
        inactiveColor: Constants.COLOR_BACKGROUND,
        backgroundColor: Constants.COLOR_MAIN,
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
    pages.add(const ChatPage());
    pages.add(const ShopPage());
    pages.add(const ProfilPage());

    AppBar mainAppbar = AppBar(
      iconTheme: const IconThemeData(
        color: Constants.COLOR_MAIN, //change your color here
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Constants.COLOR_MAIN,
      centerTitle: false,
      title: Image.asset(
        "assets/appbar.png",
        fit: BoxFit.contain,
        height: 36,
      ),
      actions: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.people_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              showOnlineUsers(context);
              // Get.to(() => const WishListScreen());
            }),
        PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Settings"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("About"),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text("Exit"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("My account menu is selected.");
              } else if (value == 1) {
                print("Settings menu is selected.");
              } else if (value == 2) {
                print("Logout menu is selected.");
              }
            }),
        // IconButton(icon: const Icon(Icons.location_city, color: Colors.white,), onPressed: () {}),
      ],
    );
    AppBar shopAppbar = AppBar(
      iconTheme: const IconThemeData(
        color: Constants.COLOR_MAIN, //change your color here
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Constants.COLOR_MAIN,
      centerTitle: false,
      title: Image.asset(
        "assets/shop.png",
        fit: BoxFit.contain,
        height: 36,
      ),
      actions: <Widget>[
        Row(
          children: [
            const Text("19023"),
            SizedBox(
              width: 4,
            ),
            CircleAvatar(
              maxRadius: 12,
              foregroundImage: Image.asset(
                "assets/coin.png",
                width: 4,
              ).image,
            ),
          ],
        ),
        PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Settings"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("About"),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text("Exit"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("My account menu is selected.");
              } else if (value == 1) {
                print("Settings menu is selected.");
              } else if (value == 2) {
                print("Logout menu is selected.");
              }
            }),
        // IconButton(icon: const Icon(Icons.location_city, color: Colors.white,), onPressed: () {}),
      ],
    );
    AppBar profileAppbar = AppBar(
      iconTheme: const IconThemeData(
        color: Constants.COLOR_MAIN, //change your color here
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Constants.COLOR_MAIN,
      centerTitle: false,
      title: Image.asset(
        "assets/profile.png",
        fit: BoxFit.contain,
        height: 36,
      ),
      actions: <Widget>[
        PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Settings"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("About"),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text("Exit"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("My account menu is selected.");
              } else if (value == 1) {
                print("Settings menu is selected.");
              } else if (value == 2) {
                print("Logout menu is selected.");
              }
            }),
        // IconButton(icon: const Icon(Icons.location_city, color: Colors.white,), onPressed: () {}),
      ],
    );
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

  Future<String?> showOnlineUsers(BuildContext context) async {
    return showDialog<String?>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Online Users",
                        style: TextStyle(
                            color: Constants.COLOR_TEXT,
                            fontSize: 16,
                            fontFamily: 'GrilledCheese',
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: const Icon(
                            Icons.cancel_outlined,
                            size: 32,
                            color: Constants.COLOR_MAIN_TEXT,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView(
                          children: List.generate(
                              10,
                              (index) => Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                foregroundImage: Image.asset(
                                                        'assets/avatars/${index + 1}.png')
                                                    .image,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Expanded(
                                                  child: Text(
                                                      "User${random.nextInt(10000)}")),
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color:
                                                          Constants.COLOR_MAIN,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  Text(
                                                    "online",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  )))),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
