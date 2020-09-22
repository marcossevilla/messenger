import 'dart:io';

import 'package:flutter/cupertino.dart';
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
          const _ChatInput(),
        ],
      ),
    );
  }
}

class _ChatInput extends StatefulWidget {
  const _ChatInput({Key key}) : super(key: key);

  @override
  __ChatInputState createState() => __ChatInputState();
}

class __ChatInputState extends State<_ChatInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {},
                  onChanged: (value) {
                    setState(() => _controller.text = value);
                  },
                  textInputAction: TextInputAction.send,
                  decoration: const InputDecoration(
                    hintText: 'Send message...',
                  ),
                ),
              ),
              if (Platform.isAndroid)
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue.shade400),
                  onPressed: _controller.text.isEmpty ? null : _handleSubmit,
                )
              else
                CupertinoButton(
                  child: const Text('Send'),
                  onPressed: _controller.text.isEmpty ? null : _handleSubmit,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
    print(_controller.text);
    setState(_controller.clear);
  }
}
