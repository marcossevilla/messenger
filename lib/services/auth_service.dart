import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../globals/env.dart';
import '../models/login_response.dart';
import '../models/user.dart';

class AuthService with ChangeNotifier {
  User user;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    loading = true;

    final response = await http.post(
      '${Environment.apiURL}/login',
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    loading = false;

    switch (response.statusCode) {
      case 200:
        final loginResponse = loginResponseFromJson(response.body);
        user = loginResponse.user;

        // TODO: guardar token en lugar seguro

        return true;
        break;
      default:
        return false;
        break;
    }
  }
}
