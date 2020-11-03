import 'package:flutter/material.dart';
import 'package:messenger/globals/env.dart';

import 'app.dart';

void main() async {
  /// initialize environment variables used in the app
  await Environment.init();
  runApp(MessengerApp());
}
