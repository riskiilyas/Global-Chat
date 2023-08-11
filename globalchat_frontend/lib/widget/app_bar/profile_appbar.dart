import 'dart:io';

import 'package:flutter/material.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../util/dialogs.dart';
import '../../util/styles.dart';

class ProfileAppBar extends AppBar {
  ProfileAppBar({Key? key}) : super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
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
        "assets/imgs/profile.png",
        fit: BoxFit.contain,
        height: 36,
      ),
      actions: <Widget>[
        PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
          color: Styles.COLOR_BACKGROUND,
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Settings",
                    style: TextStyle(color: Styles.COLOR_TEXT),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    "About",
                    style: TextStyle(color: Styles.COLOR_TEXT),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text(
                    "Exit",
                    style: TextStyle(color: Styles.COLOR_TEXT),
                  ),
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
