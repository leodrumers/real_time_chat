import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_message.dart';

class BodyChat extends StatefulWidget {
  final TextEditingController txtCtrl;
  final List<ChatMessage> messages;
  const BodyChat({
    Key key,
    @required this.txtCtrl,
    this.messages,
  }) : super(key: key);

  @override
  _BodyChatState createState() => _BodyChatState();
}

class _BodyChatState extends State<BodyChat> with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  bool _isWriting = false;

  ChatService _chatService;
  SocketServiceProvider _socketServiceProvider;
  AuthService _authService;

  @override
  void initState() {
    _chatService = Provider.of<ChatService>(context, listen: false);
    _socketServiceProvider =
        Provider.of<SocketServiceProvider>(context, listen: false);
    _authService = Provider.of<AuthService>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var txtCtrl = widget.txtCtrl;
    List<ChatMessage> _messages = widget.messages;
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (_, index) => _messages[index],
              reverse: true,
            ),
          ),
          Divider(height: 5),
          Container(
            height: 50,
            color: Colors.white,
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: txtCtrl,
                        onSubmitted: _handleSubmited,
                        onChanged: (text) {
                          setState(() {
                            if (text.trim().length > 0) {
                              _isWriting = true;
                            } else {
                              _isWriting = false;
                            }
                          });
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: 'Enviar mensaje'),
                        focusNode: _focusNode,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.black87),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            icon: Icon(Icons.send),
                            onPressed: _isWriting
                                ? () => _handleSubmited(txtCtrl.text.trim())
                                : null,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _handleSubmited(String message) {
    _clearTextBox();
    _focusNode.requestFocus();
    if (message.trim().length > 0) {
      ChatMessage newMessage = ChatMessage(
        uid: _authService.user.uid,
        txt: message,
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 400)),
      );
      widget.messages.insert(0, newMessage);
      newMessage.animationController.forward();
    }
    setState(() {
      _isWriting = false;
    });

    this._socketServiceProvider.emit('personal-message', {
      'from': this._authService.user.uid,
      'to': _chatService.userDestiny.uid,
      'message': message
    });
  }

  _clearTextBox() {
    widget.txtCtrl.clear();
  }

  @override
  void dispose() {
    for (ChatMessage message in widget.messages) {
      message.animationController.dispose();
    }

    this._socketServiceProvider.socket.off('personal-message');
    super.dispose();
  }
}
