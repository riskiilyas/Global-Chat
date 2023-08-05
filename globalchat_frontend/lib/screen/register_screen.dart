import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../notifier/register_notifier.dart';
import '../util/constants.dart';
import '../util/fetch_status.dart';
import '../util/routes.dart';
import '../util/styles.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegisterScreen> {
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  FetchStatus status = FetchStatus.INITIAL;
  int avatar = 2;

  void init() async {
    context.watch<RegisterNotifier>();
    status = context.read<RegisterNotifier>().status;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (status == FetchStatus.SUCCESS) {
        context.read<RegisterNotifier>().init();
        Constants.showSnackbar(context, "Successfully Registered!");
        Navigator.pushReplacementNamed(context, Routes.WELCOME);
      } else if (status == FetchStatus.ERROR) {
        context.read<RegisterNotifier>().init();
        Constants.showSnackbar(context, context.read<RegisterNotifier>().error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Styles.COLOR_MAIN),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Styles.COLOR_MAIN,
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Styles.COLOR_MAIN,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Yuk segera daftarkan dirimu!',
                  style: TextStyle(color: Styles.COLOR_TEXT),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Constants.showAvatarPicker(context).then((value) {
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
                CustomTextField(
                  hint: "Email",
                  icon: Icons.email,
                  callback: (_) => email = _,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  hint: "Password",
                  icon: Icons.password,
                  callback: (_) => password = _,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  hint: "Confirm Password",
                  icon: Icons.password,
                  callback: (_) => confirmPassword = _,
                ),
                const SizedBox(
                  height: 24,
                ),
                status != FetchStatus.LOADING && status != FetchStatus.SUCCESS
                    ? CustomButton(
                        text: "DAFTAR",
                        textColor: Colors.white,
                        buttonColor: Styles.COLOR_MAIN,
                        onPressed: () {
                          if (checkForm()) {
                            context.read<RegisterNotifier>().fetch(username,
                                email, password, confirmPassword, avatar);
                          } else {
                            Constants.showSnackbar(
                                context, "Please Fill the form first!");
                          }
                          // context.read<RegisterNotifier>().fetch(fullname,
                          //     username, email, password, confirmPassword);
                        })
                    : SpinKitFadingCircle(
                        color: Styles.COLOR_MAIN,
                        size: 50.0,
                      ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Sudah Punya Akun? ',
                      style: TextStyle(
                          color: Styles.COLOR_HINT_TEXT, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).pushReplacementNamed(Routes.LOGIN)
                      },
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                            color: Styles.COLOR_MAIN,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  bool checkForm() {
    return username.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty;
  }
}
