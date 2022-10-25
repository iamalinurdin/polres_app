import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:polres_app/model/suspect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Suspect {
  final baseUrl = 'http://156.67.220.96:3000';
  final _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmlrIjoiMTIzNDU2Nzg5MCIsImlhdCI6MTY2NjYzMTY1MywiZXhwIjoxNjY2NjM1MjUzfQ.XPdd9ipyZ5z6uDzc74UBzRvF04AYkkHf-dDNy5hjCbg';

  Future store(Object payload) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('TOKEN');

    final response = await http.post(Uri.parse('$baseUrl/suspect/add'),
        headers: {
          //   'Content-Type': 'application/json; charset=UTF-8',
          //   'Accept': 'application/json'
          'Authorization': 'Bearer $token'
        },
        body: payload);

    // print(payload);

    return jsonDecode(response.body);
  }

  Future retrieve() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('TOKEN');

    final response =
        await http.get(Uri.parse('$baseUrl/suspect/list'), headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'Accept': 'application/json'
      'Authorization': 'Bearer $token'
    });

    print('object');

    return jsonDecode(response.body);
    // print(response.body);
  }

  Future searchById(String id) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('TOKEN');
    final response = await http.get(Uri.parse('$baseUrl/search/id_card/$id'),
        headers: {'Authorization': 'Bearer $token'});

    return jsonDecode(response.body);

    // Iterable iterable = jsonDecode(response.body);
    // List<SuspectModel> suspect =
    //     iterable.map((e) => SuspectModel.fromJson(e)).toList();

    // return suspect;
  }

  Future searchByName(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('TOKEN');

    final response = await http.get(
        Uri.parse('$baseUrl/search/name?full_name=$id'),
        headers: {'Authorization': 'Bearer $token'});

    return jsonDecode(response.body);
  }

  Future searchByNumber(String id) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('TOKEN');

    final response = await http.get(
        Uri.parse('$baseUrl/search/report_number?report_number=$id'),
        headers: {'Authorization': 'Bearer $token'});

    return jsonDecode(response.body);
  }
}
