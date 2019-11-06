import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import '../../models/http_exception.dart';


class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

 Map<String, dynamic> userInfo = {
   'username': '',
   'email': '',
   'phone': ''
 };

  bool get isAuth{
    return _token != null;
  }

  // String get token { //_expiryDate.isAfter(DateTime.now())
  //   if (_expiryDate != null && _token != null) {
  //     return _token;
  //   }
  //   return null;
  // }

   String get token {
    if (_expiryDate != null && _expiryDate.isAfter(DateTime.now()) && _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }


  Future<void> _authenticate(String email, String password, String urlSegment,) async {
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCGvrgs97AVIXk4hTYCClN2lC_kEExT0Qw'; 

    try{ 
      final response = await http.post(
        url,
        body: json.encode({
          'email' : email,
          'password': password,
          'returnSecureToken': true,
        })
      );

      final responseData = json.decode(response.body);
      // print(responseData);
      if(responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate =DateTime.now().add(Duration(days: 365),); //; seconds: int.parse(responseData['expiresIn'],),

      _autoLogOut();
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'expiryDate': _expiryDate.toIso8601String()
      });
      prefs.setString('userData', userData);

    } catch (error) {
      throw error;
    }

  }

  //signUp
  Future<void> signUp(String email, String password,    String id, String emailU, String username, String phone) async {
     await _authenticate(email, password, 'signUp');

     final urlU = 'https://hit78f-food3b.firebaseio.com/users.json?auth=$token';

     if(userId != null) {
        await http.post(
        urlU,
        body: json.encode({
          'id': userId,
          'email': email, //emailU
          'username': username,
          'phone': phone,
        })
      );

      // print(response.body);
    } 

  } 


  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  


  Future<void> fetchUserData() async {
    final byUserString  = 'orderBy="id"&equalTo="$userId"' ;
    final urlU = 'https://hit78f-food3b.firebaseio.com/users.json?auth=$token&$byUserString';

    try{
      final response = await http.get(urlU);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);

      if(extractedData == null) {
        return;
      }
  

    final Map<String, dynamic> user = {};
    extractedData.forEach((userExtId, userdata) {
      user.addAll(userdata);
    });

    if(user['id'] != null) {
      userInfo['username'] = user['username'];
      userInfo['email'] = user['email'];
      userInfo['phone'] = user['phone'];

    notifyListeners();
    }

    // print(user['id']);
    

   } catch (error) {
     throw error;
   }
    
  }


  
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('userData')) {
      return false;
    }

    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']); //ed

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate; //ed
    notifyListeners();
    _autoLogOut();
    return true;
  } 

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;

    if(_authTimer != null) {
      _authTimer.cancel();
      _authTimer  = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userId');
    prefs.clear();
  }

  void _autoLogOut() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }

    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

}
