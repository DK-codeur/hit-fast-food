import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
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

  //request focus
  final _prenomsFocus = FocusNode();
  final _telephoneFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmpasswordFocus = FocusNode();

  final _form = GlobalKey<FormState>();

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

      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_prenomsFocus);
      },

      //onSave if method here

      validator: (value) {
        if (value.isEmpty) {
          return 'Entrez votre nom';
        }

        if (value.length == 1) {
          return 'Nom trop court';
        }

        return null;
      },

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

      textInputAction: TextInputAction.next,
      focusNode: _prenomsFocus,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_telephoneFocus);
      },


      validator: (value) {
        if (value.isEmpty) {
          return 'Entrez votre prenoms';
        }

        if (value.length == 1) {
          return 'prenoms trop court';
        }

        return null;
      },

    );
  }

  Widget _buildPhoneTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 8,
      decoration: InputDecoration(
        hintText: "Telephone",
        icon: Icon(Icons.phone_iphone),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),

      textInputAction: TextInputAction.next,
      focusNode: _telephoneFocus,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },

      validator: (value) {
        if (value.isEmpty) {
          return 'Entrez un numero de telephone';
        }

        if (value.length < 8 ) {
          return 'Numero trop court';
        }

        return null;
      },

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
          icon: _toggleVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),

      obscureText: _toggleVisibility,
      textInputAction: TextInputAction.next,
      focusNode: _passwordFocus,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_confirmpasswordFocus);
      },

       validator: (value) {
        if (value.isEmpty) {
          return 'Entrez un mot de passe';
        }

        if (value.length < 6 ) {
          return '6 caractère minimum';
        }

        return null;
      },

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
      textInputAction: TextInputAction.done,
      focusNode: _confirmpasswordFocus,
      obscureText: _toggleConfirmVisibility,

      validator: (value) {
        if (value.isEmpty) {
          return 'confirmez votre mot de passe';
        }

        if (value.length < 6 ) {
          return '6 caractère minimum';
        }

        return null;
      },

    );
  }

  @override
  void dispose() {
    _prenomsFocus.dispose();
    _telephoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmpasswordFocus.dispose();
    super.dispose();
  }

  // Future<void> _saveForm() async {
  //   final _isValid = _form.currentState.validate();

  //   if (!_isValid) {
  //     return ;
  //   }
  // }


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
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                SizedBox(
                  height: 30.0,
                ),

                Form(
                  key: _form,

                  child: Card(
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
