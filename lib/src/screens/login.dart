import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hit_fast_food/src/providers/auth.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/models/http_exception.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import './signup.dart';
import 'Dashboard.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();
  bool _toggleVisibility = true;
  final _passwordFocus = FocusNode();

   var _isLoading = false;


  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email",
        icon: Icon(Icons.email),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),

      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },


      validator: (value) {
        if (value.isEmpty || !value.contains('@')) {
          return 'Email invalide';
        }
        return null;
      },

      onSaved: (value) {
        _authData['email'] = value;
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
      textInputAction: TextInputAction.done,
      focusNode: _passwordFocus,
      

       validator: (value) {
        if (value.isEmpty) {
          return 'Entrez un mot de passe';
        }

        if (value.length < 6 ) {
          return '6 caractère minimum';
        }

        return null;
      },

      onSaved: (value) {
        _authData['password'] = value;
      },

    );
  }

    @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

   void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Une erreur s\'est produite', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),),
        content: Text(message),

        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }



  Future<void> _submit() async {
    if(!_form.currentState.validate()) {
      //invalid
      return;
    }

    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    //connect / log
    try{
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email'],
        _authData['password'],
      );
    } on HttpException catch(error) {
       var errorMessage = 'Erreur réessayez';

      if(error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Email invalide';
      } else if(error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Utilisateur introuvable';
      } else if(error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Mot de passe incorrect';
      } else if(error.toString().contains('USER_DISABLED')) {
        errorMessage = 'Compte temporairement bloqué';
      }

      _showErrorDialog(errorMessage);

    } catch(error) {
      var errorMessage = 'Authentification impossible veillez réessayer';
       _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });

    if (Provider.of<Auth>(context, listen: false).isAuth ) {
      Navigator.of(context).pushReplacement(
        PageTransition(
          type: PageTransitionType.fade, 
          duration: Duration(seconds: 2),
          child: Dashboard()
        )
      );
      Fluttertoast.showToast(
        msg: 'Connection reussie !',
        toastLength: Toast.LENGTH_LONG, 
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 13.0
      );
    } 

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
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage(
                //     'images/drawerimag.jpg',
                    
                //   )
                // )
              ),
            ),
            Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'images/hitFastfood.gif',
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "",
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

                Form(
                  key: _form,

                  child: Card(
                    elevation: 12.0,
                    child: Container(
                      padding: EdgeInsets.all(25.0),
                      child: Column(
                        children: <Widget>[
                          _buildEmailTextField(),
                          SizedBox(
                            height: 20.0,
                          ),
                          _buildPasswordTextField(),
                          SizedBox(height: 30.0,),

                          Container(
                            child: (_isLoading) 
                            ? SpinKitFadingCircle(color: Colors.red, size: 45,)
                            : OutlineButton(
                              onPressed: _submit,
                              
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
                ),

                
                Divider(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Pas encore inscrit ?",
                      style: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context, PageTransition(
                            type: PageTransitionType.rightToLeft, 
                            duration: Duration(seconds: 1),
                            child: SignUp()
                          )
                        );
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
