import 'package:flutter/material.dart';

import 'app.dart';
import 'globals/env.dart';

void main() async {
  /// initialize environment variables used in the app
  await Environment.init();
  runApp(MessengerApp());
}
