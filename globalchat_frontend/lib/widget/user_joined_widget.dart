import 'package:flutter/material.dart';

import '../util/styles.dart';

class UserJoinedWidget extends StatelessWidget {
  final String user;

  const UserJoinedWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Styles.COLOR_TEXT_BACKGROUND,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Styles.COLOR_TEXT),
            ),
            Text(
              " Joined the Chat",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Styles.COLOR_HINT_TEXT),
            ),
          ],
        ));
  }
}
