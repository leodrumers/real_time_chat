import 'package:chat_app/views/chat/chat_page.dart';
import 'package:chat_app/views/loading_page.dart';
import 'package:chat_app/views/login/login_page.dart';
import 'package:chat_app/views/register/register_page.dart';
import 'package:chat_app/views/user/user_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  ChatPage.routeName: (context) => ChatPage(),
  LoadingPage.routeName: (context) => LoadingPage(),
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  UserPage.routeName: (context) => UserPage(),
};
