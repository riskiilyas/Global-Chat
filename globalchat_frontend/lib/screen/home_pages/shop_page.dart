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
      child: Expanded(
        child: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          width: 80,
                          child: Image.network(
                            profileUrl,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context,
                                Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                  loadingProgress.expectedTotalBytes !=
                                      null
                                      ? loadingProgress
                                      .cumulativeBytesLoaded /
                                      loadingProgress
                                          .expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Constants.COLOR_TITLE,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '$username - $email',
                            style: const TextStyle(
                                color: Constants.COLOR_TEXT,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => {
                                  // Constants.goto(
                                  //     context, const EditProfileScreen())
                                },
                                child: const Text(
                                  "Edit Profil",
                                  style: TextStyle(
                                    color: Constants.COLOR_MAIN,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // ProfileItem(
                    //     title: "Proyek Saya",
                    //     icon: Icons.location_city,
                    //     onPressed: () => {}),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // ProfileItem(
                    //     title: "Wishllist Saya",
                    //     icon: Icons.favorite,
                    //     onPressed: () =>
                    //     {Get.to(() => const WishListScreen())}),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // ProfileItem(
                    //     title: "Cari Mandor",
                    //     icon: Icons.search,
                    //     onPressed: () => {}),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
                text: "Log Out",
                textColor: Colors.white,
                buttonColor: Constants.COLOR_MAIN,
                onPressed: () async {}
            )
          ],
        ),
      ),
    );
  }
}
