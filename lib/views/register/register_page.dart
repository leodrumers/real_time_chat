import 'package:chat_app/colors_app.dart';
import 'package:chat_app/views/login/components/label_widget.dart';
import 'package:chat_app/views/login/components/logo_header.dart';
import 'package:chat_app/views/login/login_page.dart';
import 'package:chat_app/views/register/components/RegisterFormWidget.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: backgroundColor,
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
                  btnFunction: () {},
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
