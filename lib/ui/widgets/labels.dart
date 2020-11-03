import 'package:flutter/material.dart';
import 'package:messenger/ui/screens/register.dart';

class Labels extends StatelessWidget {
  const Labels({Key key, this.route}) : super(key: key);

  final Route<Object> route;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Don't have account?",
          style: Theme.of(context).textTheme.button,
        ),
        FlatButton(
          child: Text(
            'Create one!',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
          onPressed: () => Navigator.of(context).push(RegisterScreen.go()),
        ),
      ],
    );
  }
}
