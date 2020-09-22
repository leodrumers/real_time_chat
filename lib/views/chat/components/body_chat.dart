import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var txtCtrl = widget.txtCtrl;
    List<ChatMessage> messages = widget.messages;
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (_, index) => messages[index],
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
    print(message);
    _clearTextBox();
    _focusNode.requestFocus();
    if (message.trim().length > 0) {
      ChatMessage newMessage = ChatMessage(
        uid: '123',
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
  }

  _clearTextBox() {
    widget.txtCtrl.clear();
  }

  @override
  void dispose() {
    // TODO: of del socket
    for(ChatMessage message in widget.messages){
      message.animationController.dispose();
    }
    super.dispose();
  }
}
