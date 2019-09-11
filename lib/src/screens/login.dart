import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/src/shared/fryo_icons.dart';
import './signup.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _toggleVisibility = true;

  Widget _buildPhoneTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Telephone",
        icon: Icon(Icons.phone_iphone),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(Icons.lock_outline),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Connexion",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'CenturyGothic'
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[ 
            Container(
              height: MediaQuery.of(context).size.height / 2.2, 
              // color: primaryColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/drawerimag.jpg',
                    
                  )
                )
              ),
            ),
            Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                SizedBox(
                  height: 55.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Besoin d'aide?",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        // color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),

                Card(
                  elevation: 12.0,
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        _buildPhoneTextField(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildPasswordTextField(),
                        SizedBox(height: 30.0,),

                        Container(
                          child: OutlineButton(
                            onPressed: (){},
                            child: Text('Se connecter', textScaleFactor: 1.4, style: TextStyle(fontFamily: 'Poppins'),),
                            textColor: primaryColor,
                            borderSide: BorderSide(color: primaryColor),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //   height: 50.0,
                //   decoration: BoxDecoration(
                //       color: Colors.grey[900],
                //       borderRadius: BorderRadius.circular(25.0)),
                //   child: Center(
                //     child: Text(
                //       "Se Connecter",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 18.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                
                Divider(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Pas encore inscrire",
                      style: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                      },
                      child: Text(
                        "Inscrivez-vous",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
        ]
          ),
      ),
    );
  }
}
