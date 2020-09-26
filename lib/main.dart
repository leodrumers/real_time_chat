import 'package:chat_app/routes.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/views/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat app',
        home: LoadingPage(),
        //initialRoute: LoginPage.routeName,
        routes: routes,
      ),
    );
  }
}
