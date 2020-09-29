import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/router.dart';

class MessengerApp extends StatelessWidget {
  static const String name = 'Messenger';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );

    return MaterialApp(
      title: name,
      routes: Router.routes,
      initialRoute: Router.chat,
      debugShowCheckedModeBanner: false,
    );
  }
}
