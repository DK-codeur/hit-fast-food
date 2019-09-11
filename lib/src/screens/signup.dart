import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/src/shared/fryo_icons.dart';
import './login.dart';
import '../shared/colors.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _toggleVisibility = true;
  bool _toggleConfirmVisibility = true;

  Widget _buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Nom",
        icon: Icon(Icons.account_box),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

   Widget _buildLastNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Prenoms",
        icon: Icon(Icons.account_box),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

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
        icon: Icon(Icons.lock),
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

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Confirm Password",
        icon: Icon(Icons.lock),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleConfirmVisibility = !_toggleConfirmVisibility;
            });
          },
          icon: _toggleConfirmVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleConfirmVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor, 
        elevation: 0,
        title: Text(
          "Inscription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'CenturyGothic'
          ),
        ),
      ),
      // resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
          child: Stack(
            children:<Widget>[ 
               Container(
              height: MediaQuery.of(context).size.height / 2.5, 
              // color: primaryColor,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/drawerimag.jpg',
                    
                  )
                )
              ),
            ),


            Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                SizedBox(
                  height: 30.0,
                ),
                Card(
                  elevation: 12.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        _buildNameTextField(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildLastNameTextField(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildPhoneTextField(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildPasswordTextField(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildConfirmPasswordTextField(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: OutlineButton(
                    onPressed: (){},
                    child: Text('S\'inscrire', textScaleFactor: 1.6, style: TextStyle(fontFamily: 'Poppins'),),
                    textColor: primaryColor,
                    borderSide: BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                  ),
                //   height: 50.0,
                //   decoration: BoxDecoration(
                //       color: Colors.grey[900],
                //       borderRadius: BorderRadius.circular(25.0)),
                //   child: Center(
                //     child: Text(
                //       "S'inscrire",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 18.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                ),
                Divider(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Deja un compte ?",
                      style: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Login()));
                      },
                      child: Text(
                        "Connectez-vous",
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
