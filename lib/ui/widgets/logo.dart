import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Logo extends StatelessWidget {
  const Logo({Key key, @required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.message,
          size: 70,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          toBeginningOfSentenceCase(label),
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
