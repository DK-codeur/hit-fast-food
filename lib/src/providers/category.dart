import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category with ChangeNotifier {
  String id;
  String name;
  String image;
  // Function onPress;

  Category({
    @required this.name,
    @required this.image,
    // @required this.onPress,
    @required this.id,
  });

}