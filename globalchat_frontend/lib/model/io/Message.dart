class Message{}

class Chat extends Message{
  Chat({
      required this.username,
    required this.avatarId,
    required this.message,});

  Chat.fromJson(dynamic json) {
    username = json['username'];
    avatarId = json['avatarId'];
    message = json['message'];
  }
  late String username;
  late int avatarId;
  late String message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['avatarId'] = avatarId;
    map['message'] = message;
    return map;
  }

}

class Sticker extends Message{
  Sticker({
    required this.username,
    required this.avatarId,
    required this.stickerId,});

  Sticker.fromJson(dynamic json) {
    username = json['username'];
    avatarId = json['avatarId'];
    stickerId = json['stickerId'];
  }
  late String username;
  late int avatarId;
  late int stickerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['avatarId'] = avatarId;
    map['stickerId'] = stickerId;
    return map;
  }

}