import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hit_fast_food/src/providers/auth.dart';
import 'package:hit_fast_food/src/providers/orders.dart';
import 'package:hit_fast_food/src/screens/succes.sreen.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart' as ci;


class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _lieulivraisonFocus = FocusNode();
  final _telephoneFocus = FocusNode();

  final nomController = TextEditingController();
  final adController = TextEditingController();
  final phoneController = TextEditingController();


  final _form = GlobalKey<FormState>();
   var _isLoading = false;  

  Map<String, String> _deliveryData = {
    'name': '',
    'adress': '',
    'phone': '',
  };


  Future<void> submit() async {
    if(!_form.currentState.validate()) {
      return;
    }

    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
        backgroundColor: primaryColor,
      ),

      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total', style: TextStyle(fontSize: 22),),
                  Spacer(),
                  Chip(
                    label: Text(
                      '${cart.totalAmount.toInt()} FCFA', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      )
                    ), 
                    backgroundColor: primaryColor,
                  ),

                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => ci.CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
                cart.items.values.toList()[i].image,
                cart.items.values.toList()[i].isMenu,
              ),
            )
          )
        ],
      ),


      bottomNavigationBar: new Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text('Total', style: TextStyle(fontSize: 22)),
                subtitle: Text('${cart.totalAmount.toInt()} FCFA', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
              ),
            ),

            Expanded(
               
              child: RaisedButton(
                color: primaryColor,
                child: new Text('Je commande', style: TextStyle(color: Colors.white),),

                onPressed: ((cart.totalAmount.toInt()) > 0) ? dialogueConfirm : null
              ),

              // child: OrderButton(cart: cart,)
            )
          ],
        ),
      ),
    );
  }

    

//dialog confirm
  Future<Null> dialogueConfirm() async {
      return showDialog(
        context: context,
        barrierDismissible: false,

        builder: (BuildContext context) {
          final cart = Provider.of<Cart>(context);
          // final user = Provider.of<Auth>(context).userInfo;

          return new SimpleDialog(
            title: Text(
              'Information de livraison', 
              style: TextStyle(fontSize: 23,)
            ),
            contentPadding: EdgeInsets.all(12.0),
            
            children: <Widget>[
              
              Form(
                key: _form,

                child: Column(

                  children: <Widget>[
                    SizedBox(height: 20),
                  
                    TextFormField(
                      controller: nomController,
                      autovalidate: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Nom complet",
                        icon: Icon(Icons.account_box),
                        hintStyle: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                        ),
                      ),

                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_telephoneFocus);
                      },

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Entrez votre nom';
                        }

                        if (value.length == 1) {
                          return 'Nom trop court';
                        }

                        return null;
                      },

                      // onSaved: (value) {
                      //   _deliveryData['nom'] = value;
                      // },

                      onChanged: (value) {
                        setState(() {
                           _deliveryData['name'] = value;
                        });

                      },
                      
                    ),

                    SizedBox(height: 25,),
                    

                    TextFormField(
                      controller: phoneController,
                      autovalidate: true,
                      keyboardType: TextInputType.phone,
                      maxLength: 8,
                      decoration: InputDecoration(
                        hintText: "Téléphone",
                        icon: Icon(Icons.phone_iphone),
                        hintStyle: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                        ),
                      ),
                      
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_lieulivraisonFocus);
                      },
                      focusNode: _telephoneFocus,
                      
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Entrez un numero de telephone';
                        }

                        if (value.length < 8 ) {
                          return 'Numero trop court';
                        }

                        return null;
                      },

                      // onSaved: (value) {
                      //   _deliveryData['phone'] = value;
                      // },

                      onChanged: (value) {
                        setState(() {
                          _deliveryData['phone'] = value;
                        });
                      },
                      
                    ),

                    SizedBox(height: 25,),

                     TextFormField(
                      controller: adController,
                      autovalidate: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Lieu de livraison",
                        icon: Icon(Icons.location_on),
                        hintStyle: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                        ),
                      ),

                      focusNode: _lieulivraisonFocus,
                      textInputAction: TextInputAction.done,
                      

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Entrez un lieu pour la livraison';
                        }

                        if (value.length == 1) {
                          return 'Nom du lieu trop court';
                        }

                        return null;
                      },

                      // onSaved: (value) {
                      //   _deliveryData['adress'] = value;
                      // },

                      onChanged: (value) {
                        setState(() {
                          _deliveryData['adress'] = value;
                        });
                      },
                    ),

                    SizedBox(height: 25,),

                     

                    Divider(), 
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Annuler',
                            style: TextStyle(),
                          ),
                          onPressed: ()=> Navigator.pop(context),
                        ),

                      (nomController.text.isNotEmpty && adController.text.isNotEmpty && phoneController.text.isNotEmpty && (phoneController.text.length == 8)) 
                      ? OrderButton(
                          cart: cart,
                          userId: Provider.of<Auth>(context).userId,
                          name:  _deliveryData['name'],
                          adress: _deliveryData['adress'],
                          phone: _deliveryData['phone'],
                      )

                      : RaisedButton(
                        child: Text('En cours...'),
                        onPressed: null,
                      ),                        
                      ],
                    )

                  ],

                ),
              )
              
                
            ],
          );
        }
    );
  }

}



//order button

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
    @required this.userId,
    @required this.name,
    @required this.adress,
    @required this.phone,
  }) : super(key: key);

  final Cart cart;
  final String userId;
  final String name;
  final String adress;
  final String phone;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

   void _showErrorDialog(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ouups! Error', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),),
        content: Text(message),

        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (_isLoading)
      ?  SpinKitFadingCircle(color: Colors.red, size: 45)
      : RaisedButton(
         color: primaryColor,

        child:Text(
          'Je confirme',
          style: TextStyle(color: Colors.white)
        ),
          
        onPressed: (widget.cart.totalAmount <= 0 || _isLoading) 
        ? null 
        :  () async {

          setState(() {
            _isLoading = true;
          });


          try {
            await Provider.of<Orders>(context, listen: false).addOrder(
              widget.cart.items.values.toList(), 
              widget.cart.totalAmount,
              widget.userId,
              widget.name,
              widget.adress,
              widget.phone,
            );

            setState(() {
              _isLoading = false;
            });

            widget.cart.clear();

            Navigator.of(context).pop();

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SuccesScreen()
              )
            );

          } catch (error) {
            var errorMsg = "Une erreur s\'est produite veillez reessayer ou verifier votre connexion !";

            _showErrorDialog('$errorMsg'); 

          }

          // Fluttertoast.showToast(
          //   msg: 'Testtest Test',
          //   toastLength: Toast.LENGTH_LONG, 
          //   gravity: ToastGravity.BOTTOM,
          //   backgroundColor: primaryColor,
          //   textColor: Colors.white,
          //   fontSize: 14.0
          // );

         
        },
      ),
    );
  }
}

