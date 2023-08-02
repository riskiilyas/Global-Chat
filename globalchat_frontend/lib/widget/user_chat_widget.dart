import 'package:flutter/material.dart';

import '../util/constants.dart';

class UserChatWidget extends StatelessWidget {
  final int avatar;
  final String username;
  final String msg;
  final String time;
  final Function(String) onUserClicked;

  const UserChatWidget(
      {Key? key,
      required this.avatar,
      required this.username,
      required this.msg,
      required this.time,
      required this.onUserClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Constants.COLOR_TEXT_BACKGROUND),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      onUserClicked(username);
                    },
                    child: CircleAvatar(
                        foregroundImage:
                            Image.asset("assets/avatars/$avatar.png").image),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.COLOR_TEXT),
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(color: Constants.COLOR_HINT_TEXT),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                msg,
                maxLines: 10,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
