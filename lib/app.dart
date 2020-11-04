import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'services/auth_service.dart';
import 'ui/router.dart';

class MessengerApp extends StatelessWidget {
  static const String name = 'Messenger';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: name,
        initialRoute: Router.loading,
        routes: Router.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
