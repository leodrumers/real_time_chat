import 'package:chat_app/colors_app.dart';
import 'package:flutter/material.dart';

import 'components/body_chat.dart';
import 'components/chat_app_bar.dart';
import 'components/chat_message.dart';

class ChatPage extends StatefulWidget {
  static String routeName = '/chatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  List<ChatMessage> _messages = [];
  @override
  Widget build(BuildContext context) {
    _messages.add(ChatMessage(
        uid: '122',
        txt: 'Mi mens',
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 400))));
    _messages[0].animationController.forward();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ChatAppBarTitle(),
      ),
      body: BodyChat(
        txtCtrl: textEditingController,
        messages: _messages,
      ),
    );
  }
}
