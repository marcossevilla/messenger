import 'package:flutter/widgets.dart';

import 'screens/chat.dart';
import 'screens/loading.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/users.dart';

class Router {
  static const String login = LoginScreen.route;

  static Map routes = <String, WidgetBuilder>{
    ChatScreen.route: (_) => ChatScreen(),
    LoadingScreen.route: (_) => LoadingScreen(),
    LoginScreen.route: (_) => LoginScreen(),
    RegisterScreen.route: (_) => RegisterScreen(),
    UsersScreen.route: (_) => UsersScreen(),
  };
}
