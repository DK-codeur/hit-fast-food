import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hit_fast_food/models/http_exception.dart';
import 'package:hit_fast_food/src/providers/auth.dart';
import 'package:hit_fast_food/src/screens/Dashboard.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:provider/provider.dart';
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
  final _emailFocus = FocusNode();
  final _telephoneFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmpasswordFocus = FocusNode();

  final _passwordController = TextEditingController();
  var _isLoading = false;

  final _form = GlobalKey<FormState>();

  Map<String, String> _authData = {
    'email': '',
    'password': '',

    'id': '',
    'email': '',
    'username': '',
    'phone': '',

  };


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An error occurred'),
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

  Widget _buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Nom Complet",
        icon: Icon(Icons.account_box),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),

      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_emailFocus);
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

      onSaved: (value) {
        _authData['username'] = value;
      },

    );
  }

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
      focusNode: _emailFocus,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_telephoneFocus);
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

      onSaved: (value) {
        _authData['phone'] = value;
      },

    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
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

      onSaved: (value) {
        _authData['password'] = value;
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
        if (value != _passwordController.text) {
          return 'Les mot de pass ne concordent pas';
        }

        return null;
      }

    );
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _telephoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmpasswordFocus.dispose();
    super.dispose();
  }

  //Submit

  void _submit() async {
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
      await Provider.of<Auth>(context, listen: false).signUp(
        _authData['email'],
        _authData['password'],

        Provider.of<Auth>(context, listen: false).userId,//id
        _authData['email'], //emailU == email
        _authData['username'],
        _authData['phone'],
      );
    } on HttpException catch(error) {
      var erroMessage = 'Erreur réesayez';

      if(error.toString().contains('EMAIL_EXISTS')) {
        erroMessage = 'Cet email existe deja';
      } else if(error.toString().contains('INVALID_EMAIL')) {
        erroMessage = 'Desolé cet email n\'est pas valide';
      } else if(error.toString().contains('WEAK_PASSWORD')) {
        erroMessage = 'Mot de passe trop court, 6 caratère min.';
      } 

      _showErrorDialog(erroMessage);

    } catch(error) {
      var erroMessage = 'Authentification impossible veillez réessayer $error';
       _showErrorDialog(erroMessage);
    }

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pushReplacement(
      PageTransition(
        type: PageTransitionType.fade, 
        duration: Duration(seconds: 3),
        child: Dashboard()
      )
    );

    (Provider.of<Auth>(context, listen: false).isAuth ) 
    ? Fluttertoast.showToast(
      msg: 'Connection reussi !',
      toastLength: Toast.LENGTH_LONG, 
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 13.0
    )

    : Fluttertoast.showToast(
      msg: 'Connection Echoue !',
      toastLength: Toast.LENGTH_LONG, 
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 13.0
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
              decoration: BoxDecoration(
              color: primaryColor,
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage(
                //     'images/drawerimag.jpg',
                    
                //   )
                // )
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

                Form( //Form
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
                          _buildEmailTextField(),
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
                  
                  child: (_isLoading) 
                ?   CircularProgressIndicator() 
                :   OutlineButton(
                    onPressed: _submit,

                    child: Text('S\'inscrire', textScaleFactor: 1.6, style: TextStyle(fontFamily: 'Poppins'),),
                    textColor: primaryColor,
                    borderSide: BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                  ),
                
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
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                            type: PageTransitionType.leftToRight, 
                            duration: Duration(seconds: 1),
                            child: Login()
                          )
                        );
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

                SizedBox(height: 20,)
              ],
            ),
        ),
        ]
          ),
      ),
    );
  }
}
