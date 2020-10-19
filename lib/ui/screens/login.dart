import 'package:flutter/material.dart';
import 'package:messenger/services/auth_service.dart';

import 'package:provider/provider.dart';

import '../../app.dart';
import '../widgets/app_button.dart';
import '../widgets/app_input_field.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';
import '../widgets/terms_conditions.dart';
import 'register.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  static Route go() => MaterialPageRoute<void>(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Logo(label: MessengerApp.name),
                const _Form(),
                Labels(route: RegisterScreen.go()),
                const Terms(),
              ],
            ),
          ),
        ),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppField(
            icon: Icons.mail,
            placeholder: 'Email',
            controller: _emailController,
            type: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          AppField(
            icon: Icons.lock,
            placeholder: 'Password',
            controller: _passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          AppButton(
            label: 'Go',
            onPressed: () {
              context.read<AuthService>().login(
                    _emailController.text,
                    _passwordController.text,
                  );
            },
          ),
        ],
      ),
    );
  }
}
