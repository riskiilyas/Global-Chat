import 'package:flutter/material.dart';

import '../util/routes.dart';
import '../util/styles.dart';
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
        backgroundColor: Styles.COLOR_MAIN,
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
                              buttonColor: Styles.COLOR_MAIN_TEXT,
                              onPressed: () => {
                                    Navigator.of(context)
                                        .pushNamed(Routes.LOGIN)
                                  }),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomButton(
                              text: "Daftar",
                              width: 200,
                              textColor: Styles.COLOR_MAIN,
                              buttonColor: Colors.white,
                              onPressed: () => {
                                    Navigator.of(context)
                                        .pushNamed(Routes.REGISTER)
                                  }),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.FORGOT_PASSWORD);
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
