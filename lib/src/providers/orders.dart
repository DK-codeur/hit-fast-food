import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import './cart_provider.dart';

//order
class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id, 
    @required this.amount, 
    @required this.products, 
    @required this.dateTime
  });
}


class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  final String userId;

  Orders({this.authToken, this.userId});

  List<OrderItem> get orders {
    return [..._orders];
  }


  // void addOrder(List<CartItem> cartProducts, double total) {
  //   _orders.insert(
  //     0,
  //     OrderItem(
  //       id: DateTime.now().toString(),
  //       amount: total,
  //       dateTime: DateTime.now(),
  //       products: cartProducts,
  //     ),
  //   );
  //   notifyListeners();
  // }

  // Future<void> fetchAndSetOrders() async {
  //   const url = '';
  //   final response = await http.get(url);
  //   final List<OrderItem> loadedOrders = [];
  //   final extractedData = json.decode(response.body) as Map<String, dynamic>;

  //   if(extractedData == null) {
  //     return;
  //   }

  //   extractedData.forEach((orderId, orderData) {
  //     loadedOrders.add(
  //       OrderItem(
  //         id: orderId,
  //         amount: orderData['amount'],
  //         dateTime: DateTime.parse(orderData['dateTime']),
  //         products: (orderData['products'] as List<dynamic>).map((item) => CartItem(
  //           id: item['id'],
  //           price: item['price'],
  //           quantity: item['quantity'],
  //           title: item['title'],
  //           image: item['image']
  //         )).toList()
  //       )
  //     );
  //   });

  //   _orders = loadedOrders.reversed.toList();
  //   notifyListeners();

  // }

  Future<void> addOrder(List<CartItem> cartProducts, double total, String idU, String name, String adress, String phone) async {
    final url = 'https://hit78f-food3b.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        'userId': idU,
        'name': name,
        'adress': adress,
        'phone': phone,
        'products': cartProducts.map((cp) => {
          'id': cp.id,
          'title': cp.title,
          'quantity': cp.quantity,
          'price': cp.price,
          'image': cp.image,
          'isMenu': cp.isMenu,

        }).toList()
      })
    );

    // _orders.insert(
    //   0, 
    //   OrderItem(
    //     id: json.decode(response.body)['name'],
    //     amount: total,      
    //     dateTime: timeStamp,
    //     products: cartProducts,
    //   )
    // );

    // notifyListeners();
  }

}