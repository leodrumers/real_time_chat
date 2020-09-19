import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('¿No tienes cuenta?',
            style: TextStyle(color: Colors.black54, fontSize: 15.0)),
        SizedBox(height: 10.0),
        Text(
          'Crea tu cuenta aquí',
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 100),
        Text(
          'Terminos y condiciones',
          style:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
