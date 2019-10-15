import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/cart_provider.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/src/shared/my_flutter_app_icons.dart';
import 'package:hit_fast_food/src/widgets/badge.dart';
import 'package:hit_fast_food/src/widgets/category_store_item.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';


class CategoryStoreScreen extends StatelessWidget {
  static const routeName = '/categoryStore';

  @override
  Widget build(BuildContext context) {

    // final reqProdCategory = foods.where((prodcat) => prodcat.cat == categoryId).toList();
    final categoryId = ModalRoute.of(context).settings.arguments as String;
    final reqProdCategory = Provider.of<ProductsProvider>(context).foodsByCat(int.parse(categoryId));
    final category = Provider.of<CategoriesProvider>(context).findById(categoryId);
    final categoryName = category.name;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: primaryColor,
        actions: <Widget>[
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                value: cart.itemCount.toString(),
                child: ch,
              ),

              child: IconButton(
                icon: Icon(MyFlutterApp.shopping_bag, color: Colors.white,),
                iconSize: 27,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            )
          ],
      ),
      
      // body: ListView.builder(
      //   itemCount: reqProdCategory.length,
      //   itemBuilder: (context, index) => ChangeNotifierProvider.value(
      //     value: reqProdCategory[index],
      //     child: CategoryStoreItem(
      //       //all prop id, title...
      //     ),
      //   ),

       
      // )

      body: GridView.builder(
              itemCount: reqProdCategory.length,
              padding: const EdgeInsets.all(7.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4.5/5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0
              ),

              itemBuilder: (ctx, index) => ChangeNotifierProvider.value (
                value: reqProdCategory[index],
                child: CategoryStoreItem(
                  //...id title 
                )
              ),
              
            ),

        // },
      // )
    );
  }
}