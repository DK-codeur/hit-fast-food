import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import './src/providers/auth.dart';
import './src/providers/orders.dart';
import './src/screens/map.dart';
import './src/screens/profile_screen.dart';
import './src/screens/promo_screen.dart';
import './src/screens/store.dart';
import './src/screens/succes.sreen.dart';
import './src/providers/cart_provider.dart';
import './src/providers/datas_provider.dart';
import './src/screens/cart_screen.dart';
import './src/screens/login.dart';
import './src/screens/signup.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(
          value: Auth(),
        ),

      //  ChangeNotifierProxyProvider<Auth, ProductsProvider>(
      //     builder: (ctx, auth, prevProds) => ProductsProvider(
      //       auth.token, 
      //       prevProds == null ? [] : prevProds.foods
      //     ),
      //   ),
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),

        // ChangeNotifierProxyProvider<Auth, CategoriesProvider>(
        //   builder: (ctx, auth, prevCats) => CategoriesProvider(
        //     auth.token, 
        //     prevCats == null ? [] : prevCats.categorie
        //   ),
        // ),
        ChangeNotifierProvider.value(
          value: CategoriesProvider(),
        ),

        // ChangeNotifierProxyProvider<Auth, Orders>(
        //   builder: (ctx, auth, ord) => Orders(
        //     auth.token
        //   ),
        // ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),


        ChangeNotifierProvider.value(
          value: Cart(),
        ),

      ],

        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hit FastFood',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          
          home: auth.isAuth 
          ? HomePage(pageTitle: 'Welcome') 
          : FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (ctx, authResultSnapshot) => (authResultSnapshot.connectionState == ConnectionState.waiting) 
            ? SpinKitChasingDots(size: 50, color: Colors.red)
            : Login()
          ),

          routes: <String, WidgetBuilder> {
            SignUp.routeName: (BuildContext context) =>  SignUp(),
            Login.routeName: (BuildContext context) =>  Login(),
            Dashboard.routeName: (BuildContext context) => Dashboard(),
            ProductPage.routeName: (BuildContext context) => ProductPage(),
            // CategoryStoreScreen.routeName: (BuildContext context) => CategoryStoreScreen(),
            CartScreen.routeName : (BuildContext context) => CartScreen(),
            Store.routeName: (BuildContext context) => Store(),
            Maps.routeName: (BuildContext context) => Maps(),
            ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
            PromoScreen.routeName: (BuildContext context) => PromoScreen(),
            SuccesScreen.routeName: (BuildContext context) => SuccesScreen(),
            
          },
      ),
        ),
    );
  }
}
