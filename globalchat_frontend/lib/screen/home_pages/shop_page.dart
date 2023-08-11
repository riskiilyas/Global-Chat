import 'package:flutter/material.dart';
import 'package:globalchat_flutter/util/constants.dart';
import 'package:globalchat_flutter/util/styles.dart';
import 'package:provider/provider.dart';

import '../../notifier/theme_notifier.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ShopPage> {
  String name = "", username = "", email = "", profileUrl = "";

  // void init(BuildContext context) async {
  //   context.watch<PrefNotifier>();
  //
  //   name = context.read<PrefNotifier>().name;
  //   username = context.read<PrefNotifier>().username;
  //   email = context.read<PrefNotifier>().email;
  //   profileUrl = context.read<PrefNotifier>().profileUrl;
  // }

  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              "assets/stickers/1.gif",
              height: 120,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Coming Soon...",
            textAlign: TextAlign.center,
            style: TextStyle(color: Styles.COLOR_TEXT),
          )
        ],
      ),
    );
  }
}
