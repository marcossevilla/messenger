import 'package:flutter/material.dart';
import 'package:messenger/ui/screens/chat.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../blocs/auth_bloc.dart';
import '../../blocs/chat_bloc.dart';
import '../../blocs/socket_bloc.dart';
import '../../blocs/users_bloc.dart';
import '../../models/user.dart';
import '../widgets/loading_indicator.dart';
import 'login.dart';

class UsersScreen extends StatefulWidget {
  static const String route = 'users';

  static Route go() => MaterialPageRoute<void>(builder: (_) => UsersScreen());

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users;
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final socket = context.watch<SocketBloc>();

    final name = context.select((AuthBloc auth) => auth.user.name);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () async {
            context.read<SocketBloc>().disconnect();
            await Navigator.of(context).pushReplacement(LoginScreen.go());
            await AuthBloc.deleteToken();
          },
        ),
        title: Text(name, style: const TextStyle(color: Colors.black87)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              socket.isConnected ? Icons.check_circle : Icons.warning,
              color: socket.isConnected ? Colors.green : Colors.red,
            ),
          ),
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

  void _loadUsers() async {
    final bloc = UsersBloc();

    users = await bloc.getUsers();
    setState(() {});

    _refreshController.refreshCompleted();
  }
}

class _UserList extends StatelessWidget {
  const _UserList({Key key, @required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    if (users == null) {
      return const LoadingIndicator();
    } else if (users.isEmpty) {
      return const Center(child: Text('No users'));
    } else {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) => _UserTile(user: users[index]),
      );
    }
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
      // trailing: CircleAvatar(
      //   radius: 5,
      //   backgroundColor: user.online ? Colors.green : Colors.red,
      // ),
      trailing: Chip(
        label: Text(
          user.online ? 'Online' : 'Offline',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: user.online ? Colors.green : Colors.red,
      ),
      onTap: () async {
        context.read<ChatBloc>().userTo = user;
        await Navigator.of(context).push(ChatScreen.go());
      },
    );
  }
}
