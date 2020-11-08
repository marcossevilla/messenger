import 'package:http/http.dart' as http;

import '../blocs/auth_bloc.dart';
import '../globals/env.dart';
import '../models/user.dart';
import '../models/users_response.dart';

class UsersBloc {
  Future<List<User>> getUsers() async {
    try {
      final token = await AuthBloc.getToken();

      final response = await http.get(
        '${Environment.apiURL}/users',
        headers: {'Content-Type': 'application/json', 'x-token': token},
      );

      final usersResponse = UsersResponse.fromRawJson(response.body);
      return usersResponse.users;
    } catch (e) {
      return [];
    }
  }
}
