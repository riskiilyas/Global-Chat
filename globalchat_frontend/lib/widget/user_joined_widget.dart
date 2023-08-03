import 'package:flutter/material.dart';

import '../util/constants.dart';

class UserJoinedWidget extends StatelessWidget {
  final String user;

  const UserJoinedWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Constants.COLOR_TEXT_BACKGROUND,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Constants.COLOR_TEXT),
                ),
                const Text(
                  " Joined the Chat",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Constants.COLOR_HINT_TEXT),
                ),
              ],
            )),
        const SizedBox(height: 8,)
      ],
    );
  }
}