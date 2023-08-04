import 'package:flutter/material.dart';
import 'package:globalchat_flutter/model/response/login/Data.dart';

import '../util/fetch_status.dart';
import '../util/network.dart';
import '../util/service_locator.dart';

class LoginNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  String error = "";
  Data? loginData;

  FetchStatus get status => _status;

  Future<void> fetch(String email, String password) async {
    _status = FetchStatus.LOADING;
    notifyListeners();
    try {
      var response = await network.login(email, password);
      if(response.status>=400) throw Exception(response.message);

      _status = FetchStatus.SUCCESS;
      loginData = response.data;
    } catch (e) {
      _status = FetchStatus.ERROR;
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> init() async {
    _status = FetchStatus.INITIAL;
    notifyListeners();
  }
}
