import 'package:flutter/material.dart';

import '../screen/home_screen.dart';
import '../screen/login_screen.dart';
import '../screen/register_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/welcome_screen.dart';

class Routes {
  static const ROOT = '/';
  static const WELCOME = '/welcome';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ROOT:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case WELCOME:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case HOME:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),);
      case LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginScreen(),);
      case REGISTER:
        return MaterialPageRoute(builder: (_) => const RegisterScreen(),);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
