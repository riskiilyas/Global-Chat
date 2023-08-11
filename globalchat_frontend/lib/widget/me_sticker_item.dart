import 'package:flutter/material.dart';

import '../util/styles.dart';

class MeStickerItem extends StatelessWidget {
  final int stickerId;
  final int avatarId;
  final String username;
  const MeStickerItem({Key? key, required this.username, required this
      .avatarId, required this.stickerId}) : super
(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  "assets/stickers/$stickerId.gif",
                  height: 120,
                ),
              ),
              Positioned(
                bottom: -12,
                right: 0,
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric
                          (vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Styles
                                .COLOR_BACKGROUND_2.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          username,
                          style: TextStyle(
                              color: Styles
                                  .COLOR_TEXT,
                              fontWeight: FontWeight.bold),
                        )),
                    CircleAvatar(
                        radius: 12,
                        foregroundImage: Image.asset(
                            "assets/avatars/$avatarId.png")
                            .image),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
