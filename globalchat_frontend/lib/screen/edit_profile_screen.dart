import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globalchat_flutter/notifier/chat_notifier.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:globalchat_flutter/notifier/update_profile_notifier.dart';
import 'package:globalchat_flutter/util/extensions.dart';
import 'package:globalchat_flutter/widget/page_title.dart';
import 'package:provider/provider.dart';

import '../util/dialogs.dart';
import '../util/fetch_status.dart';
import '../util/routes.dart';
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
  final controller = TextEditingController();

  void init() async {
    context.watch<ThemeNotifier>();
  }

  @override
  void initState() {
    super.initState();
    username = context.prefNotifier.username;
    avatar = context.prefNotifier.avatarId;
    controller.text = username;
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
                TextField(
                  controller: controller,
                    onChanged: (_)=>username=_,
                    style: TextStyle(color: Styles.COLOR_TEXT),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Styles.COLOR_HINT_TEXT),
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Styles.COLOR_MAIN)))),
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
                          if (username.isNotEmpty) {
                            context
                                .read<UpdateProfileNotifier>()
                                .updateProfile(context.prefNotifier.token,
                                    username, avatar)
                                .then((value) {
                              if (value) {
                                final username = context
                                    .read<UpdateProfileNotifier>()
                                    .loginData!
                                    .username;
                                final avatarId = context
                                    .read<UpdateProfileNotifier>()
                                    .loginData!
                                    .avatarId;
                                context.prefNotifier
                                    .updateProfile(username, avatarId);
                                context
                                    .read<ChatNotifier>()
                                    .changeProfile(username, avatarId);
                                context.popTo(Routes.HOME);
                                context.showSnackbar("Profile Updated!");
                              } else {
                                context.showSnackbar(context
                                    .read<UpdateProfileNotifier>().error);
                              }
                            });
                          } else {
                            context.showSnackbar("Please Fill in the Username First!");
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
