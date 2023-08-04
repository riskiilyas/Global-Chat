import 'Data.dart';

class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  RegisterResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
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
