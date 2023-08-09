import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:globalchat_flutter/model/io/Message.dart';
import 'package:globalchat_flutter/notifier/chat_notifier.dart';
import 'package:globalchat_flutter/notifier/pref_notifier.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:globalchat_flutter/widget/user_chat_widget.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import '../../util/styles.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var name = "";
  List<String> msg = [];

  void init() async {
    final username = context.read<PrefNotifier>().username;
    final avatarId = context.read<PrefNotifier>().avatarId;
    context.watch<ThemeNotifier>();
    context.watch<ChatNotifier>().init(username, avatarId);
    msg.clear();
    msg.addAll(context.read<ChatNotifier>().msg);
  }

  @override
  Widget build(BuildContext context) {
    init();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      // children: [
                      //   UserJoinedWidget(user: "aasefsf")
                      // ],
              children: List.generate(
                  msg.length, (index) {
                    final chat = jsonDecode(msg[index]);
                    final model = Chat.fromJson(chat);
                    return UserChatWidget(avatar: model.avatarId, username:
                    model.username,
                    msg: model.message, time: "", onUserClicked: (_){});
              }),
            ))),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 5,
                    onChanged: (_) => name = _,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Styles.COLOR_TEXT_BACKGROUND,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(64),
                        borderSide: BorderSide(
                            color: Styles.COLOR_TEXT_BACKGROUND, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(64),
                        borderSide: BorderSide(
                            color: Styles.COLOR_TEXT_BACKGROUND, width: 1.0),
                      ),
                      hintText: 'Tuliskan Pesan Anda....',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    context.read<ChatNotifier>().sendMessage(name);
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Styles.COLOR_MAIN,
                            borderRadius: BorderRadius.circular(64)),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            // MeChatWidget(avatar: 2, username: name, msg: name, time: ""),
            // const SizedBox(
            //   height: 4,
            // )
          ],
        ),
      ),
    );
  }
}
