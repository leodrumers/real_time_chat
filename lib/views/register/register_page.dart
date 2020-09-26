import 'package:chat_app/colors_app.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/views/components/show_dialog.dart';
import 'package:chat_app/views/login/components/label_widget.dart';
import 'package:chat_app/views/login/components/logo_header.dart';
import 'package:chat_app/views/login/login_page.dart';
import 'package:chat_app/views/register/components/RegisterFormWidget.dart';
import 'package:chat_app/views/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = '/registerPage';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
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
              children: [
                LogoHeader(
                  title: 'Crea tu cuenta',
                ),
                RegisterFormWidget(
                  nameCtrl: nameCtrl,
                  emailCtrl: emailCtrl,
                  passCtrl: passCtrl,
                  btnFunction: authService.logging
                      ? null
                      : () async {
                          final okRegister = await authService.register(
                              nameCtrl.text, emailCtrl.text, passCtrl.text);
                          if (okRegister == true) {
                            Navigator.pushReplacementNamed(
                                context, UserPage.routeName);
                          } else {
                            showErrorDialog(context, 'Error en registro',
                                okRegister.toString());
                          }
                        },
                ),
                SizedBox(height: 20),
                Labels(
                  firstText: '¿Ya tienes cuenta?',
                  linkedText: 'Ingresar',
                  routeName: LoginPage.routeName,
                ),
                SizedBox(height: 100),
                Stack(children: [
                  Positioned(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Text(
                        'Terminos y condiciones',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
