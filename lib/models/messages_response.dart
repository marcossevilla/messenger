// To parse this JSON data, do
//
//     final messagesResponse = messagesResponseFromJson(jsonString);

import 'dart:convert';

MessagesResponse messagesResponseFromJson(String str) {
  return MessagesResponse.fromJson(json.decode(str));
}

String messagesResponseToJson(MessagesResponse data) {
  return json.encode(data.toJson());
}

class MessagesResponse {
  MessagesResponse({
    this.ok,
    this.messages,
  });

  factory MessagesResponse.fromJson(Map<String, dynamic> json) =>
      MessagesResponse(
        ok: json['ok'],
        messages: List<Message>.from(
          json['messages'].map((x) => Message.fromJson(x)),
        ),
      );

  final bool ok;
  final List<Message> messages;

  Map<String, dynamic> toJson() => {
        'ok': ok,
        'messages': List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.to,
    this.from,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        to: json['to'],
        from: json['from'],
        message: json['message'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  final String to;
  final String from;
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'to': to,
        'from': from,
        'message': message,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
