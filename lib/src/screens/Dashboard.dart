import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/screens/store.dart';
import '../shared/main_drawer.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      Store(),
      Text('Tab2'),
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
          title: Text('Hit Fast Food', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 27,
              icon: Icon(Icons.shop),
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
                
                icon: Icon(Fryo.shop),
                title: Text(
                  'Store',
                  style: tabLinkStyle,
                )
            ),
            BottomNavigationBarItem(
                
                icon: Icon(Fryo.cart),
                title: Text(
                  'Panier',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                
                icon: Icon(Fryo.heart_1),
                title: Text(
                  'Envies',
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
}

