import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:globalchat_flutter/screen/welcome_screen.dart';
import 'package:globalchat_flutter/util/constants.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Widget page = const WelcomeScreen();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Global Chat',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: AnimatedSplashScreen(
            duration: 2000,
            splashIconSize: 180,
            backgroundColor: Constants.COLOR_MAIN,
            splash: 'assets/icon.png',
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
            nextScreen: const WelcomeScreen(),
          ),
    );
  }
}
