import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'ui/routes.dart';

class MessengerApp extends StatelessWidget {
  static const String name = 'Messenger';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      theme: ThemeData(
        textTheme: GoogleFonts.oswaldTextTheme(),
      ),
      routes: Routes.routes,
      initialRoute: Routes.login,
    );
  }
}
