import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:globalchat_flutter/model/io/Message.dart';
import 'package:globalchat_flutter/model/io/User.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import '../util/fetch_status.dart';

class ChatNotifier with ChangeNotifier {
  final FetchStatus _status = FetchStatus.INITIAL;
  StompClient? client;
  String username = "";
  int avatarId = 2;
  List<Message> messages = [];
  List<User> users = [];
  List<String> msg = [];

  Future<void> init(String username, int avatarId) async {
    this.username = username;
    this.avatarId = avatarId;

    if (client == null) {
      client = StompClient(
          config: StompConfig(
              url: 'ws://192.168.8.100:8080/websocket',
              onConnect: (_) {
                // client!.send(destination: )

                client!.subscribe(
                    destination: '/topic/chat',
                    headers: {},
                    callback: (frame) {
                      msg.add(frame.body.toString());
                      notifyListeners();
                    });
              },
              onStompError: (_) {
                print(_.toString());
              },
              onWebSocketError: (_) {
                print(_.toString());
              },
              onDisconnect: (_) {
                client!.activate();
              }));
      client!.activate();
    }
  }

  Future<void> sendMessage(String msg) async {
    client!.send(
        destination: '/app/chat',
        body: jsonEncode({
          "username": username,
          "avatarId": avatarId,
          "message": msg
        }),
        headers: {});
  }
}
