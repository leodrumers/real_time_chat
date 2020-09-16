import 'package:flutter/cupertino.dart';

class LogoHeader extends StatefulWidget {
  const LogoHeader({
    Key key,
  }) : super(key: key);

  @override
  _LogoHeaderState createState() => _LogoHeaderState();
}

class _LogoHeaderState extends State<LogoHeader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        child: Column(
          children: [
            SizedBox(height: 30),
            Image(image: AssetImage('assets/images/chat.png')),
            SizedBox(height: 30),
            Text('Messenger', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
