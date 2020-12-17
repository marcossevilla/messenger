import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/auth_bloc.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key key,
    @required this.uid,
    @required this.text,
  }) : super(key: key);

  final String uid;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isMe = uid == context.select((AuthBloc bloc) => bloc.user.uid);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.grey.shade200 : Colors.black87,
          ),
        ),
        margin: EdgeInsets.fromLTRB(isMe ? 50 : 10, 4, !isMe ? 50 : 10, 4),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
