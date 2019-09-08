import 'package:flutter/material.dart';
// import './colors.dart';
// import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  //widget funct
  Widget menuList(String title, IconData icon, Function itemMenuTap) {
    return ListTile(
      leading: Icon(icon, size: 24,),
      title: Text(
        title, 
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
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
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 210,
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
          menuList(
            'Categorie 1', 
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed('/');
            }
          ),
          menuList(
            'Categorie 1', 
            Icons.settings,
            () {
              // Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            }
          )
        ],
      ),
    );
  }
}