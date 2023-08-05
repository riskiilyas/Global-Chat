import 'package:flutter/material.dart';
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
          Image.asset(
            "assets/maintenance.png",
            height: 180,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Coming Soon...",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
