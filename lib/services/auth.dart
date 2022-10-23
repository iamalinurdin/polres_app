import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  var _token = null;
  String baseUrl = 'http://156.67.220.96:3000';

  get token => _token;

  set setToken(token) {
    _token = token;
    notifyListeners();
  }

  login(email, password) async {
    final response = await http.post(Uri.parse('$baseUrl/account/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode({'nik': email, 'password': password}));

    // return json.decode(response.body);

    return jsonDecode(response.body);

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
