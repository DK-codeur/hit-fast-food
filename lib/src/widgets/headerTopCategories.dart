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
                fit: BoxFit.fill,
                width: 70.0,
                height: 70.0,
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
        padding: EdgeInsets.only(bottom: 14.0),
        child: Container(
          padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
          color: Colors.white,
          width: double.infinity,
          child: Text(
            'Nos specialites',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'CenturyGothic'
            ),
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
