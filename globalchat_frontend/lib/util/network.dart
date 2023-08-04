import 'dart:convert';

import 'package:globalchat_flutter/model/response/ErrorResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/response/login/LoginResponse.dart';
import '../model/response/register/RegisterResponse.dart';

class Network {

  Future<RegisterResponse> register(
      username, email, password, passwordConfirmation, avatarId) async {
    var baseurl = dotenv.env['BASE_URL'] ?? "";

    final response = await http.Client().post(
      Uri.parse("$baseurl/auth/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
        "confirmationPassword": passwordConfirmation,
        "avatarId": avatarId
      }),
    );

    try {
      return RegisterResponse.fromJson(json.decode(response.body));
    } catch (e) {
      final errorResponse = ErrorResponse.fromJson(json.decode(response.body));
      throw Exception(errorResponse.message);
    }
  }

  Future<LoginResponse> login(email, password) async {
    var baseurl = dotenv.env['BASE_URL'] ?? "";

    final response = await http.Client().post(
      Uri.parse("$baseurl/auth/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "usernameOrEmail": email,
        "password": password,
      }),
    );

    try {
      return LoginResponse.fromJson(json.decode(response.body));
    } catch (e) {
      final errorResponse = ErrorResponse.fromJson(json.decode(response.body));
      throw Exception(errorResponse.message);
    }
  }
}
