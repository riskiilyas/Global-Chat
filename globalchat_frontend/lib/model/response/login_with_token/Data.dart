class Data {
  Data({
    required this.username,
    required this.email,
    required this.avatarId,
    required this.level,
    required this.exp,
    required this.coins,
    required this.avatars,
    required this.items,
  });

  Data.fromJson(dynamic json) {
    username = json['username'];
    email = json['email'];
    avatarId = json['avatar_id'];
    level = json['level'];
    exp = json['exp'];
    coins = json['coins'];
    avatars = json['avatars'];
    items = json['items'];
  }

  late String username;
  late String email;
  late int avatarId;
  late int level;
  late int exp;
  late int coins;
  late String avatars;
  late String items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['email'] = email;
    map['avatar_id'] = avatarId;
    map['level'] = level;
    map['exp'] = exp;
    map['coins'] = coins;
    map['avatars'] = avatars;
    map['items'] = items;
    return map;
  }
}
