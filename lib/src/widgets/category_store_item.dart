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
    final reqCatItem  = Provider.of<Product>(context);



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
                arguments: reqCatItem.idPdt
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
                    tag: reqCatItem.title,
                    child: Container(
                      child: Image.asset(
                        reqCatItem.image,
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter, //aligne image
                      )
                    )
                  )
              )
            ),
          ),

          // Positioned(
          //   bottom: 64,
          //   right: 8,
            // child: (menuPrice != null) ? Snac() : SizedBox(width: 0,)
            // child: FlatButton(
            //   padding: EdgeInsets.all(20),
            //   shape: CircleBorder(),
            //   onPressed: onLike,
            //   child: Icon(
            //     (food.userLiked) ? Icons.favorite : Icons.favorite_border,
            //     color: (food.userLiked) ? primaryColor : darkText,
            //     size: 30,
            //   ),
            // ),
          // ),

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
              child: (reqCatItem.discount != null)
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('-' + reqCatItem.discount.toString() + '%',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )
                  : SizedBox(width: 0))
        ],
      ),
    );



    // return InkWell(
    //   onTap: () {
    //     Navigator.of(context).pushNamed(
    //         ProductPage.routeName,
    //         arguments: reqCatItem.idPdt
    //       );
    //   },

    //   child: Card(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //     elevation: 10,
    //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

    //     child: Column(
    //       children: <Widget>[
    //         Stack(
    //           children: <Widget>[
    //             ClipRRect(
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(15),
    //                 topRight: Radius.circular(15)
    //               ),
    //               child: Image.asset(
    //                 reqCatItem.image,
    //                 height: MediaQuery.of(context).size.height / 2.1,
    //                 width: double.infinity,
    //                 fit: BoxFit.fill
    //               ),
    //             ),

    //             Positioned(
    //               bottom: 20.0,
    //               right: 10.0,
    //               child: Container(
    //                 width: 250.0,
    //                 color: Colors.black54,
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 5.0,
    //                   horizontal: 20.0
    //                 ),

    //                 child: Text(
    //                   reqCatItem.name,
    //                   style: TextStyle(fontSize: 24.0, color: Colors.white,),
    //                   softWrap: true,
    //                   overflow: TextOverflow.fade,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),

    //         Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //           child: Row(
    //             mainAxisAlignment: (reqCatItem.menuPrice != null) ? MainAxisAlignment.spaceAround: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Column(
    //                 children: <Widget>[
    //                   Text( (reqCatItem.menuPrice != null) ? 'Sandwich' : '', style: h6,),
    //                   Text('${reqCatItem.price.toInt()} F', style: h4),
    //                 ],
    //               ),

    //                 (reqCatItem.menuPrice != null) 
    //               ?

    //               Column(
    //                 children: <Widget>[
    //                   Text('Menu', style: h6),
    //                   Text('${reqCatItem.menuPrice.toInt()} F', style: h4),
    //                 ],
    //               )

    //               : 
    //                 SizedBox(width: 0,),


    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }


    // void selectFood(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   ProductPage.routeName,
    //   arguments: {
        // 'idItem': idcat, //id of food on cat
        
        // 'name': name,
        // 'isMenu': isMenu,
        // 'price': price,
        // 'image': image,
        // 'discount': discount
    //   }
    // );
  // }

}