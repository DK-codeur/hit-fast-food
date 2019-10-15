import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';
import '../screens/category_store_screen.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';
// import '../datas.dart';

class HeaderCategoriesTop extends StatefulWidget {
  
  @override
  _HeaderCategoriesTopState createState() => _HeaderCategoriesTopState();
}

class _HeaderCategoriesTopState extends State<HeaderCategoriesTop> {

  Widget build(BuildContext context) {

  final categoryData = Provider.of<CategoriesProvider>(context);
  final categories = categoryData.categorie; //recup categorie de CategoriesProvider = all cat

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 14.0),
        child: Container(
          // padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(30),
            //   topRight: Radius.circular(30)
            // )

          ),
          width: double.infinity,
          child: Text(
            'Nos spécialités',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'CenturyGothic'
            ),
          ),
        ),
      ),
    
      SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,

          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: categories[index],
            child: HeaderCategoryItem(
              //all prop id, title...
            ),
          )
          ,
        ),
      ),

      Container(child: Divider())
    ],
  );

  } }


// class header category item
class HeaderCategoryItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final category = Provider.of<Category>(context, listen: false);

    return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 65,
            height: 65,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: category.name,

              onPressed: () {
                Navigator.of(context).pushNamed(
                CategoryStoreScreen.routeName,
                arguments: category.id
              );
              },
              backgroundColor: white,
              child: Image.asset(
                'images/${category.image}',
                fit: BoxFit.fill,
                width: 60.0,
                height: 60.0,
              ),
            )),
        Text(category.name + ' ›', style: categoryText)
      ],
    ),
  );
  }



}