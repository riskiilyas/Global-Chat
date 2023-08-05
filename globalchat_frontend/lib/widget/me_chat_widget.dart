import 'package:flutter/material.dart';

import '../util/styles.dart';

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
              color: Styles.COLOR_TEXT_BACKGROUND),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(color: Styles.COLOR_HINT_TEXT),
                    textAlign: TextAlign.end,
                  ),
                  Expanded(
                    child: Text(
                      username,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Styles.COLOR_TEXT),
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
