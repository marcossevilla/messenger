import 'package:flutter/material.dart';

void main() => runApp(MessengerApp());

class MessengerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
