import 'package:flutter/material.dart';
import 'package:globalchat_flutter/screen/login_screen.dart';
import 'package:globalchat_flutter/screen/register_screen.dart';

import '../util/constants.dart';
import '../widget/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.COLOR_MAIN,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: Image.asset(
                            'assets/appbar.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Column(
                        children: [
                          CustomButton(
                              text: "Masuk",
                              width: 200,
                              textColor: Colors.white,
                              buttonColor: Constants.COLOR_MAIN_TEXT,
                              onPressed: () => {
                                Constants.goto(context, LoginScreen())
                              }),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomButton(
                              text: "Daftar",
                              width: 200,
                              textColor: Constants.COLOR_MAIN,
                              buttonColor: Colors.white,
                              onPressed: () => {
                                Constants.goto(context, RegisterScreen())
                              }),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                },
                                child: const Text(
                                  "Lupa Password?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Text(
                  "Dengan melanjutkan, Anda dianggap telah menyetujui Ketentuan  Penggunaan dan Kebijakan Privasi",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     // do something
  //     var prefs = ServiceLocator.prefs;
  //     prefs.then((value) {
  //       if (value.getString(Constants.PREF_TOKEN) != null) {
  //         Constants.popto(context, const HomeScreen());
  //       }
  //     });
  //   });
  // }
}
