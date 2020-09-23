import 'package:chat_app/colors_app.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/views/components/show_dialog.dart';
import 'package:chat_app/views/login/components/label_widget.dart';
import 'package:chat_app/views/register/register_page.dart';
import 'package:chat_app/views/user/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LogoHeader(
                  title: 'Messenger',
                ),
                LoginFormWidget(
                  emailCtrl: emailCtrl,
                  passCtrl: passCtrl,
                  btnFunction: authService.logging
                      ? null
                      : () async {
                          await _loginBtnFunctions(context, authService);
                        },
                ),
                SizedBox(height: 30),
                Labels(
                  firstText: '¿No tienes cuenta?',
                  linkedText: 'Creala ahora',
                  routeName: RegisterPage.routeName,
                ),
                SizedBox(height: 100),
                Text(
                  'Terminos y condiciones',
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _loginBtnFunctions(
      BuildContext context, AuthService authService) async {
    FocusScope.of(context).unfocus();
    bool okLogin =
        await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
    okLogin
        ? Navigator.pushReplacementNamed(context, UserPage.routeName)
        : showErrorDialog(
            context, 'Error', 'Por favor valide sus credenciales');
  }
}
