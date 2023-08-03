import 'package:flutter/material.dart';

import '../../util/constants.dart';
import '../../widget/custom_button.dart';

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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/maintenance.png",height: 180,),
          SizedBox(height: 12,),
          Text("Coming Soon...", textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
