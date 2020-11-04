import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../app.dart';
import '../../services/auth_service.dart';
import '../widgets/app_button.dart';
import '../widgets/app_dialog.dart';
import '../widgets/app_input_field.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';
import '../widgets/terms_conditions.dart';
import 'users.dart';

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
                const Labels(),
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
    final loading = context.select((AuthService service) => service.loading);

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
          AppButton(label: 'Go', onPressed: loading ? null : submit),
        ],
      ),
    );
  }

  void submit() async {
    FocusScope.of(context).unfocus();

    final authenticated = await context.read<AuthService>().login(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

    if (authenticated) {
      // TODO: Connect to socket server
      await Navigator.of(context).pushReplacement(UsersScreen.go());
    } else {
      await showDialog(
        context: context,
        builder: (_) => const AppDialog(
          title: 'Login failed',
          content: 'Check your credentials',
        ),
      );
    }
  }
}
