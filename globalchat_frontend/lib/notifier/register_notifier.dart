import 'package:flutter/material.dart';
import 'package:globalchat_flutter/model/response/register/Data.dart';

import '../util/fetch_status.dart';
import '../util/network.dart';
import '../util/service_locator.dart';

class RegisterNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  Data? data;
  String error = "";

  FetchStatus get status => _status;

  Future<void> fetch(String username, String email,
      String password, String passwordConfirmation, int avatarId) async {
    _status = FetchStatus.LOADING;
    notifyListeners();
    try {
      var response = await network.register(
          username, email, password, passwordConfirmation, avatarId);
      if(response.status>=400) throw Exception(response.message);

      data = response.data;
      _status = FetchStatus.SUCCESS;
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
