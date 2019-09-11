import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/screens/login.dart';
import 'package:hit_fast_food/src/screens/signup.dart';
// import 'package:hit_fast_food/src/widgets/drawercategorie.dart';
// import './colors.dart';
// import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  // widget funct
  Widget menuList(String title, IconData icon, Function itemMenuTap) {
    return ListTile(
      leading: Icon(icon, size: 24,),
      title: Text(
        title, 
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: itemMenuTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 190,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomCenter,
                  // color: primaryColor,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/drawerimag.jpg',
                      )
                    )
                  ),
                  child: Text(
                    'Bienvenue !',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                      color: Colors.white,
                    )
                  ),
              
                )
              ],
            ),

            SizedBox(height: 20,),

            // DrawerCategorie(),
            menuList('Login', Icons.verified_user,() => Navigator.of(context).pushNamed(Login.routeName)),
            menuList('Sign up', Icons.account_circle,() => Navigator.of(context).pushNamed(SignUp.routeName)),

            
          ],
        ),
      ),
    );
  }
}