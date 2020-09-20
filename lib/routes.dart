import 'package:chat_app/views/chat_page.dart';
import 'package:chat_app/views/loading_page.dart';
import 'package:chat_app/views/user_page.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/Leo/Documents/flutter/chat_app/lib/views/login/login_page.dart';
import 'file:///C:/Users/Leo/Documents/flutter/chat_app/lib/views/register/register_page.dart';

final Map<String, WidgetBuilder> routes = {
  ChatPage.routeName: (context) => ChatPage(),
  LoadingPage.routeName: (context) => LoadingPage(),
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  UserPage.routeName: (context) => UserPage(),
};
