import 'package:flutter/cupertino.dart';

class LogoHeader extends StatefulWidget {
  final String title;
  const LogoHeader({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  _LogoHeaderState createState() => _LogoHeaderState();
}

class _LogoHeaderState extends State<LogoHeader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 15),
            Image(
              image: AssetImage('assets/images/chat.png'),
              width: 120,
            ),
            SizedBox(height: 15),
            Text(widget.title, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
