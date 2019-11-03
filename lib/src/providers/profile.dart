import 'package:flutter/material.dart';


class Profile with ChangeNotifier {
  final String id;
  final String idU;
  final String name;
  final String email;
  final String phone;
  final int money;

  Profile({
    @required this.id,
    @required this.idU,
    @required this.name,
    @required this.email,
    @required this.phone,
    this.money
  });

}