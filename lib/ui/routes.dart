import 'package:flutter/widgets.dart';

import 'screens/login_screen.dart';

class Routes {
  static const String login = LoginScreen.route;

  static Map routes = <String, WidgetBuilder>{
    LoginScreen.route: (_) => LoginScreen(),
  };
}
