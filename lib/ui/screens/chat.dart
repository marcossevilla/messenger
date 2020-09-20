import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String route = 'chat';

  static Route go() => MaterialPageRoute<void>(builder: (_) => ChatScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is ChatScreen'),
      ),
    );
  }
}
