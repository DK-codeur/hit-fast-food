import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';
import './category.dart';


//Category Provider

 class ProductsProvider with ChangeNotifier {
    List<Product> _foods = [

    //burger
  ];


  List<Product> get foods {
    return [..._foods];
  }


  Future<void> fetchAndSetProduct() async { 
    const url = 'https://hit78f-food3b.firebaseio.com/products.json';
    
    try{
      final response = await  http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);

      if(extractedData == null) {
        return;
      }

      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(

          idPdt: prodId,
          title: prodData['title'],
          price: 1000,
          menuPrice: prodData['menuPrice'],
          image: prodData['image'],
          isMenu: prodData['isMenu'],
          discount: prodData['discount'],
          cat: prodData['cat'],

        ));
      }); 

      _foods = loadedProducts;
      notifyListeners();

    }catch (error) {
      throw (error);
    }

  }


  List<Product> foodsByCat(int cat) {
    return _foods.where((fd) => fd.cat == cat).toList();
  }

  Product findById(String id) {
    return _foods.firstWhere( (prod) => prod.idPdt == id);
  }

  void addProduct() {
    // _food.add(value);
    notifyListeners();
  }

}


//Category Provider


 class CategoriesProvider with ChangeNotifier {

  List<Category> _categorie = [

  Category(
    id: '2',
    name: 'Burger',
    image: 'burgerCat.png',
    // onPress: null, 
  ),

  Category(
    id: '1',
    name: 'Chicken',
    image: 'chickenCat.png',
    // onPress: null,
  ),

  Category(
    id: '3',
    name: 'Tacos',
    image: 'tacosCat.png',
    // onPress: null,
  ),

  // Category(
  //   id: 4,
  //   name: 'Sandwich',
  //   image: 'sandwichCat.png',
  //  onPress: null,
  // ),

  Category(
    id: '6',
    name: 'Grillarde & platter',
    image: 'grillCat.png',
    // onPress: null, 'grillCat.png'
  ),

  Category(
    id: '4',
    name: 'Salades',
    image: 'saladCat.png',
    // onPress: null,
  ),

  // Category(
  //   id: 7,
  //   name: 'Gourmandises',
  //   image: 'gourmanCat.png',
  //   // onPress: null,
  // ),

  // Category(
  //   id: 8,
  //   name: 'Boissons',
  //   image: 'boissonCat.png',
  //   // onPress: null,
  // ),

  Category(
    id: '5',
    name: 'Sandwich & Hot Dog',
    image: 'hotdogCat.png',
    // onPress: null,
  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

  // Category(
  //   id: 10,
  //   name: 'Extra', 
  //   image: 'extraCat.png',
  //   // onPress: null,
  // ),
];


 List<Category> get categorie {
    
  return [..._categorie];
 }

  
  Future<void> fetchAndSetCategory() async {
    const url = '';

    try{
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;
      print(extractedData.toString());

      if (extractedData == null) {
        return;
      }

      final List<Category> loadedCategory = [];
      extractedData.forEach((catId, catData) {
        loadedCategory.add(Category(

          id: catId,
          name: catData['name'],
          image: catData['image']

        ));
      });

      _categorie = loadedCategory;
      notifyListeners();


    } catch (error) {
      throw (error);
    }

  } 


  Category findById(String id) {
    return _categorie.firstWhere( (categ) => categ.id == id);
  }

  




}
