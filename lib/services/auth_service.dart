import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../globals/env.dart';

class AuthService with ChangeNotifier {
  Future login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      '${Environment.apiURL}/login',
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);
  }
}
