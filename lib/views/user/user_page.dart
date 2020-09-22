import 'package:chat_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPage extends StatefulWidget {
  static String routeName = '/userPage';

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final List<User> users = [
    User(
        uid: '1',
        name: 'Leo',
        online: true,
        email: 'leodrumers@gmail',
        color: 0xFF00A6A6),
    User(
        uid: '2',
        name: 'Yura',
        online: false,
        email: 'yura@gmail',
        color: 0xffB48EAE),
    User(uid: '3', name: 'Mathias', online: true, email: 'mathias@gmail'),
    User(
        uid: '4',
        name: 'Other',
        online: false,
        email: 'other@gmail',
        color: 0xff0267c1),
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mi nombre',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.check_circle,
              color: Colors.green[400],
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _loadUsers,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check_circle,
            color: Colors.green[500],
          ),
          waterDropColor: Colors.black87,
        ),
        enablePullDown: true,
        child: _buildUserList(),
      ),
    );
  }

  ListView _buildUserList() {
    return ListView.separated(
      itemBuilder: (_, index) => buildUserListTile(users[index]),
      separatorBuilder: (_, index) => Divider(),
      itemCount: users.length,
    );
  }

  ListTile buildUserListTile(User user) {
    return ListTile(
      title: Text(user.name),
      leading: CircleAvatar(
        child: Text(
          user.name.substring(0, 2),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(user.color),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green[400] : Colors.red[400],
            borderRadius: BorderRadius.circular(100)),
      ),
      subtitle: Text(user.email),
    );
  }

  _loadUsers() async {
    await Future.delayed(Duration(microseconds: 5000));
    _refreshController.refreshCompleted();
  }
}
