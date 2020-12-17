import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../blocs/auth_bloc.dart';
import '../globals/env.dart';
import '../models/messages_response.dart';
import '../models/user.dart';

class ChatBloc with ChangeNotifier {
  User userTo;

  Future<List<Message>> getChat() async {
    final response = await http.get(
      '${Environment.apiURL}/messages/${userTo.uid}',
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthBloc.getToken(),
      },
    );

    final messageResponse = messagesResponseFromJson(response.body);

    return messageResponse.messages;
  }
}
