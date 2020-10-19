import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static void init() async {
    _instance = DotEnv();
    await _instance.load('.env');
  }

  static DotEnv _instance;

  static String apiURL = _instance.env['API_URL'];
  static String serverURL = _instance.env['SERVER_URL'];
}
