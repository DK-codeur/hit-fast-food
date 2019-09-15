import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/screens/store.dart';
import 'package:hit_fast_food/src/shared/my_flutter_app_icons.dart';
import '../shared/main_drawer.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      Text('panier'),
      Store(),
      Text('Tab3'),
    ];

    return Scaffold(
      key: _keyScaffold,
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              _keyScaffold.currentState.openDrawer();
            },
            iconSize: 27,
            icon: Icon(Icons.apps),
          ),
          backgroundColor: primaryColor,
          title: Text('Hit FastFood', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 27,
              icon: Icon(MyFlutterApp.shopping_bag),
            )
          ],
        ),

        body: _tabs[_selectedIndex],

        drawer: MainDrawer(),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 15.0,
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          // fixedColor: Colors.green[600],
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                
                icon: Icon(MyFlutterApp.shopping_bag),
                title: Text(
                  'Panier',
                  style: tabLinkStyle,
                )),

             BottomNavigationBarItem(
                
                icon: Icon(Fryo.shop),
                title: Text(
                  'Store',
                  style: tabLinkStyle,
                )
            ),

            BottomNavigationBarItem(
                
                icon: Icon(Icons.account_circle),
                title: Text(
                  'Compte',
                  style: tabLinkStyle,
                )
            ),
            
          ],
          
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

void menuInfo() {
    SnackBar mysnack = new SnackBar(
      content: new Text(
        'Mon premier snackbar'
      ),
      backgroundColor: Colors.red,
      duration: new Duration(seconds: 2),
    );

    Scaffold.of(context).showSnackBar(mysnack);
  }
}

