import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/user.dart';
import '../../services/auth_service.dart';
import 'login.dart';

class UsersScreen extends StatefulWidget {
  static const String route = 'users';

  static Route go() => MaterialPageRoute<void>(builder: (_) => UsersScreen());

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _refreshController = RefreshController(initialRefresh: false);

  final users = <User>[
    User(uid: '1', name: 'Majo', email: 'majo@gmail.com', online: true),
    User(uid: '2', name: 'Mafe', email: 'mafe@gmail.com', online: true),
    User(uid: '3', name: 'Mario', email: 'mario@gmail.com', online: true),
    User(uid: '4', name: 'Marcos', email: 'marcos@gmail.com', online: false),
  ];

  @override
  Widget build(BuildContext context) {
    final name = context.select((AuthService auth) => auth.user.name);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () async {
            // TODO: Disconnect from socket server
            await AuthService.deleteToken();
            await Navigator.of(context).pushReplacement(LoginScreen.go());
          },
        ),
        title: Text(name, style: const TextStyle(color: Colors.black87)),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.green),
          ),
          // Icon(Icons.check_circle, color: Colors.red,),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _loadUsers,
        child: _UserList(users: users),
      ),
    );
  }

  // for now
  void _loadUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    _refreshController.refreshCompleted();
  }
}

class _UserList extends StatelessWidget {
  const _UserList({Key key, @required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: users.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) => _UserTile(user: users[index]),
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({Key key, @required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      enabled: user.online,
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 2)),
        backgroundColor: Colors.blue.shade100,
      ),
      trailing: CircleAvatar(
        radius: 5,
        backgroundColor: user.online ? Colors.green : Colors.red,
      ),
    );
  }
}
