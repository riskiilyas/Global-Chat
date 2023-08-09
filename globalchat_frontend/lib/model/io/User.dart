import 'package:globalchat_flutter/model/io/Message.dart';

class User extends Message {
  User({
    required this.username,
  });

  User.fromJson(dynamic json) {
    username = json['username'];
  }

  late String username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    return map;
  }
}
