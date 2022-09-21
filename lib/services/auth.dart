import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  var _token = null;

  get token => _token;

  set setToken (token) {
    _token = token;
    notifyListeners();
  }

  login (email, password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode({
        'username': email,
        'password': password
      })
    );

    return json.decode(response.body);

    // if (response.body.status == 'success') {
    //   this.token = response.body.token;
    // }

    // print(output);

    // print(jsonEncode({
    //   'username': email,
    //   'password': password
    // }));
  }
}