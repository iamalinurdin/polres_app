import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    return jsonDecode(response.body);
  }

  Future changePassword (oldPassword, newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('TOKEN');

    final response = await http.post(Uri.parse('$baseUrl/account/update-password'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({'old_password': oldPassword, 'new_password': newPassword}));

    return jsonDecode(response.body);
  }

  Future changePhoto (payload) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('TOKEN');

    final url = Uri.parse('$baseUrl/account/update-photo');
    final request = new http.MultipartRequest('POST', url);

    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
      "Keep-Alive": "timeout=5, max=1000"
    });

    final photo = await http.MultipartFile.fromPath('photo', payload['photo'].path);

    request.files.add(photo);

    final response = await request.send();
    final responsed = await http.Response.fromStream(response);

    return jsonDecode(responsed.body);
  }
}
