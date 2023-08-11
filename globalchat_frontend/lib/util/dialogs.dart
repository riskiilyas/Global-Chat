import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:globalchat_flutter/notifier/chat_notifier.dart';
import 'package:globalchat_flutter/util/routes.dart';
import 'package:globalchat_flutter/util/styles.dart';
import 'package:globalchat_flutter/widget/user_item.dart';
import 'package:provider/provider.dart';

import '../notifier/pref_notifier.dart';
import '../notifier/theme_notifier.dart';
import 'dev.dart';

class Dialogs {
  static Future<void> showMyDialog(
      BuildContext context, String message, Function(bool) callback) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tidak',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Styles.COLOR_MAIN),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                callback(false);
              },
            ),
            TextButton(
              child: Text(
                'Iya',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Styles.COLOR_MAIN),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                callback(true);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showImage(BuildContext context, File img) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Stack(children: [
            Image.file(img),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.8)),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 32,
                    color: Styles.COLOR_MAIN_TEXT,
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  static Future<int?> showAvatarPicker(BuildContext context) async {
    return showDialog<int?>(
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
                      color: Styles.COLOR_BACKGROUND),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose Avatar",
                          style: TextStyle(
                              color: Styles.COLOR_TEXT,
                              fontSize: 16,
                              fontFamily: 'GrilledCheese',
                              fontWeight: FontWeight.normal),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 32,
                            color: Styles.COLOR_MAIN_TEXT,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemCount: 27,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context, index + 1);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                foregroundImage: Image.asset(
                                        "assets/avatars/${index + 1}.png")
                                    .image,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
        });
  }

  static Future<int?> showSettingsDialog(BuildContext context) async {
    return showDialog<int?>(
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Styles.COLOR_BACKGROUND),
                    child: Expanded(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Settings",
                              style: TextStyle(
                                  color: Styles.COLOR_TEXT,
                                  fontSize: 16,
                                  fontFamily: 'GrilledCheese',
                                  fontWeight: FontWeight.normal),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 32,
                                color: Styles.COLOR_MAIN_TEXT,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Dark Theme",
                                    style: TextStyle(color: Styles.COLOR_TEXT),
                                  ),
                                  Switch(
                                      value:
                                          context.watch<ThemeNotifier>().isDark,
                                      onChanged: (_) {
                                        context
                                            .read<ThemeNotifier>()
                                            .switchTheme();
                                      })
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Language",
                                    style: TextStyle(color: Styles.COLOR_TEXT),
                                  ),
                                  DropdownButton(
                                    dropdownColor: Styles.COLOR_BACKGROUND,
                                      style: TextStyle(color: Styles.COLOR_TEXT),
                                      value: "en",
                                      items: [
                                        DropdownMenuItem(value: "id", child: Text("Bahasa 🇮🇩", style:
                                        TextStyle(color: Styles.COLOR_TEXT),)),
                                        DropdownMenuItem(value: "en", child: Text("English 🇬🇧", style: TextStyle
                                          (color: Styles.COLOR_TEXT),)),
                                      ],
                                      onChanged: (_) {
                                      }),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Edit Profile",
                                    style: TextStyle(color: Styles.COLOR_TEXT),
                                  ),
                                  FloatingActionButton.extended(
                                    label: const Icon(
                                      // <-- Icon
                                      Icons.edit_rounded,
                                    ), // <-- Text
                                    backgroundColor: Styles.COLOR_MAIN,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.EDIT_PROFILE);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Logout",
                                    style: TextStyle(color: Styles.COLOR_TEXT),
                                  ),
                                  FloatingActionButton.extended(
                                    label: const Icon(
                                      // <-- Icon
                                      Icons.exit_to_app,
                                    ), // <-- Text
                                    backgroundColor: Styles.COLOR_MAIN,
                                    onPressed: () async {
                                      context.read<PrefNotifier>().clear();
                                      context.read<ThemeNotifier>().clear();
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          Routes.ROOT, (route) => false);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
              ),
            ),
          );
        });
  }

  static Future<int?> showAboutDialog(BuildContext context) async {
    return showDialog<int?>(
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Styles.COLOR_BACKGROUND_2),
                    child: Expanded(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "About",
                              style: TextStyle(
                                  color: Styles.COLOR_TEXT,
                                  fontSize: 16,
                                  fontFamily: 'GrilledCheese',
                                  fontWeight: FontWeight.normal),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 32,
                                color: Styles.COLOR_MAIN_TEXT,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Text(
                                Dev.LOREM + Dev.LOREM + Dev.LOREM + Dev.LOREM,
                                style: TextStyle(color: Styles.COLOR_TEXT),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
              ),
            ),
          );
        });
  }

  static Future<String?> showOnlineUsers(BuildContext context) async {
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
                    color: Styles.COLOR_BACKGROUND),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Online Users",
                        style: TextStyle(
                            color: Styles.COLOR_TEXT,
                            fontSize: 16,
                            fontFamily: 'GrilledCheese',
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          size: 32,
                          color: Styles.COLOR_MAIN_TEXT,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView(
                          children: List.generate(
                              context.read<ChatNotifier>().onlineUsers.length,
                              (index) => UserItem(
                                  avatarId: context.read<ChatNotifier>()
                                      .onlineUsers[index].avatarId,
                                  username: context.read<ChatNotifier>()
                                      .onlineUsers[index].username,
                                  onClicked: (_) {})))),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
