import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/auth.dart';
import 'package:hit_fast_food/src/screens/login.dart';
import 'package:hit_fast_food/src/screens/map.dart';
import 'package:hit_fast_food/src/screens/profile_screen.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:provider/provider.dart';


class MainDrawer extends StatelessWidget {

  // widget funct
  Widget menuList(String title, IconData icon, Function itemMenuTap) {
    return ListTile(
      leading: Icon(icon, size: 24,),
      title: Text(
        title, 
        style: TextStyle(
          fontFamily: 'CenturyGhotic',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        itemMenuTap();
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(context),
          ),
        ),
        body: SingleChildScrollView(

            child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    
                    height: 270,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 40),
                    alignment: Alignment.bottomCenter,
                    // color: primaryColor,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage(
                      //     'images/drawerimag.jpg',
                      //   )
                      // )
                    ),

                    child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          
                          'images/car.png'
                        )
                      )
                    )
                  )
                
                  ),

                  Positioned(
                    bottom: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          'Graya c\'est la base!',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 25,
                            color: Colors.white,
                          )
                        ),
                    ),
                  ),

                  
                ],
              ),

              SizedBox(height: 20,),

              // DrawerCategorie(),
              menuList(
                 (Provider.of<Auth>(context, listen: false).isAuth ) 
                 ? (Provider.of<Auth>(context, listen: false).userId)
                 :  'Compte', 

                 Icons.account_circle, 

                 (Provider.of<Auth>(context, listen: false).isAuth )
                 ? ()=> Navigator.of(context).pushNamed(ProfileScreen.routeName)
                 : ()=> Navigator.of(context).pushNamed(Login.routeName)
              ),

              Divider(),
              menuList('Ma monnaie', Icons.payment,() => Navigator.of(context).pushNamed(Login.routeName)),
              menuList('Promos', Icons.card_giftcard,() => Navigator.of(context).pushNamed("")),
              menuList('Nos restaurants', Icons.location_on,() => Navigator.of(context).pushNamed(Maps.routeName)),

            ],
          ),
        ),
      ),
    );
  }
}