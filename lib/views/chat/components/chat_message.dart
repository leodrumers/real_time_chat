import 'package:chat_app/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String uid, txt;
  final AnimationController animationController;

  const ChatMessage({
    Key key,
    @required this.uid,
    this.txt,
    @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        axisAlignment: -40,
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
            child: this.uid == '123'
                ? _buildMessageBox(mainUser: true)
                : _buildMessageBox(mainUser: false)),
      ),
    );
  }

  Widget _buildMessageBox({bool mainUser = true}) {
    return Align(
      alignment: mainUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(
            left: mainUser ? 50 : 12,
            top: 8,
            right: mainUser ? 12 : 50,
            bottom: 8),
        child: Text(
          this.txt,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        decoration: BoxDecoration(
            color: mainUser ? kMainUserBgTxtBoxColor : kSecondUserBgTxtBoxColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 5)]),
      ),
    );
  }
}
