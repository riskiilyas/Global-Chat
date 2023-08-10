import 'package:flutter/material.dart';

import '../util/styles.dart';

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
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Styles.COLOR_TEXT_BACKGROUND),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Wrap(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            time,
                            style: TextStyle(color: Styles.COLOR_HINT_TEXT),
                          ),
                          Text(
                            username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Styles.COLOR_TEXT),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        msg,
                        maxLines: 10,
                        style: TextStyle(
                            color: Styles.COLOR_TEXT),
                      ),
                      const SizedBox(height: 12,)
                    ],
                  ),
                ),
                Positioned(bottom: -8,left: -5,child: CircleAvatar(
                    radius: 12,
                    foregroundImage:
                    Image.asset("assets/avatars/$avatar.png").image),)
              ],
            ),
            const SizedBox(width: double.infinity,)
          ],
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
