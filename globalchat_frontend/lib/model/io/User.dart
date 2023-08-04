class User {
  User({
    required this.username,
    required this.avatarId,
  });

  User.fromJson(dynamic json) {
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
