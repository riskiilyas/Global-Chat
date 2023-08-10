import 'dart:math';

import 'package:flutter/material.dart';

import '../model/response/login_with_token/Data.dart';
import '../util/fetch_status.dart';
import '../util/network.dart';
import '../util/service_locator.dart';

class LoginWithTokenNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  String error = "";
  Data? loginData;

  FetchStatus get status => _status;

  Future<Data?> fetch(String token) async {
    _status = FetchStatus.LOADING;
    try {
      var response = await network.loginWithToken(token);
      if(response.status>=400) throw Exception(response.message);

      _status = FetchStatus.SUCCESS;
      loginData = response.data;
      return loginData;
    } catch (e) {
      _status = FetchStatus.ERROR;
      error = e.toString();
      return null;
    }
  }

  Future<void> init() async {
    _status = FetchStatus.INITIAL;
    notifyListeners();
  }
}
