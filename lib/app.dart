import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'blocs/auth_bloc.dart';
import 'blocs/chat_bloc.dart';
import 'blocs/socket_bloc.dart';
import 'ui/router.dart' as app_router;

class MessengerApp extends StatelessWidget {
  static const String name = 'Messenger';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthBloc()),
        ChangeNotifierProvider(create: (_) => SocketBloc()),
        ChangeNotifierProvider(create: (_) => ChatBloc()),
      ],
      child: MaterialApp(
        title: name,
        initialRoute: app_router.Router.loading,
        routes: app_router.Router.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
