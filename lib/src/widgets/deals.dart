import 'package:flutter/material.dart';
import '../datas.dart';
import '../widgets/fooditem.dart';
import '../shared/styles.dart';
// import '../models/product.dart';

class Deals extends StatefulWidget {

  final String dealTitle;
  final Function onViewMore;
  final int idCat;

  Deals(this.dealTitle, this.onViewMore, this.idCat);

  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {

  // String dealTitle;
  // List<Product> items;

  @override
  Widget build(BuildContext context) {

    var reqProd = foods.where( (prd) => prd.cat == widget.idCat).toList();

    return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(widget.dealTitle, onViewMore: widget.onViewMore),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: reqProd.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return FoodItem(
                idItem: reqProd[index].idPdt,
                name: reqProd[index].name,
                isMenu: reqProd[index].isMenu,
                price: reqProd[index].price,
                image: reqProd[index].image,
                discount: reqProd[index].discount,
                menuPrice: reqProd[index].menuPrice,

              );
            },
            // children: (widget.items != null)
                // <Widget>[
                //     Container(
                //       margin: EdgeInsets.only(left: 15),
                //       child: Text(
                //         'Pas disponible pour l\'instant',
                //         style: taglineText
                //       ),
                //     )
                //   ],
          ),
        ),

        Container(margin: EdgeInsets.only(bottom: 20),)

      ],
    ),
  );
}
//funct widget
  Widget sectionHeader(String headerTitle, {onViewMore}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: Text(headerTitle, style: h4),
        ),
        // Container(
        //   margin: EdgeInsets.only(left: 15, top: 2),
        //   child: FlatButton(
        //     onPressed: onViewMore,
        //     child: Text('View all ›', style: contrastText),
        //   ),
        // )
      ],
    );
  }
}