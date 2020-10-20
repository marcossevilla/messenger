// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'user.dart';

LoginResponse loginResponseFromJson(String str) {
  return LoginResponse.fromJson(json.decode(str));
}

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.ok,
    this.user,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      ok: json['ok'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  bool ok;
  User user;
  String token;

  Map<String, dynamic> toJson() => {
        'ok': ok,
        'user': user.toJson(),
        'token': token,
      };
}
