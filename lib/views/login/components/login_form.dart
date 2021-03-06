import 'package:chat_app/views/components/custom_inputfield.dart';
import 'package:chat_app/views/components/raised_custom_button.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;

  final Function btnFunction;

  const LoginFormWidget(
      {Key key,
      @required this.emailCtrl,
      @required this.passCtrl,
      @required this.btnFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 16),
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
          RaisedCustomButton(btnText: 'Login', btnFunction: btnFunction)
        ],
      ),
    );
  }
}
