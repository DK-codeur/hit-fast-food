import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:provider/provider.dart';
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

    // var reqProd = foods.where( (prd) => prd.cat == widget.idCat).toList();

    final productData = Provider.of<ProductsProvider>(context);
    final dealFood = productData.foodsByCat(widget.idCat);

    return Container(
    margin: EdgeInsets.only(top: 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(widget.dealTitle, onViewMore: widget.onViewMore),
        SizedBox(
          height: 250,
          child: (dealFood.length != 0) 
          ? ListView.builder(
            itemCount: dealFood.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value (
              value: dealFood[index],
              child: FoodItem(
                //...id, title 
              )
            ),
          )
          : Center(child: Text('chargement...')),
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
          margin: EdgeInsets.only(left: 30,),
          child: Text(headerTitle, style: h4a),
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