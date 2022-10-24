import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Suspect {
  final baseUrl = 'http://156.67.220.96:3000';
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmlrIjoiMTIzNDU2Nzg5MCIsImlhdCI6MTY2NjU2ODg2NywiZXhwIjoxNjY2NTcyNDY3fQ.qV--1h_9TDwfS14N3OnmKFziKNpGyA3n9iy7U8mG5fo';

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
}
