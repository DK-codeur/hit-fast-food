import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/src/widgets/promo_item.dart';
import 'package:provider/provider.dart';

class PromoScreen extends StatelessWidget {
  static const routeName = '/promoPge'; 
  @override
  Widget build(BuildContext context) {
    
    final reqProductDiscount = Provider.of<ProductsProvider>(context).foodsDiscount();

    return Scaffold(
      backgroundColor: bgColor,
      
      body: GridView.builder(
        itemCount: (reqProductDiscount.length != 0) 
      ? reqProductDiscount.length
      : 0,
        padding: const EdgeInsets.all(7.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4.5/5,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0
        ),

        itemBuilder: (ctx, index) => ChangeNotifierProvider.value (
          value: reqProductDiscount[index],
          child: PromoItem(
            //...id title 
          )
        ),
              
            ),
    );
  }
}