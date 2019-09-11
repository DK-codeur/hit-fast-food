import 'package:flutter/material.dart';
import 'src/screens/login.dart';
import 'src/screens/signup.dart';

import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hit FastFood',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(pageTitle: 'Welcome'),
      routes: <String, WidgetBuilder> {
        SignUp.routeName: (BuildContext context) =>  SignUp(),
        Login.routeName: (BuildContext context) =>  Login(),
        Dashboard.routeName: (BuildContext context) => Dashboard(),
        ProductPage.routeName: (BuildContext context) => ProductPage(),
      },
    );
  }
}
