import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:polres_app/services/activity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TskTawuranPage extends StatelessWidget {
  const TskTawuranPage({Key? key}) : super(key: key);

  Future retrieve() async {
    final baseUrl = 'http://156.67.220.96:3000';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('TOKEN');
    final url = Uri.parse('$baseUrl/suspect/list');
    final response = await http.get(url, headers: {
      'accept':'application/json',
      'Authorization': 'Bearer $token'
    });
    final res = jsonDecode(response.body);

    print('rendred');

    List<Activity> activities = [];

    for (var u in res['data']) {
      // print(u['report_number']);
      Activity suspect = Activity(activity: u['report_number'], time: u['createdAt'], user: u['full_name']);
      activities.add(suspect);
    }

    return activities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Tawuran',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.red[900],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder (
                future: retrieve(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data[index].activity,
                                          style: TextStyle(fontSize: 17, color: Colors.white),
                                        ),
                                        Text(
                                          snapshot.data[index].time,
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Nama TSK',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].user,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 17),
                                    )
                                  ],
                                )),
                            color: Colors.red[900],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          );
                        }
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
          )
        ],
      )
    );
  }
}

Card activityCard(Activity activity) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${activity.activity}',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                Text(
                  '${activity.time}',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Nama TSK',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '${activity.user}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 17),
            )
          ],
        )),
    color: Colors.red[900],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}