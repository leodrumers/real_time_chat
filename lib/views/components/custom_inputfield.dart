import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final TextInputType inputType;
  final TextEditingController textController;

  const CustomInputField({
    Key key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.inputType = TextInputType.text,
    @required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: textController,
        autocorrect: false,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
            icon: Icon(
              prefixIcon,
              color: Colors.grey,
            ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
    );
  }
}
