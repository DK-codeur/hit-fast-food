import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Maps extends StatelessWidget {
  static const routeName = '/map';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nous localiser'),
            // SizedBox(width: 24,),
            Icon(Icons.location_on),
          ],
        ),
        centerTitle: true,
        
      ),
      body: WebviewScaffold(
          //https://www.google.com/maps/place/Hit+Fast+Food/@5.2123998,-3.7646927,16z/data=!4m5!3m4!1s0x0:0xc349c999738e416!8m2!3d5.2112963!4d-3.7647321
          //https://www.google.com/maps/place/Hit+Fast+Food/@5.2130913,-3.7731006,15z/data=!4m5!3m4!1s0x0:0xc349c999738e416!8m2!3d5.2112963!4d-3.7647321
          url: 'https://www.google.com/maps/place/Hit+Fast+Food/@5.2123998,-3.7646927,16z/data=!4m5!3m4!1s0x0:0xc349c999738e416!8m2!3d5.2112963!4d-3.7647321',
          // initialChild: Center(
          //   child: CircularProgressIndicator()
          // ),
          
      ),
    );
  }



}