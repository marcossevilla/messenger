import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  static Route go() => MaterialPageRoute<void>(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const _Logo(),
            const _Form(),
            const _Labels(),
            const _Terms(),
          ],
        ),
      ),
    );
  }
}

class _Terms extends StatelessWidget {
  const _Terms({Key key}) : super(key: key);

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

class _Labels extends StatelessWidget {
  const _Labels({Key key}) : super(key: key);

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
          onPressed: () {},
        ),
      ],
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(),
        const TextField(),
        RaisedButton(
          onPressed: () {},
          child: const Text('Go'),
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key key}) : super(key: key);

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
          'Messenger',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
