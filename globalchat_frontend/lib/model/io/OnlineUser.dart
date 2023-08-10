import 'package:globalchat_flutter/model/io/Message.dart';

class OnlineUser extends Message {
  OnlineUser({
    required this.username,
    required this.avatarId
  });

  OnlineUser.fromJson(dynamic json) {
    username = json['username'];
    avatarId = json['avatarId'];
  }

  late String username;
  late int avatarId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['avatarId'] = avatarId;
    return map;
  }
}
