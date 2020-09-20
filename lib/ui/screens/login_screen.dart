import 'package:flutter/material.dart';

import '../widgets/card_input_field.dart';
import '../widgets/logo.dart';
import '../widgets/terms_conditions.dart';

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
            const Logo(),
            const _Form(),
            const _Labels(),
            const Terms(),
          ],
        ),
      ),
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CardInputField(
            icon: Icons.mail,
            placeholder: 'Email',
            controller: _emailController,
            type: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          CardInputField(
            icon: Icons.lock,
            placeholder: 'Password',
            controller: _passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 12),

          // TODO: Make cooler button
          RaisedButton(
            child: const Text('Go'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
