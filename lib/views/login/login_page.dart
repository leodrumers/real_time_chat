import 'package:chat_app/colors_app.dart';
import 'package:flutter/material.dart';

import 'components/logo_header.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [LogoHeader()],
        ),
      ),
    );
  }
}
