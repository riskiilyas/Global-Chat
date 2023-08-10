import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:globalchat_flutter/widget/page_title.dart';
import 'package:provider/provider.dart';

import '../util/dialogs.dart';
import '../util/fetch_status.dart';
import '../util/styles.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EditProfileScreen> {
  String username = "";
  FetchStatus status = FetchStatus.INITIAL;
  int avatar = 2;

  void init() async {
    context.watch<ThemeNotifier>();
    // status = context.read<RegisterNotifier>().status;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (status == FetchStatus.SUCCESS) {
    //     context.read<RegisterNotifier>().init();
    //     Constants.showSnackbar(context, "Successfully Registered!");
    //     Navigator.pushReplacementNamed(context, Routes.WELCOME);
    //   } else if (status == FetchStatus.ERROR) {
    //     context.read<RegisterNotifier>().init();
    //     Constants.showSnackbar(context, context.read<RegisterNotifier>().error);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Styles.COLOR_BACKGROUND,
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageTitle(title: 'Edit Profile'),
                Divider(
                  color: Styles.COLOR_MAIN,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Dialogs.showAvatarPicker(context).then((value) {
                        if (value != null) {
                          setState(() {
                            avatar = value;
                          });
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          foregroundImage: Image.asset(
                            "assets/avatars/$avatar.png",
                          ).image,
                          maxRadius: 80,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Icon(
                            Icons.image,
                            size: 32,
                            color: Styles.COLOR_MAIN_TEXT,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hint: "Username",
                  icon: Icons.person,
                  callback: (_) => username = _,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 24,
                ),
                status != FetchStatus.LOADING && status != FetchStatus.SUCCESS
                    ? CustomButton(
                        text: "UPDATE",
                        textColor: Colors.white,
                        buttonColor: Styles.COLOR_MAIN,
                        onPressed: () {
                          if(username.isNotEmpty) {

                          }
                        })
                    : SpinKitFadingCircle(
                        color: Styles.COLOR_MAIN,
                        size: 50.0,
                      ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
