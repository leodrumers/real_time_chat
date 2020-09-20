import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String firstText;
  final String linkedText;
  final String routeName;

  const Labels(
      {Key key,
      @required this.firstText,
      @required this.linkedText,
      @required this.routeName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText,
            style: TextStyle(color: Colors.black54, fontSize: 15.0)),
        SizedBox(width: 10.0),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, routeName);
          },
          child: Text(
            linkedText,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
