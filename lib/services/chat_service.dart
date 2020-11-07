import 'package:chat_app/global/environment.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/model/message_response.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  User userDestiny;

  Future<List<Message>> getMessage(String uidFrom) async {
    final http.Response response = await http.get(
        '${Environment.apiUrl}/messages/$uidFrom',
        headers: {'x-token': await AuthService.getToken()});

    MessageResponse messageResponse = messageResponseFromJson(response.body);

    return messageResponse.messages;
  }
}
