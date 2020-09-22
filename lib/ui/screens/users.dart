import 'package:flutter/material.dart';
import 'package:messenger/models/user.dart';

class UsersScreen extends StatefulWidget {
  static const String route = 'users';

  static Route go() => MaterialPageRoute<void>(builder: (_) => UsersScreen());

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final users = <User>[
    User(uid: '1', name: 'Majo', email: 'majo@gmail.com', online: true),
    User(uid: '2', name: 'Mafe', email: 'mafe@gmail.com', online: true),
    User(uid: '3', name: 'Mario', email: 'mario@gmail.com', online: true),
    User(uid: '4', name: 'Marcos', email: 'marcos@gmail.com', online: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {},
        ),
        title: const Text(
          'Marcos',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.green),
          ),
          // Icon(Icons.check_circle, color: Colors.red,),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            title: Text(user.name),
            enabled: user.online,
            leading: CircleAvatar(child: Text(user.name.substring(0, 2))),
            trailing: CircleAvatar(
              radius: 5,
              backgroundColor: user.online ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }
}
