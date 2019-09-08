import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/datas.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/buttons.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/productPage';
  final String pageTitle;
 
  ProductPage({Key key, this.pageTitle,}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // double _rating = 4;
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {

    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, int>;
    final foodId = routeArg['idItem'];
    final reqPdt = foods.firstWhere( (food) => food.idPdt == foodId);

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 3,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text(reqPdt.name, style: h4),
        ),
        
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                      margin: EdgeInsets.only(top: 100, bottom: 100),
                      padding: EdgeInsets.only(top: 100, bottom: 50),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(reqPdt.name, style: h5),
                          
                          SizedBox(height: 20,),

                          (reqPdt.menuPrice != null) 
                          ? //if reqPdt.menuPrice != null

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Classic', style: h6,),
                                  Text('${reqPdt.price.toInt()} F', style: h3a,) //style: h3
                                ],
                              ),

                              Column(
                                children: <Widget>[
                                  Text('Menu', style: h6),
                                  Text('30000 F', style: h3a),
                                ],
                              ),
                            ],
                          )

                          : //else
                          Text('${reqPdt.price.toInt()} F', style: h3a,),

                          Container(child: Divider(),),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 20),
                            // child: SmoothStarRating(
                            //   allowHalfRating: false,
                            //   onRatingChanged: (v) {
                            //     setState(() {
                            //       _rating = v;
                            //     });
                            //   },
                            //   starCount: 5,
                            //   rating: _rating,
                            //   size: 27.0,
                            //   color: Colors.orange,
                            //   borderColor: Colors.orange,
                            // ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Quantite', style: h6),
                                  margin: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantity += 1;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(left: 20, right: 20),
                                      child: Text(_quantity.toString(), style: h3), //print qte val
                                    ),

                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                           if(_quantity == 1) return; //no decre if qte ==1
                                             _quantity -= 1; 
                                          });
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          Container(
                            width: 180,
                            child: froyoOutlineBtn('Acheter', () {}),
                          ),

                          Container(
                            width: 180,
                            child: froyoFlatBtn('Ajouter au panier', () {}),
                          )
                        ],
                      ),

                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 5,
                                color: Color.fromRGBO(0, 0, 0, .05))
                          ]),
                    ),
                    ),
                    
                    //image
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 12.0,
                        child: SizedBox(
                          width: 200,
                          height: 160,
                          child: Image.asset(
                            reqPdt.image,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
