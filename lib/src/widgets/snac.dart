import 'package:flutter/material.dart';

class Snac extends StatelessWidget {
  final String myvar;

  Snac(this.myvar);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          "Menu",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
        ),

        onPressed: () {
          // print('tapppp');
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Un plat menu est disponible pour $myvar'),
            duration: Duration(seconds: 3),
          ));
        }
    );
  }
}

