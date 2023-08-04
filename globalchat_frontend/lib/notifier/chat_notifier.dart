import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:globalchat_flutter/model/io/Message.dart';
import 'package:globalchat_flutter/model/io/User.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import '../util/fetch_status.dart';

class ChatNotifier with ChangeNotifier {
  final FetchStatus _status = FetchStatus.INITIAL;
  IO.Socket? _socket;
  String username = "";
  int avatarId = 2;
  List<Message> messages = [];
  List<User> users = [];

  Future<void> init(String username, int avatarId) async {
    this.username = username;
    this.avatarId = avatarId;

    if (_socket != null) return;
    print('momomomomommo');

    var ioUrl = dotenv.env['IO_URL'] ?? "";
    // _socket ??= IO.io(ioUrl);
    _socket ??= IO.io(ioUrl, OptionBuilder().disableReconnection().build());
    Future.delayed(Duration(seconds: 4), (){
      print(_socket?.io.connect());
      print(_socket?.connected);
    });

    _socket?.onDisconnect((data) {
      _socket?.connect();
      print('discoooonnnnn');
    });

    _socket?.onConnect((_) {
      print('plplpllplplplplp');
      _socket?.emit('user_join', username);
    });
    _socket?.onError((err) => print(err));


    _socket?.on('user_join', (_) {
      try {
        // final newUser = User.fromJson(_);
        print('asfaesfvvvvvvvvvvvvv');
        users.add(User(username: _.toString(), avatarId: 2));
        print(_.toString());
        notifyListeners();
      } catch (_) {}
    });

    _socket?.on('user_left', (_) {
      try {
        final newUser = User.fromJson(_);
        users.add(newUser);
        notifyListeners();
      } catch (_) {}
    });
  }
}
