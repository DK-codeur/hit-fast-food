import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';
import '../datas.dart';

class HeaderCategoriesTop extends StatelessWidget {

  //funct headerCategoryItem
  Widget headerCategoryItem(String name, String image, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Image.asset(
                'images/$image',
                fit: BoxFit.contain,
                width: 50.0,
                height: 50.0,
              ),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
   
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Text(
        'Toutes les Categories',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins'
        ),
      ),
    ),
    
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: categorie.map(
            (getData) => headerCategoryItem(
              getData.name, getData.image
            )
          ).toList()
          ,
        ),
      ),

      Container(child: Divider())
    ],
  );

  } //build
}
