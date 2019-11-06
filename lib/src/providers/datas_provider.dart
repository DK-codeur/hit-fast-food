import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';
import './category.dart';


//Category Provider

 class ProductsProvider with ChangeNotifier {
  List<Product> _foods = [];
  // final String authToken;

  // ProductsProvider(this.authToken, this._foods);

  List<Product> get foods {
    return [..._foods];
  }




  Future<void> fetchAndSetProduct() async { 
    final url = 'https://hit78f-food3b.firebaseio.com/products.json';
    
    try{
      final response = await  http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData);

      if(extractedData == null) {
        return;
      }

      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(

          idPdt: prodId,
          title: prodData['title'],
          price: prodData['price'],
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

  List<Product> foodsDiscount() {
    return _foods.where((fd) => fd.discount != 0).toList();
  }

  List<Product> foodsByFakeCatId(int fakeId) {
    return _foods.where((fd) => fd.cat == fakeId).toList();
  }

  Product findById(String id) {
    return _foods.firstWhere( (prod) => prod.idPdt == id);
  }

  // void addProduct() {
  //   // _food.add(value);
  //   notifyListeners();
  // }

}


//Category Provider


 class CategoriesProvider with ChangeNotifier {

  List<Category> _categorie = [];
  // final String authToken;

  // CategoriesProvider(this.authToken, this._categorie);

 List<Category> get categorie {
    
  return [..._categorie];
 }



  
  Future<void> fetchAndSetCategory() async {
    final url = 'https://hit78f-food3b.firebaseio.com/categories.json';

    try{
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData);

      if (extractedData == null) {
        return;
      }

      final List<Category> loadedCategory = [];
      extractedData.forEach((catId, catData) {
        loadedCategory.add(Category(

          id: catId,
          name: catData['name'],
          image: catData['image'],
          fakeId: catData['id']

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
