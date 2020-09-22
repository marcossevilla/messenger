import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/app_input_field.dart';
import '../widgets/logo.dart';
import '../widgets/terms_conditions.dart';

class RegisterScreen extends StatelessWidget {
  static const String route = 'register';

  static Route go() {
    return MaterialPageRoute<void>(
      builder: (_) => RegisterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey.shade200,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Logo(label: RegisterScreen.route),
              const _Form(),
              const Terms(),
            ],
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
  final _nameController = TextEditingController();
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
            icon: Icons.perm_identity,
            placeholder: 'Name',
            controller: _nameController,
          ),
          const SizedBox(height: 10),
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
