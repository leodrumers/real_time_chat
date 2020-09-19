import 'package:chat_app/colors_app.dart';
import 'package:chat_app/views/login/components/label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/login_form.dart';
import 'components/logo_header.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogoHeader(),
                FormWidget(
                  emailCtrl: emailCtrl,
                  passCtrl: passCtrl,
                  btnFunction: () {
                    print(emailCtrl.text);
                    print(passCtrl.text);
                  },
                ),
                SizedBox(height: 30),
                Labels(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
