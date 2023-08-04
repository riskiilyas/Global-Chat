import 'Data.dart';

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  late int status;
  late String message;
  late Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data?.toJson();
    return map;
  }
}
