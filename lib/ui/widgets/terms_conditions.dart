import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Terms & Conditions',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 18,
        ),
      ),
      onPressed: () {},
    );
  }
}
