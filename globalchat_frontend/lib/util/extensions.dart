import 'package:flutter/material.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:globalchat_flutter/util/app_localization.dart';
import 'package:provider/provider.dart';

import '../notifier/login_notifier.dart';
import '../notifier/pref_notifier.dart';
import '../notifier/register_notifier.dart';

extension Notifier on BuildContext {
  void showSnackbar(String msg) {
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  PrefNotifier get prefNotifier {
    return _notifier<PrefNotifier>();
  }

  ThemeNotifier get themeNotifier {
    return _notifier<ThemeNotifier>();
  }

  LoginNotifier get loginNotifier {
    return _notifier<LoginNotifier>();
  }

  RegisterNotifier get registerNotifier {
    return _notifier<RegisterNotifier>();
  }

  void goTo(String routes) {
    Navigator.pushNamed(this, routes);
  }

  void jumpTo(String routes) {
    Navigator.pushReplacementNamed(this, routes);
  }

  void popTo(String routes) {
    Navigator.pushNamedAndRemoveUntil(this, routes, (_) => false);
  }

  void goBack() {
    Navigator.pop(this);
  }

  T _notifier<T extends ChangeNotifier>() {
    return read<T>();
  }

  String txt(String key) {
    return AppLocalization.of(this).getTranslate(key).toString();
  }
}
