import 'dart:io';

import 'package:flutter/material.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:globalchat_flutter/util/dialogs.dart';
import 'package:provider/provider.dart';

import '../../util/styles.dart';

class ShopAppBar extends AppBar {
  ShopAppBar({Key? key}) : super(key: key);

  @override
  State<ShopAppBar> createState() => _ShopAppBarState();
}

class _ShopAppBarState extends State<ShopAppBar> {
  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();
    return AppBar(
      iconTheme: IconThemeData(
        color: Styles.COLOR_MAIN, //change your color here
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Styles.COLOR_MAIN,
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
            const SizedBox(
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
                Dialogs.showSettingsDialog(context);
              } else if (value == 1) {
                Dialogs.showAboutDialog(context);
              } else if (value == 2) {
                Dialogs.showMyDialog(context, "Keluar dari Aplikasi?", (_) {
                  if (_) exit(0);
                });
              }
            }),
        // IconButton(icon: const Icon(Icons.location_city, color: Colors.white,), onPressed: () {}),
      ],
    );
  }
}
