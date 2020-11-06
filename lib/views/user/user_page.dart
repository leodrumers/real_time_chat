import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/services/users_services.dart';
import 'package:chat_app/views/chat/chat_page.dart';
import 'package:chat_app/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPage extends StatefulWidget {
  static String routeName = '/userPage';

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserService userService = UserService();

  List<User> users = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    this._loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthService authServivce = Provider.of<AuthService>(context);
    final SocketServiceProvider socketService =
        Provider.of<SocketServiceProvider>(context);
    final User user = authServivce.user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          user.name,
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Container(
              padding: EdgeInsets.only(right: 16),
              child: socketService.serverStatus == ServerStatus.Online
                  ? Icon(Icons.check_circle, color: Colors.green[400])
                  : Icon(Icons.error, color: Colors.redAccent[400]))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black87,
          ),
          onPressed: () {
            socketService.disconnect();
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
            AuthService.deleteToken();
          },
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
        backgroundColor: Colors.blueAccent[400],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green[400] : Colors.red[400],
            borderRadius: BorderRadius.circular(100)),
      ),
      subtitle: Text(user.email),
      onTap: () {
        final ChatService chatService =
            Provider.of<ChatService>(context, listen: false);
        chatService.userDestiny = user;

        Navigator.pushNamed(context, ChatPage.routeName);
      },
    );
  }

  _loadUsers() async {
    this.users = await userService.getUsers();
    setState(() {});
    //await Future.delayed(Duration(microseconds: 5000));
    _refreshController.refreshCompleted();
  }
}
