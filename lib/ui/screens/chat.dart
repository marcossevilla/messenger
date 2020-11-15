import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/auth_bloc.dart';
import '../../blocs/chat_bloc.dart';
import '../../blocs/socket_bloc.dart';
import '../widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  static const String route = 'chat';

  static Route go() => MaterialPageRoute<void>(builder: (_) => ChatScreen());

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var messages = <ChatMessage>[];

  @override
  void initState() {
    context.read<SocketBloc>().socket.on('private-message', listenToMessage);
    super.initState();
  }

  @override
  void deactivate() {
    context.read<SocketBloc>().socket.off('private-message');
    super.deactivate();
  }

  void listenToMessage(dynamic payload) {
    final message = ChatMessage(uid: payload['from'], text: payload['message']);
    setState(() => messages.insert(0, message));
  }

  void updateMessages(ChatMessage message) {
    setState(() => messages.insert(0, message));
  }

  @override
  Widget build(BuildContext context) {
    final userTo = context.select((ChatBloc bloc) => bloc.userTo);

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
              child: Text(
                userTo.name.substring(0, 2),
                style: const TextStyle(fontSize: 12),
              ),
              maxRadius: 14,
              backgroundColor: Colors.blue.shade100,
            ),
            const SizedBox(height: 5),
            Text(
              userTo.name,
              style: const TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (context, index) => messages[index],
            ),
          ),
          const Divider(height: 1),
          _ChatInput(addMessage: updateMessages),
        ],
      ),
    );
  }
}

class _ChatInput extends StatefulWidget {
  const _ChatInput({Key key, this.addMessage}) : super(key: key);

  final Function(ChatMessage) addMessage;

  @override
  __ChatInputState createState() => __ChatInputState();
}

class __ChatInputState extends State<_ChatInput> {
  bool _enableSend = false;
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: TextField(
                focusNode: _focusNode,
                controller: _controller,
                decoration: const InputDecoration(hintText: 'Send message...'),
                onSubmitted: (_) => _handleSubmit(),
                onChanged: (_) => setState(
                  () => _enableSend = _controller.text.trim().isNotEmpty,
                ),
              ),
            ),
            if (Platform.isIOS || Platform.isMacOS)
              CupertinoButton(
                child: const Text('Send'),
                onPressed: _enableSend ? _handleSubmit : null,
              )
            else
              IconButton(
                color: Colors.blue.shade400,
                icon: const Icon(Icons.send),
                onPressed: _enableSend ? _handleSubmit : null,
              ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_controller.text.trim().isEmpty) return;

    final newMessage = ChatMessage(uid: '123', text: _controller.text);
    widget.addMessage(newMessage);

    context.read<SocketBloc>().emit('private-message', {
      'to': context.read<ChatBloc>().userTo.uid,
      'from': context.read<AuthBloc>().user.uid,
      'message': _controller.text,
    });

    _focusNode.requestFocus();
    _controller.clear();
  }
}
