import 'package:flutter/material.dart';

class RaisedCustomButton extends StatelessWidget {
  final String btnText;

  const RaisedCustomButton({
    Key key,
    @required this.btnFunction,
    @required this.btnText,
  }) : super(key: key);

  final Function btnFunction;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: btnFunction,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
            child: Text(
          btnText,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ),
    );
  }
}
