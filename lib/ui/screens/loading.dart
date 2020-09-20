import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const String route = 'loading';

  static Route go() => MaterialPageRoute<void>(builder: (_) => LoadingScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is LoadingScreen'),
      ),
    );
  }
}
