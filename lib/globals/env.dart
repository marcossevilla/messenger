// import 'dart:io';

import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  /// Load all the .env variables to DotEnv instance
  static Future<void> init() async {
    _instance = DotEnv();
    await _instance.load('.env');
  }

  static DotEnv _instance;

  static String apiURL =
      Platform.isIOS ? _instance.env['API_URL'] : 'http://10.0.2.2:3000/api';
  static String serverURL =
      Platform.isIOS ? _instance.env['SERVER_URL'] : 'http://10.0.2.2:3000';
}
