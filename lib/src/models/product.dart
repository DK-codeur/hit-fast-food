import 'package:flutter/material.dart';

class Product {
  int idPdt;
  String name;
  double price;
  double menuPrice;
  String image;
  String isMenu;
  double discount;
  int cat;
  // bool userLiked;

  Product({
    @required this.idPdt,
    @required this.name,
    @required this.price,
    @required this.menuPrice,
    this.discount,
    @required this.image,
    @required this.isMenu,
    @required this.cat,
  });

}