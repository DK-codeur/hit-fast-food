import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/auth.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:hit_fast_food/src/widgets/deals.dart';
import 'package:provider/provider.dart';
import '../widgets/headerTopCategories.dart';


class Store extends StatefulWidget {
  static const routeName = '/store';

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  // var _isInit = true;
  // var _isLoading = false;

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsProvider>(context).fetchAndSetProduct();
    await Provider.of<CategoriesProvider>(context).fetchAndSetCategory();
    await Provider.of<Auth>(context).fetchUserData();
  }

  @override
  void initState() {
    //Provider.of<ProductsProvider>(context).fetchAndSetProduct(); !!!!
    Future.delayed(Duration.zero).then((_) {
      Provider.of<ProductsProvider>(context).fetchAndSetProduct();
    });

    Future.delayed(Duration.zero).then((_) {
      Provider.of<CategoriesProvider>(context).fetchAndSetCategory();
    });

    // Future.delayed(Duration.zero).then((_) {
    //   _refreshProducts(context);
    // });

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    //place la courbe avt le scaffold ds un container
    return Scaffold(
      // backgroundColor: primaryColor,
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),

        child: SingleChildScrollView(
          
          child: Column(
            children:<Widget>[
              HeaderCategoriesTop(),
              
              Deals('Burger', () {}, 2),
              Deals('Chicken', () {}, 1),
              Deals('Tacos', () {}, 3),
              Deals('Grillades & Platter', () {}, 4),
              Deals('Sandwich & Hot Dog', () {}, 5),
              Deals('Salades', () {}, 6), 
            ],
          ),
                   
        ),
      ),
     
    );

  }
}
