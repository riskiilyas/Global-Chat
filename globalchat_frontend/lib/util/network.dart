import 'dart:convert';

import 'package:globalchat_flutter/model/response/ErrorResponse.dart';
import 'package:globalchat_flutter/model/response/login_with_token/LoginWithTokenResponse.dart';
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
        "Access-Control-Allow-Origin": "*",
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
    var baseurl = dotenv.env['BASE_URL'] ?? "http://localhost:8080";

    final response = await http.Client().post(
      Uri.parse("$baseurl/auth/login"),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "usernameOrEmail": email,
        "password": password,
      }),
    );

    print(response.body.toString());

    try {
      return LoginResponse.fromJson(json.decode(response.body));
    } catch (e) {
      final errorResponse = ErrorResponse.fromJson(json.decode(response.body));
      throw Exception(errorResponse.message);
    }
  }

  Future<LoginWithTokenResponse> loginWithToken(token) async {
    var baseurl = dotenv.env['BASE_URL'] ?? "http://localhost:8080";

    final response = await http.Client().get(
      Uri.parse("$baseurl/me"),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer $token',
      },
    );

    try {
      return LoginWithTokenResponse.fromJson(json.decode(response.body));
    } catch (e) {
      final errorResponse = ErrorResponse.fromJson(json.decode(response.body));
      throw Exception(errorResponse.message);
    }
  }

  Future<LoginWithTokenResponse> editProfile(token, username, avatarId) async {
    var baseurl = dotenv.env['BASE_URL'] ?? "http://localhost:8080";

    final response = await http.Client().patch(
      Uri.parse("$baseurl/me"),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": username,
        "avatarId": avatarId,
      }),
    );

    try {
      return LoginWithTokenResponse.fromJson(json.decode(response.body));
    } catch (e) {
      final errorResponse = ErrorResponse.fromJson(json.decode(response.body));
      throw Exception(errorResponse.message);
    }
  }
}
