import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Suspect {
  final baseUrl = 'http://156.67.220.96:3000';
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmlrIjoiMTIzNDU2Nzg5MCIsImlhdCI6MTY2NjYzMDEzNiwiZXhwIjoxNjY2NjMzNzM2fQ.iSGmvpBsnZ2RJQbiQVuZPFq_fuz7fFH5xuHGaNfEFOY';

  Future store(Object payload) async {
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
    final response =
        await http.post(Uri.parse('$baseUrl/suspect/list'), headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'Accept': 'application/json'
      'Authorization': 'Bearer $token'
    });

    print(response);
  }

  Future searchById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/search/id_card/$id'),
        headers: {'Authorization': 'Bearer $token'});

    return jsonDecode(response.body);
  }

  Future searchByName(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/search/name?full_name=$id'),
        headers: {'Authorization': 'Bearer $token'});

    return jsonDecode(response.body);
  }

  Future searchByNumber(String id) async {
    final response = await http.get(
        Uri.parse('$baseUrl/search/report_number?report_number=$id'),
        headers: {'Authorization': 'Bearer $token'});

    return jsonDecode(response.body);
  }
}
