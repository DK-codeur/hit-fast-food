import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './Dashboard.dart';


class HomePage extends StatefulWidget {
  final String pageTitle;

  HomePage({Key key, this.pageTitle}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 10), 
      () {
        Navigator.pushReplacement(
          context, PageTransition(
            type: PageTransitionType.fade, 
            duration: Duration(seconds: 2),
            child: Dashboard()
          )
        );
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 25,
            color: Colors.red,
          ),

          Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  'images/hitFastfood.gif',
                ),
              ),
              SizedBox(height: 30.0,),
              Text('Chargement...', style: TextStyle(color: Colors.black)),//311217

            
            ],
          )),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
