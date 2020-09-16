import 'package:chat_app/routes.dart';
import 'package:chat_app/views/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      home: LoginPage(),
      //initialRoute: LoginPage.routeName,
      routes: routes,
    );
  }
}
