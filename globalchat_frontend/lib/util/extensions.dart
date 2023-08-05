import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifier/login_notifier.dart';
import '../notifier/pref_notifier.dart';
import '../notifier/register_notifier.dart';

extension Notifier on State {
  PrefNotifier get prefNotifier {
    return _notifier<PrefNotifier>();
  }

  LoginNotifier get loginNotifier {
    return _notifier<LoginNotifier>();
  }

  RegisterNotifier get registerNotifier {
    return _notifier<RegisterNotifier>();
  }

  void goTo(String routes) {
    Navigator.pushNamed(context, routes);
  }

  void jumpTo(String routes) {
    Navigator.pushReplacementNamed(context, routes);
  }

  void popTo(String routes) {
    Navigator.pushNamedAndRemoveUntil(context, routes, (_) => false);
  }

  void goBack() {
    Navigator.pop(context);
  }

  T _notifier<T extends ChangeNotifier>() {
    return context.read<T>();
  }
}