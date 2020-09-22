import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String route = 'chat';

  static Route go() => MaterialPageRoute<void>(builder: (_) => ChatScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: const Text(
                'Ma',
                style: TextStyle(fontSize: 12),
              ),
              maxRadius: 14,
              backgroundColor: Colors.blue.shade100,
            ),
            const SizedBox(height: 5),
            const Text(
              'María José Clímaco',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemCount: 100,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text('$index');
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            height: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
