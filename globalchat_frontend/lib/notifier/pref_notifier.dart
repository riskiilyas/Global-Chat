import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/constants.dart';
import '../util/fetch_status.dart';
import '../util/network.dart';
import '../util/service_locator.dart';

class PrefNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  String _username = "";
  String _email = "";
  String _password = "";
  int _avatarId = 1;
  String _token = "";
  int _coins = 0;
  int _exp = 0;
  int _level = 0;
  String _avatars = "";
  String _items = "";
  bool isDark = false;
  bool isEnglish = false;
  SharedPreferences? _pref;

  FetchStatus get status => _status;
  Network network = ServiceLocator.network;

  String get username => _username;
  String get email => _email;
  String get password => _password;
  int get avatarId => _avatarId;
  int get coins => _coins;
  int get exp => _exp;
  int get level => _level;
  String get avatars => _avatars;
  String get items => _items;
  String get token => _token;

  Future<void> init() async {
    _pref = await ServiceLocator.prefs;
    _username = _pref!.getString(Constants.PREF_USERNAME) ?? "";
    _email = _pref!.getString(Constants.PREF_EMAIL) ?? "";
    _password = _pref!.getString(Constants.PREF_PASSWORD) ?? "";
    _avatarId = _pref!.getInt(Constants.PREF_AVATAR_ID) ?? 2;
    _coins = _pref!.getInt(Constants.PREF_COINS) ?? 0;
    _exp = _pref!.getInt(Constants.PREF_EXP) ?? 0;
    _level = _pref!.getInt(Constants.PREF_LEVEL) ?? 0;
    _avatars = _pref!.getString(Constants.PREF_AVATARS) ?? "";
    _items = _pref!.getString(Constants.PREF_ITEMS) ?? "";
    _token = _pref!.getString(Constants.PREF_TOKEN) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> clear() async {
    _pref!.clear();
    init();
  }

  Future<void> addUser(
      String username,
      String email,
      String password,
      int avatarId,
      int coins,
      int exp,
      int level,
      String avatars,
      String items,
      String token
      ) async {
    await _setUsername(username);
    await _setEmail(email);
    await _setPassword(password);
    await _setAvatarId(avatarId);
    await _setCoins(coins);
    await _setExp(exp);
    await _setLevel(level);
    await _setAvatars(avatars);
    await _setItems(items);
    await _setToken(token);
    _status = FetchStatus.SUCCESS;
    return;
  }

  Future<void> updateProfile(username, avatarId) async {
    await _setUsername(username);
    await _setAvatarId(avatarId);
  }

  Future<void> clearUser() async {
    await _pref!.clear();
    await init();
  }

  Future<void> _setUsername(String username) async {
    _pref!.setString(Constants.PREF_USERNAME, username);
    _username = _pref!.getString(Constants.PREF_USERNAME) ?? "";
  }

  Future<void> _setEmail(String email) async {
    _pref!.setString(Constants.PREF_EMAIL, email);
    _email = _pref!.getString(Constants.PREF_EMAIL) ?? "";
  }

  Future<void> _setPassword(String password) async {
    _pref!.setString(Constants.PREF_PASSWORD, password);
    _password = _pref!.getString(Constants.PREF_PASSWORD) ?? "";
  }

  Future<void> _setAvatarId(int avatar) async {
    _pref!.setInt(Constants.PREF_AVATAR_ID, avatar);
    _avatarId = _pref!.getInt(Constants.PREF_AVATAR_ID) ?? 1;
  }

  Future<void> _setCoins(int coins) async {
    _pref!.setInt(Constants.PREF_COINS, coins);
    _coins = _pref!.getInt(Constants.PREF_COINS) ?? 1;
  }

  Future<void> _setExp(int exp) async {
    _pref!.setInt(Constants.PREF_EXP, exp);
    _exp = _pref!.getInt(Constants.PREF_EXP) ?? 1;
  }

  Future<void> _setLevel(int level) async {
    _pref!.setInt(Constants.PREF_LEVEL, level);
    _level = _pref!.getInt(Constants.PREF_LEVEL) ?? 1;
  }

  Future<void> _setAvatars(String avatars) async {
    _pref!.setString(Constants.PREF_AVATARS, avatars);
    _avatars = _pref!.getString(Constants.PREF_AVATARS) ?? "";
  }

  Future<void> _setItems(String items) async {
    _pref!.setString(Constants.PREF_ITEMS, items);
    _items = _pref!.getString(Constants.PREF_ITEMS) ?? "";
  }

  Future<void> _setToken(String token) async {
    _pref!.setString(Constants.PREF_TOKEN, token);
    _token = _pref!.getString(Constants.PREF_TOKEN) ?? "";
  }
}
