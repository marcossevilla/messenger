import 'package:flutter/widgets.dart';

import 'screens.dart';

class Router {
  static const String chat = ChatScreen.route;
  static const String loading = LoadingScreen.route;
  static const String login = LoginScreen.route;
  static const String register = RegisterScreen.route;
  static const String users = UsersScreen.route;

  static Map routes = <String, WidgetBuilder>{
    ChatScreen.route: (_) => ChatScreen(),
    LoadingScreen.route: (_) => LoadingScreen(),
    LoginScreen.route: (_) => LoginScreen(),
    RegisterScreen.route: (_) => RegisterScreen(),
    UsersScreen.route: (_) => UsersScreen(),
  };
}
