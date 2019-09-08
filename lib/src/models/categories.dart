import 'package:flutter/material.dart';

class Categories {
  int id;
  String name;
  String image;
  Function onPress;

  Categories({
    @required this.name,
    @required this.image,
    @required this.onPress,
    @required this.id,
  });

}