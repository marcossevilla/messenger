import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/auth_bloc.dart';
import 'login.dart';
import 'users.dart';

class LoadingScreen extends StatelessWidget {
  static const String route = 'loading';

  static Route go() => MaterialPageRoute<void>(builder: (_) => LoadingScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: LinearProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Future _checkLoginState(BuildContext context) async {
    // tried using `read` but doesn't work with FutureBuilder apparently
    final auth = Provider.of<AuthBloc>(context, listen: false);
    final loggedIn = await auth.isLoggedIn();

    if (loggedIn) {
      // TODO: Connect to socket server
      await Navigator.of(context).pushReplacement(UsersScreen.go());
    } else {
      await Navigator.of(context).pushReplacement(LoginScreen.go());
    }
  }
}
