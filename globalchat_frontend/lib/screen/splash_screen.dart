import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globalchat_flutter/notifier/pref_notifier.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../util/routes.dart';
import '../util/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  void checkLoggedIn() async {
    context.read<PrefNotifier>().init().then((value) {
      var token = context.read<PrefNotifier>().token;
      Future.delayed(const Duration(seconds: 2), () {
        if (token.isNotEmpty) {
          Navigator.pushReplacementNamed(context, Routes.HOME);
        } else {
          Navigator.pushReplacementNamed(context, Routes.WELCOME);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<ThemeNotifier>().init().then((value) => checkLoggedIn());
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
                        child: Animate(
                          effects: [
                            FadeEffect(duration: 500.ms),
                            ScaleEffect(duration: 500.ms)
                          ],
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/imgs/appbar.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SpinKitWave(
                  color: Colors.white,
                ).animate().scale(duration: 500.ms)
              ],
            ),
          ),
        ));
  }
}
