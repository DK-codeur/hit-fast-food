import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
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


  @override
  void initState() {
    //Provider.of<ProductsProvider>(context).fetchAndSetProduct(); !!!!
    Future.delayed(Duration.zero).then((_) {
      Provider.of<ProductsProvider>(context).fetchAndSetProduct();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(58),
                  topRight: Radius.circular(58),
                )
            ),
            // margin: EdgeInsets.only(top: 34),
            child: Container(
              margin: EdgeInsets.only(top: 50),
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
          ),
     
    );

  }
}
