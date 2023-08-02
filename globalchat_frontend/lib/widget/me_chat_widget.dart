import 'package:flutter/material.dart';

import '../util/constants.dart';

class MeChatWidget extends StatelessWidget {
  final int avatar;
  final String username;
  final String msg;
  final String time;

  const MeChatWidget(
      {Key? key,
      required this.avatar,
      required this.username,
      required this.msg,
      required this.time})
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Constants.COLOR_HINT_TEXT),
                    textAlign: TextAlign.end,
                  ),
                  Expanded(
                    child: Text(
                      username,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.COLOR_TEXT),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CircleAvatar(
                      foregroundImage:
                          Image.asset("assets/avatars/$avatar.png").image),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                msg,
                textAlign: TextAlign.end,
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
