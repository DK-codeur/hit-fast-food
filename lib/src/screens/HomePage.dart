import 'dart:async';

import 'package:flutter/material.dart';
import './Dashboard.dart';
// import './SignUpPage.dart';
// import './SignInPage.dart';
// import '../shared/buttons.dart';
// import '../shared/styles.dart';
// import 'package:page_transition/page_transition.dart';


class HomePage extends StatefulWidget {
  final String pageTitle;

  HomePage({Key key, this.pageTitle}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Dashboard()
      ));

    });
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
              Text('Chargement...', style: TextStyle(color: Colors.black)),

            //   Image.asset('images/welcome.png', width: 190, height: 190),
            //   Container(
            //     margin: EdgeInsets.only(bottom: 10, top: 0),
            //     child: Text('Hit Fast Food', style: logoStyle),
            //   ),
            //   Container(
            //     width: 200,
            //     margin: EdgeInsets.only(bottom: 0),
            //     child: froyoFlatBtn('Sign In', (){ 

            //       Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: SignInPage()));
            //     }),
            //   ),
            //   Container(
            //     width: 200,
            //     padding: EdgeInsets.all(0),
                // child: froyoOutlineBtn('Sign Up', (){
            //       Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: SignUpPage()));
            //       // Navigator.of(context).pushReplacementNamed('/signup');
            //      }),
            //   ),
            //   Container(
            //     margin: EdgeInsets.only(top: 25),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,

            //       children: <Widget>[
            //         Text('Langauage:', style: TextStyle(color: darkText)),
            //         Container(
            //           margin: EdgeInsets.only(left: 6),
            //           child: Text('English ›', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
            //         )
            //       ],
            //     ),
            //   )
            ],
          )),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
