import 'package:flutter/material.dart';

import '../util/styles.dart';

class UserItem extends StatelessWidget {
  final int avatarId;
  final String username;
  final Function(String) onClicked;

  const UserItem(
      {Key? key,
      required this.avatarId,
      required this.username,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () => onClicked(username),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(children: [
            CircleAvatar(
              foregroundImage:
                  Image.asset('assets/avatars/$avatarId.png').image,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Text(
              username,
              style: TextStyle(color: Styles.COLOR_TEXT),
            )),
            Column(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  "online",
                  style: TextStyle(color: Styles.COLOR_TEXT),
                )
              ],
            ),
          ]),
        ),
      ),
      const Divider()
    ]);
  }
}
