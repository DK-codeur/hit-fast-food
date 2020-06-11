import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/productPage.dart';
import '../shared/styles.dart';

class CategoryStoreItem extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    // final categoryId = ModalRoute.of(context).settings.arguments as int;
    final reqCatItem  = Provider.of<Product>(context, listen: false);

    return Container(
      width: 150,
      height: 200,
      // color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(left: 5),
      child: Stack(
        children: <Widget>[

          GestureDetector( //image
            // onTap: () { 
            //   Navigator.of(context).pushNamed(
            //     ProductPage.routeName,
            //     arguments: reqCatItem.idPdt
            //   );
            // },

            onTap: () async {
              await Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  pageBuilder: (_, __, ___) => ProductPage( routeArgAsid: reqCatItem.idPdt)
                )
              );
            },

            child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              width: 205,
              height: 185,
            
              child: Card(
                  color: white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                    child: Hero(
                      tag: reqCatItem.idPdt,
                      child: FadeInImage.assetNetwork(
                        alignment: Alignment.topCenter,
                        placeholder: 'images/load_img.png',
                        image: reqCatItem.image,
                        fit: BoxFit.contain,
                      ),
                    )
              )
            ),
          ),

          Positioned(
            bottom: 8,
            left: 10,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(reqCatItem.title, style: foodNameText),
                Text('${reqCatItem.price.toInt()} F', style: priceText),
              ],
            )
          ),
          Positioned( 
              top: 10,
              left: 10,
              child: (reqCatItem.discount != 0) //discount
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('-' + '${reqCatItem.discount.toInt()}' + '%',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          )
                      ),
                    )
                  : SizedBox(width: 0))
        ],
      ),
    );

  }

}