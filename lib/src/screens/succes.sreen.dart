import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/screens/Dashboard.dart';
import 'package:page_transition/page_transition.dart';


class SuccesScreen extends StatelessWidget {
  static const routeName = '/succes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white
                  ),
                  child: Icon(Icons.check, size: 50, color: Colors.green),
                  
                ),
              ),

              SizedBox(height: 20,),
              Text(
                'Commande validée',
                style: TextStyle(
                  fontSize: 22, 
                  fontFamily: 'CenturyGothic',
                  fontWeight: FontWeight.w700,
                  color: Colors.green
                ),
              ),

              SizedBox(height: 40,),

              Text(
                'Nous vous contacterons sous peu pour la livraison',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18, 
                  fontFamily: 'CenturyGothic',
                ),
              ),

               SizedBox(height: 20,),

              RaisedButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text('OK', textScaleFactor: 1.3,),
                onPressed: () => Navigator.pushReplacement(
                  context, 
                  PageTransition(
                    type: PageTransitionType.fade, 
                    duration: Duration(seconds: 1),
                    child: Dashboard()
                  )
                )
              ),

               SizedBox(height: 10,),
             
            ],
          ),
        ),
      ),
    );
  }
}