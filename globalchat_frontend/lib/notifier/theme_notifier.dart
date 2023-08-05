import 'package:flutter/material.dart';
import 'package:globalchat_flutter/util/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/constants.dart';
import '../util/service_locator.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDark = false;
  bool _isEnglish = false;
  SharedPreferences? _pref;

  bool get isDark => _isDark;
  bool get isEnglisg => _isEnglish;

  Future<void> init() async {
    _pref = await ServiceLocator.prefs;
    _isDark = _pref!.getBool(Constants.PREF_DARK_MODE) ?? false;
    _isEnglish = _pref!.getBool(Constants.PREF_ENG_LANG) ?? false;
    Styles.switchTheme(_isDark);
    notifyListeners();
  }

  void switchTheme() {
    _isDark = !_isDark;
    _pref!.setBool(Constants.PREF_DARK_MODE, _isDark);
    Styles.switchTheme(_isDark);
    notifyListeners();
  }

  Future<void> clear() async {
    _pref!.clear();
    init();
  }
}
