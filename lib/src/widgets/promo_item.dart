import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/product.dart';
import 'package:hit_fast_food/src/screens/productPage.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/src/shared/styles.dart';
import 'package:provider/provider.dart';

class PromoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final reqProductPromoItem = Provider.of<Product>(context, listen: false);
    
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
          InkWell( //image

            onTap: () {
              Navigator.of(context).pushNamed(
                ProductPage.routeName,
                arguments: reqProductPromoItem.idPdt
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
                    transitionOnUserGestures: true,
                    tag: reqProductPromoItem.title,
                    child: Container(
                      child: FadeInImage.assetNetwork(
                        alignment: Alignment.topCenter,
                        placeholder: 'images/load_img.png',
                        image: reqProductPromoItem.image,
                        fit: BoxFit.contain,
                      ),
                    )
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
                Text(reqProductPromoItem.title, style: foodNameText),
                Text('${reqProductPromoItem.price.toInt()} F', style: priceText),
              ],
            )
          ),
          Positioned( 
              top: 10,
              left: 10,
              child: (reqProductPromoItem.discount != 0) //discount
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('-' + '${reqProductPromoItem.discount.toInt()}' + '%',
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