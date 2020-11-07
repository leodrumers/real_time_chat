import 'dart:convert';

import 'message.dart';

MessageResponse messageResponseFromJson(String str) =>
    MessageResponse.fromJson(json.decode(str));

String messageResponseToJson(MessageResponse data) =>
    json.encode(data.toJson());

class MessageResponse {
  MessageResponse({
    this.ok,
    this.msg,
    this.messages,
  });

  bool ok;
  String msg;
  List<Message> messages;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      MessageResponse(
        ok: json["ok"],
        msg: json["msg"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}
