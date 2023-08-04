import 'dart:io';

import 'package:flutter/material.dart';

class Constants {
  static const COLOR_BACKGROUND = Color(0xFFBFE8BC);
  static const COLOR_MAIN = Color(0xFF48BF53);
  static const COLOR_MAIN_TEXT = Color(0xFF11813B);
  static const COLOR_HINT_TEXT = Color(0xFF7B9691);
  static const COLOR_TITLE = Color(0xFF02231C);
  static const COLOR_TEXT = Color(0xFF273834);
  static const COLOR_TEXT_BACKGROUND = Color(0x32273834);

  static const PREF_USERNAME = "username";
  static const PREF_PASSWORD = "password";
  static const PREF_EMAIL = "email";
  static const PREF_AVATAR_ID = "avatar_id";
  static const PREF_AVATARS = "avatars";
  static const PREF_ITEMS = "items";
  static const PREF_TOKEN = "token";

  static void goto(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void popto(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => page));
  }

  static void showSnackbar(BuildContext context, String msg) {
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
              child: const Text(
                'Tidak',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: COLOR_MAIN),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                callback(false);
              },
            ),
            TextButton(
              child: const Text(
                'Iya',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: COLOR_MAIN),
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
                  child: const Icon(
                    Icons.cancel_outlined,
                    size: 32,
                    color: Constants.COLOR_MAIN_TEXT,
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
                      color: Colors.white),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Choose Avatar",
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
                          child: const Icon(
                            Icons.cancel_outlined,
                            size: 32,
                            color: Constants.COLOR_MAIN_TEXT,
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
}

/*
  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: 27,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, index+1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            foregroundImage: Image.asset("assets/avatars/${index+1}.png").image,
                          ),
                        ),
                      );
                    },
                  ),
 */
