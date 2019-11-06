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
  // final String authToken;

  // Orders(this.authToken);

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

  }

}