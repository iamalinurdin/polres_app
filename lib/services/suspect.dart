import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:polres_app/model/suspect.dart';
import 'package:polres_app/services/activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Suspect {
  final baseUrl = 'http://156.67.220.96:3000';
  final _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmlrIjoiMTIzNDU2Nzg5MCIsImlhdCI6MTY2NjYzMTY1MywiZXhwIjoxNjY2NjM1MjUzfQ.XPdd9ipyZ5z6uDzc74UBzRvF04AYkkHf-dDNy5hjCbg';

  Future store(payload) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('TOKEN');

    // final response = await http.post(Uri.parse('$baseUrl/suspect/add'),
    //     headers: {
    //       'Authorization': 'Bearer $token'
    //     },
    //     body: payload);
    final url = Uri.parse('$baseUrl/suspect/add');
    final request = new http.MultipartRequest('POST', url);
    
    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
      "Keep-Alive": "timeout=5, max=1000"
    });

    final photo = await http.MultipartFile.fromPath(
        'photo',
        payload['photo'].path
        // payload['photo'],
        // payload['photo'],
        // File(payload['photo'].path).readAsBytes().asStream(),
        // File(payload['photo'].path).lengthSync()
    );
    
    // final newPayload = jsonEncode(payload);
    request.fields['report_number'] = payload['report_number'];
    request.fields['full_name'] = payload['full_name'];
    request.fields['nik'] = payload['nik'];
    request.fields['parent_name'] = payload['parent_name'];
    request.fields['address'] = payload['address'];
    request.fields['description'] = payload['description'];
    request.fields['incident_date'] = payload['incident_date'];
    request.files.add(photo);

    // print(File(payload['photo'].path).readAsBytes().asStream());

    final response = await request.send();
    final responsed = await http.Response.fromStream(response);
    // print(responsed.body);

    return jsonDecode(responsed.body);
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

    List responseJson = jsonDecode(response.body)['data']
        .map((data) => new SuspectModel(
            name: data['full_name'],
            time: data['createdAt'],
            number: data['report_number']))
        .toList();

    return responseJson;
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
