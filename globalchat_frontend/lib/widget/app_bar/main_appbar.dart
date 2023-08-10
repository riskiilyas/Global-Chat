import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../notifier/chat_notifier.dart';
import '../../util/dialogs.dart';
import '../../util/styles.dart';

class MainAppBar extends AppBar {
  MainAppBar({Key? key}) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  Random random = Random(4664);

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
        "assets/imgs/appbar.png",
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
              context.read<ChatNotifier>().checkOnlineUsers();
              Dialogs.showOnlineUsers(context);
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
