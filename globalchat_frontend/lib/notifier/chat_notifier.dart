import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:globalchat_flutter/model/io/Message.dart';
import 'package:globalchat_flutter/model/io/User.dart';
import 'package:globalchat_flutter/util/event_status.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

class ChatNotifier with ChangeNotifier {
  EventStatus status = EventStatus.INITIAL;
  StompClient? client;
  String username = "";
  int avatarId = 2;
  List<Message> chats = [];

  Future<void> init(String username, int avatarId) async {
    this.username = username;
    this.avatarId = avatarId;

    if (client == null) {
      client = StompClient(
          config: StompConfig(
              url: 'ws://192.168.8.100:8080/websocket',
              onConnect: (_) {
                client!.send(destination: '/app/join', body: jsonEncode({
                  "username": username
                }));

                client!.subscribe(
                    destination: '/topic/chat',
                    headers: {},
                    callback: (frame) async {
                      try {
                        final chat = jsonDecode(frame.body.toString());
                        final model = Chat.fromJson(chat);
                        // if(model.username==username) {
                        //   status = EventStatus.SENT_CHAT;
                        //   notifyListeners();
                        //   return;
                        // }
                        chats.add(model);
                        status = EventStatus.INITIAL;
                        notifyListeners();
                      } catch(_){}
                    });

                client!.subscribe(
                    destination: '/topic/sticker',
                    headers: {},
                    callback: (frame) async {
                      try {
                        final chat = jsonDecode(frame.body.toString());
                        final model = Sticker.fromJson(chat);
                        // if(model.username==username) {
                        //   status = EventStatus.SENT_STICKER;
                        //   notifyListeners();
                        //   return;
                        // }
                        chats.add(model);
                        status = EventStatus.INITIAL;
                        notifyListeners();
                      } catch(_){}
                    });

                client!.subscribe(
                    destination: '/topic/join',
                    headers: {},
                    callback: (frame) async {
                      try {
                        final user = jsonDecode(frame.body.toString());
                        final model = User.fromJson(user);
                        // if(model.username==username) {
                        //   status = EventStatus.JOINED;
                        //   notifyListeners();
                        //   return;
                        // }
                        chats.add(model);
                        status = EventStatus.INITIAL;
                        notifyListeners();
                      } catch(_){}
                    });
              },
              onStompError: (_) {
                status = EventStatus.ERROR;
                notifyListeners();
              },
              onWebSocketError: (_) {
                status = EventStatus.ERROR;
                notifyListeners();
              },
              onDisconnect: (_) {
                status = EventStatus.ERROR;
                notifyListeners();
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

  Future<void> sendSticker(int stickerId) async {
    client!.send(
        destination: '/app/sticker',
        body: jsonEncode({
          "username": username,
          "avatarId": avatarId,
          "stickerId": stickerId
        }),
        headers: {});
  }
}
