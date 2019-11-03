import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/providers/datas_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';
import '../screens/category_store_screen.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';
// import '../datas.dart';

class HeaderCategoriesTop extends StatefulWidget {
  // final String id;
  // final String fakeId;

  // HeaderCategoriesTop(this.id, this.fakeId);
  
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
          decoration: BoxDecoration(
            color: Colors.white,

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

              // onPressed: () {
              //   Navigator.of(context).pushNamed(
              //   CategoryStoreScreen.routeName,
              //   arguments: {
              //     'catId': category.id,
              //     'catFakeId': category.fakeId,
              //   }
              // );
              // },

              onPressed: () {
              Navigator.push(
                context, PageTransition(
                  type: PageTransitionType.rightToLeft, 
                  duration: Duration(seconds: 1),
                  child: CategoryStoreScreen(
                    id: category.id,
                    fakeId: category.fakeId,
                  )
                )
              );
            },

              backgroundColor: white,

              child: FadeInImage.assetNetwork(
                placeholder: 'images/load_img.png',
                image: category.image,
                fit: BoxFit.fill,
                width: 60.0,
                height: 60.0,
              ),
              // child: Image.asset(
              //   'images/${category.image}',
              //   fit: BoxFit.fill,
              //   width: 60.0,
              //   height: 60.0,
              // ),
            )),
        Text(category.name + ' ›', style: categoryText)
      ],
    ),
  );
  }



}