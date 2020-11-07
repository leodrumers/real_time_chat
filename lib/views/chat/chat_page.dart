import 'package:chat_app/colors_app.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  List<ChatMessage> _messagesList = [];

  SocketServiceProvider _socketServiceProvider;
  ChatService _chatService;

  @override
  void initState() {
    _chatService = Provider.of<ChatService>(context, listen: false);
    _socketServiceProvider =
        Provider.of<SocketServiceProvider>(context, listen: false);
    _socketServiceProvider.socket.on('personal-message', _listenMessages);
    _loadMessageHistory(_chatService.userDestiny.uid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ChatAppBarTitle(),
      ),
      body: BodyChat(
        txtCtrl: textEditingController,
        messages: _messagesList,
      ),
    );
  }

  _listenMessages(dynamic payload) {
    ChatMessage chatMessage = ChatMessage(
      txt: payload['message'],
      uid: payload['from'],
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 300)),
    );
    setState(() {
      _messagesList.insert(0, chatMessage);
    });

    chatMessage.animationController.forward();
  }

  @override
  void dispose() {
    this._socketServiceProvider.socket.off('personal-message');
    super.dispose();
  }

  void _loadMessageHistory(String uid) async {
    List<Message> _messagesHistory = await this._chatService.getMessage(uid);
    final history = _messagesHistory.map((message) => ChatMessage(
        uid: message.from,
        txt: message.message,
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 0))
          ..forward()));

    setState(() {
      _messagesList.insertAll(0, history);
    });
  }
}
