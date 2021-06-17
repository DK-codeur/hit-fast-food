import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/product.dart';
import 'package:provider/provider.dart';
import '../screens/productPage.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';


class FoodItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final product = Provider.of<Product>(context, listen: false);

    return Container(
      width: 170,
      height: 170,
      // color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(left: 10),
      child: Stack(
        children: <Widget>[
          InkWell( //image

            // onTap: () {
            //   Navigator.of(context).pushNamed(
            //     ProductPage.routeName,
            //     arguments: product.idPdt
            //   );
            // },

            // onTap: () => Navigator.push( 
            //   context,
            //   CupertinoPageRoute(
            //     builder: (context) => ProductPage(
            //       routeArgAsid: product.idPdt,
            //     ),
            //   )
            // ),

            // onTap: () {
            //   Navigator.push(
            //     context, 
            //     PageTransition(
            //       type: PageTransitionType.rightToLeftWithFade, 
            //       duration: Duration(milliseconds: 900),
            //       child: ProductPage(
            //         routeArgAsid: product.idPdt,
            //       )
            //     )
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
                  pageBuilder: (_, __, ___) => ProductPage( routeArgAsid: product.idPdt)
                )
              );
            },

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              width: 200,
              height: 185,
            
              child: Card(
                  color: white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: product.idPdt,
                    // child: Image.network(
                    //    product.image,
                    //    fit: BoxFit.contain
                    // )
                      child: FadeInImage.assetNetwork(
                      placeholder: 'images/load_img.png',
                      image: product.image.trim(),
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
                Text(product.title, style: foodNameText),
                Text('${product.price.toInt()} F', style: priceText),
              ],
            )
          ),
          Positioned( 
              top: 10,
              left: 10,
              child: (product.discount != 0)
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('-' + product.discount.toString() + '%',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )
                  : SizedBox(width: 0))
        ],
      ),
    );
  } //build


}
  



