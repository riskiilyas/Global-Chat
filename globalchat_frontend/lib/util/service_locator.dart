import 'package:shared_preferences/shared_preferences.dart';

import 'network.dart';

class ServiceLocator {
  static Network? _network;
  static SharedPreferences? _prefs;

  static Network get network {
    _network ??= Network();
    return _network as Network;
  }

  static Future<SharedPreferences> get prefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs as SharedPreferences;
  }
}
