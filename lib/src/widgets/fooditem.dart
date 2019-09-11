import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/widgets/snac.dart';
import '../screens/productPage.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';


class FoodItem extends StatelessWidget {
  final int idItem;
  final String name;
  final String isMenu;
  final double price;
  final double menuPrice;
  final String image;
  final double discount;
  // final bool isProductPage;
  // final Function onLike;

  FoodItem({
    @required this.idItem,
    @required this.name,
              this.isMenu,
    @required this.price,
    @required this.menuPrice,
    @required this.image,
              this.discount,
    // @required this.isProductPage,
    // this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      // color: Colors.red,
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: <Widget>[
          InkWell( //image

            onTap: () => selectFood(context),

            child: Container(
            width: 205,
            height: 185,
            
              child: Card(
                  color: white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: name,
                    child: Container(
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                      )
                    )
                  )
              )
            ),
          ),

          Positioned(
            bottom: 64,
            right: 8,
            child: (isMenu != null) ? Snac(name) : SizedBox(width: 0,)
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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name, style: foodNameText),
                      Text('${price.toInt()} F', style: priceText),
                    ],
            )
          ),
          Positioned( 
              top: 10,
              left: 10,
              child: (discount != null)
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('-' + discount.toString() + '%',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )
                  : SizedBox(width: 0))
        ],
      ),
    );
  } //build


  void selectFood(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductPage.routeName,
      arguments: {
        'idItem': idItem,
        // 'name': name,
        // 'isMenu': isMenu,
        // 'price': price,
        // 'image': image,
        // 'discount': discount
      }
    );
  }
  

}

