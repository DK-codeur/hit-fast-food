import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/auth.dart';
import 'package:hit_fast_food/src/screens/map.dart';
import 'package:hit_fast_food/src/screens/profile_screen.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:page_transition/page_transition.dart';
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
          color: Colors.grey[600]
        ),
      ),
      onTap: () {
        itemMenuTap();
        
      },
    );
  }


  String capitalize(String s) {
    return  s.toUpperCase();
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
                 
                 capitalize(Provider.of<Auth>(context).userInfo['username']),

                 Icons.account_circle, 
                
                  () async {
                   Navigator.of(context).pop();
                   await Navigator.of(context).push(
                     
                     PageTransition(
                       type: PageTransitionType.rightToLeftWithFade,
                       duration: Duration(milliseconds: 600),
                       child: ProfileScreen()
                     )
                    );
                  }
              ),

              

              Divider(),
              // menuList('Ma monnaie', Icons.payment,() => Navigator.of(context).pushNamed(Login.routeName)),
              // menuList('Promos', Icons.card_giftcard,() => Navigator.of(context).pushNamed("")),
              menuList(
                'Nos restaurants', 
                Icons.location_on,
                () {
                  Navigator.of(context).push(
                    PageTransition(
                       type: PageTransitionType.rightToLeftWithFade,
                       duration: Duration(milliseconds: 600),
                       child: Maps()
                     )
                  );
              
                }
              ),

              Divider(),

              SizedBox(height: MediaQuery.of(context).size.height /15),


            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget> [ 
               Container(
                margin: EdgeInsets.only(left: 4, right: 4),
                height: 40,
                width: MediaQuery.of(context).size.width /2,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: InkWell(
                  onTap: () async{
                   
                    try{
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/');
                      Provider.of<Auth>(context, listen: false).logout();
                    } catch (error) {
                      throw error;
                    }
                    
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.power_settings_new, color: Colors.white, size: 20,),
                      Text(
                          'Deconnexion',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ],
                  ),
                  
                ),
              ),
            ]
          ),



            ],
          ),
        ),
      ),
    );
  }
}