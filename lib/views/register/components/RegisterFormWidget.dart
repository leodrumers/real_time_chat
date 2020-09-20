import 'package:chat_app/views/components/custom_inputfield.dart';
import 'package:chat_app/views/components/raised_custom_button.dart';
import 'package:flutter/material.dart';

class RegisterFormWidget extends StatelessWidget {
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController nameCtrl;

  final Function btnFunction;

  const RegisterFormWidget({
    Key key,
    @required this.emailCtrl,
    @required this.passCtrl,
    @required this.btnFunction,
    @required this.nameCtrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 16),
          CustomInputField(
              textController: emailCtrl,
              hintText: 'Nombre',
              inputType: TextInputType.text,
              prefixIcon: Icons.person_outline),
          CustomInputField(
              textController: emailCtrl,
              hintText: 'Email',
              inputType: TextInputType.emailAddress,
              prefixIcon: Icons.mail_outline),
          CustomInputField(
            textController: passCtrl,
            hintText: 'Password',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
          ),
          SizedBox(height: 32),
          RaisedCustomButton(btnText: 'Crear', btnFunction: btnFunction)
        ],
      ),
    );
  }
}
