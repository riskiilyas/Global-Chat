import 'package:flutter/material.dart';

import '../../util/constants.dart';
import '../../util/routes.dart';
import '../../widget/custom_button.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>
    with SingleTickerProviderStateMixin {
  String name = "", username = "", email = "", profileUrl = "";
  int tab = 0;
  List<GridView> pages = [];
  late TabController tabController;

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
        children: [
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.EDIT_PROFILE);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(64),
                              color: Colors.green[100]),
                          child: const Icon(Icons.edit_rounded, color: Colors.grey,)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Image.asset(
                            "assets/avatars/2.png",
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "riski1351",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Constants.COLOR_TITLE,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'riskiilyas@gmail.com',
                        style: TextStyle(
                            color: Constants.COLOR_TEXT,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Lvl. 14",
                            style: TextStyle(
                                color: Constants.COLOR_TEXT,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Text(
                                "19023",
                                style: TextStyle(color: Constants.COLOR_TEXT),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              CircleAvatar(
                                maxRadius: 12,
                                foregroundImage: Image.asset(
                                  "assets/coin.png",
                                  width: 4,
                                ).image,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text("Exp: 36/100"),
                      const SizedBox(
                        height: 4,
                      ),
                      const LinearProgressIndicator(
                        value: .36,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 1,
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                      color: Constants.COLOR_MAIN,
                      height: 50,
                      child: TabBar(
                        onTap: (_) {
                          if (_ != tab) {
                            setState(() {
                              tab = _;
                            });
                          }
                        },
                        indicatorColor: Colors.green[100],
                        controller: tabController,
                        unselectedLabelColor: Colors.white60,
                        labelColor: Colors.white,
                        tabs: const [
                          Tab(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            text: "Avatars",
                          ),
                          Tab(
                            icon: Icon(
                              Icons.diamond,
                              color: Colors.white,
                            ),
                            text: "Items",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: pages[tab]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    pages.add(GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: 27,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context, index + 1);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              foregroundImage:
                  Image.asset("assets/avatars/${index + 1}.png").image,
            ),
          ),
        );
      },
    ));
    pages.add(GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context, index + 1);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              foregroundImage:
                  Image.asset("assets/avatars/${index + 1}.png").image,
            ),
          ),
        );
      },
    ));
  }

  @override
  void dispose() {
    super.dispose();
    pages.clear();
  }
}
