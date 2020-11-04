import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../globals/env.dart';
import '../models/login_response.dart';
import '../models/user.dart';

class AuthService with ChangeNotifier {
  User user;

  final _storage = const FlutterSecureStorage();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<Object> register(String name, String email, String password) async {
    final data = {
      'name': name,
      'email': email,
      'password': password,
    };

    loading = true;

    final response = await http.post(
      '${Environment.apiURL}/login/new',
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    loading = false;

    switch (response.statusCode) {
      case 200:
        final loginResponse = loginResponseFromJson(response.body);
        user = loginResponse.user;
        await _saveToken(loginResponse.token);
        return true;
        break;
      default:
        final body = json.decode(response.body);
        return body['message'];
        break;
    }
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
        await _saveToken(loginResponse.token);

        return true;
        break;
      default:
        return false;
        break;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');

    final response = await http.get(
      '${Environment.apiURL}/login/renew',
      headers: {
        'Content-Type': 'application/json',
        'x-token': token,
      },
    );

    switch (response.statusCode) {
      case 200:
        final loginResponse = loginResponseFromJson(response.body);
        user = loginResponse.user;
        await _saveToken(loginResponse.token);
        return true;
        break;
      default:
        await logout();
        return false;
        break;
    }
  }

  Future<void> _saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  static Future<String> getToken() async {
    final _storage = const FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = const FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<void> logout() async => await _storage.delete(key: 'token');
}
