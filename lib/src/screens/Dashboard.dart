import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hit_fast_food/src/providers/cart_provider.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:hit_fast_food/src/screens/promo_screen.dart';
import 'package:hit_fast_food/src/screens/store.dart';
import 'package:hit_fast_food/src/shared/my_flutter_app_icons.dart';
import 'package:hit_fast_food/src/widgets/badge.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../shared/main_drawer.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import 'cart_screen.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key); //311217

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  // final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  int _selectedIndex = 1;


  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    //Provider.of<ProductsProvider>(context).fetchAndSetProduct(); !!!!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<ProductsProvider>(context).fetchAndSetProduct();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true; 
      });

      Provider.of<ProductsProvider>(context).fetchAndSetProduct().then((_) {
        setState(() {
          _isLoading = false; 
        });
      });

      Provider.of<CategoriesProvider>(context).fetchAndSetCategory().then((_) {
        setState(() {
          _isLoading = false; 
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final _tabs = [
      PromoScreen(),
      Store(),
      Center(child: Text('Ma monnaie')),
    ];

    return Scaffold(
      // key: _keyScaffold,
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          // leading: IconButton(
          //   onPressed: () {
          //     _keyScaffold.currentState.openDrawer();
          //   },
          //   iconSize: 27,
          //   icon: Icon(Icons.apps),
          // ),
          backgroundColor: primaryColor,
          title: Text('Hit FastFood', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                value: cart.itemCount.toString(),
                child: ch,
              ),

              child: IconButton(
                icon: Icon(MyFlutterApp.shopping_bag),
                onPressed: () => Navigator.push( 
                  context,
                  PageTransition(
                  type: PageTransitionType.rightToLeft, 
                  duration: Duration(seconds: 1),
                  child: CartScreen()
                )
                ),
              ),



            ) 
          ],
        ),

        body:(_isLoading) 
          ? Center(child: SpinKitChasingDots(color: Colors.red, size: 50,))
          : _tabs[_selectedIndex],
        // FutureBuilder(
        //   future: Provider.of<ProductsProvider>(context).fetchAndSetProduct(),
        //   builder: (ctx, dataSnapshot) {
        //     if(dataSnapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());

        //     } else {

        //       if (dataSnapshot.error != null) {
        //         return Center(child: Text('an error occur !'));

        //       } else {
        //         return _tabs[_selectedIndex];
        //       }

        //     }
        //   },
        // ),

        drawer: MainDrawer(),

        bottomNavigationBar: BottomNavigationBar(
          
          iconSize: 16,
          backgroundColor: Colors.white,
          elevation: 15.0,
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          
          unselectedItemColor: Colors.grey,
          // fixedColor: Colors.green[600],
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                
                icon: Icon(Icons.card_giftcard),
                title: Text(
                  'Promo',
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
                
                icon: Icon(Icons.payment),
                title: Text(
                  'Ma monnaie',
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

// void menuInfo() {
//     SnackBar mysnack = new SnackBar(
//       content: new Text(
//         'Mon premier snackbar'
//       ),
//       backgroundColor: Colors.red,
//       duration: new Duration(seconds: 2),
//     );

//     Scaffold.of(context).showSnackBar(mysnack);
// }
}

