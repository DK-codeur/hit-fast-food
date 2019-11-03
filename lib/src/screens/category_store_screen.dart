import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/cart_provider.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/src/shared/my_flutter_app_icons.dart';
import 'package:hit_fast_food/src/widgets/badge.dart';
import 'package:hit_fast_food/src/widgets/category_store_item.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';


class CategoryStoreScreen extends StatefulWidget {
  final String id;
  final int fakeId;

  CategoryStoreScreen({
    @required this.id, 
    @required this.fakeId
  });

  static const routeName = '/categoryStore';

  @override
  _CategoryStoreScreenState createState() => _CategoryStoreScreenState();
}

class _CategoryStoreScreenState extends State<CategoryStoreScreen> {
  @override
  Widget build(BuildContext context) {

    // final reqProdCategory = foods.where((prodcat) => prodcat.cat == categoryId).toList();
    // final req = ModalRoute.of(context).settings.arguments as Map<String, dynamic>; //map because id & fake id

    final categoryId = widget.id; //for id (AA)
    final categoryFakeId = widget.fakeId; //for fake id (BB)

    final category = Provider.of<CategoriesProvider>(context).findById(categoryId); // (AA) (C)
    final categoryName = category.name; // (C)

    final reqProdCategory = Provider.of<ProductsProvider>(context).foodsByFakeCatId(categoryFakeId); // (BB)
    

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
                  Navigator.of(context).push(
                   PageTransition(
                      type: PageTransitionType.rightToLeft, 
                      duration: Duration(seconds: 1),
                      child: CartScreen()
                    )
                  );
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