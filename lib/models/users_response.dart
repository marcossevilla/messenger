// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

import 'user.dart';

class UsersResponse {
  UsersResponse({
    this.ok,
    this.from,
    this.users,
  });

  factory UsersResponse.fromRawJson(String str) {
    return UsersResponse.fromJson(json.decode(str));
  }

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        ok: json['ok'],
        from: json['from'],
        users: List<User>.from(json['users'].map((x) => User.fromJson(x))),
      );

  bool ok;
  int from;
  List<User> users;

  UsersResponse copyWith({bool ok, int from, List<User> users}) {
    return UsersResponse(
      ok: ok ?? this.ok,
      from: from ?? this.from,
      users: users ?? this.users,
    );
  }

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'ok': ok,
        'from': from,
        'users': List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
