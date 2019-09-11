import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/widgets/deals.dart';
import '../widgets/headerTopCategories.dart';


class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderCategoriesTop(),

          Deals('Burgers', () {}, 2),
          Deals('Chicken', () {}, 1),
          Deals('Tacos (Poulet ou Viande)', () {}, 3),

        ],
      ),
    );

  }
}
