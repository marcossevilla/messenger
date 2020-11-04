import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';

import 'app.dart';
import 'globals/env.dart';

void main() async {
  /// initialize lumberdash plugin for better logs
  putLumberdashToWork(withClients: []);

  /// initialize environment variables used in the app
  await Environment.init();
  runApp(MessengerApp());
}
