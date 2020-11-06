import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/views/login/login_page.dart';
import 'package:chat_app/views/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  static String routeName = '/loadingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Cargando ...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final AuthService authService =
        Provider.of<AuthService>(context, listen: false);
    final SocketServiceProvider socketService =
        Provider.of<SocketServiceProvider>(context, listen: false);
    final bool loggedIn = await authService.isLoggedIn();
    if (loggedIn) {
      socketService.connect();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => UserPage(),
          transitionDuration: Duration(milliseconds: 0),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => LoginPage(),
          transitionDuration: Duration(milliseconds: 0),
        ),
      );
    }
  }
}
