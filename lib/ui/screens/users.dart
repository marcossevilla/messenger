import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  static const String route = 'users';

  static Route go() => MaterialPageRoute<void>(builder: (_) => UsersScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is UsersScreen'),
      ),
    );
  }
}
