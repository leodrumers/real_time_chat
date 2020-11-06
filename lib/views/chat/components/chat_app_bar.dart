import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatService chatService = Provider.of<ChatService>(context);
    final User userDestiny = chatService.userDestiny;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
            child: Text(
          userDestiny.name.substring(0, 2),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userDestiny.name, style: TextStyle(color: Colors.black87)),
            Text(userDestiny.online ? 'En linea' : '',
                style: TextStyle(color: Colors.black45, fontSize: 12)),
          ],
        )
      ],
    );
  }
}
