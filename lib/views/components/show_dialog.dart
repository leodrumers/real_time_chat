import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showErrorDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        MaterialButton(
          child: Text(
            'Ok',
            style: TextStyle(color: Colors.blue),
          ),
          elevation: 5,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    ),
  );
}
