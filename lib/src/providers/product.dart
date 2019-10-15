import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class Product with ChangeNotifier {
  String idPdt;
  String title;
  int price;
  int menuPrice;
  String image;
  String isMenu;
  int discount;
  int cat;
  //int gout
  //int parfum
  // bool userLiked;

  Product({
    @required this.idPdt,
    @required this.title,
    @required this.price,
    @required this.menuPrice,
    @required this.image,
    @required this.isMenu,
    this.discount,
    @required this.cat,
  });

}