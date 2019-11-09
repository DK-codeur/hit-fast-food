import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hit_fast_food/src/shared/colors.dart';

class Maps extends StatelessWidget {
  static const routeName = '/map';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nous localiser', style: TextStyle(color: primaryColor)),
            // SizedBox(width: 24,),
            Icon(Icons.location_on, color: primaryColor),
          ],
        ),
        centerTitle: true,
        
      ),
      body: WebviewScaffold(
          
          url: 'https://www.google.com/maps/place/Hit+Fast+Food/@5.2123998,-3.7646927,16z/data=!4m5!3m4!1s0x0:0xc349c999738e416!8m2!3d5.2112963!4d-3.7647321',
          
          
      ),
    );
  }



}