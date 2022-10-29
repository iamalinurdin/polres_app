import 'package:flutter/material.dart';
import 'package:polres_app/model/suspect.dart';
import 'package:polres_app/pages/maps.dart';
import 'package:polres_app/pages/search.dart';
import 'package:polres_app/pages/setting.dart';
import 'package:polres_app/services/activity.dart';
import 'package:polres_app/services/suspect.dart';
import 'package:polres_app/pages/create.dart';
import 'package:timelines/timelines.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // List<Activity> activities = [
  //   Activity(
  //       user: 'John Doe', time: '17:00', activity: 'Input data target baru'),
  //   Activity(
  //       user: 'Jane Doe', time: '17:00', activity: 'Input data target baru'),
  //   Activity(user: 'Mr. X', time: '17:00', activity: 'Input data target baru'),
  //   Activity(user: 'Mrs. X', time: '17:00', activity: 'Input data target baru'),
  // ];

  List<Activity> activities = [];


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

    // print(res['data']);

    // List<Activity> activities = [];

    for (var u in res['data']) {
      // print(u['report_number']);
      Activity suspect = Activity(activity: u['report_number'], time: u['createdAt'], user: u['full_name']);
      activities.add(suspect);
    }

    print(activities.length);

    return activities;

    // print('ok');

    // List responseJson = jsonDecode(response.body)['data']
    //     .map((data) => new SuspectModel(
    //         name: data['full_name'],
    //         time: data['createdAt'],
    //         number: data['report_number']))
    //     .toList();
    //
    // return responseJson;
    // return jsonDecode(response.body);
  }

  // void initState () async {
  //   super.initState();
  //   await retrieve();
  // }

  // Future.delayed(Duration.zero, () => {
  //
  // });

  Widget build(BuildContext context) {
    retrieve();

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingPage();
                }));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      // body: Timeline.tileBuilder(
      //   builder: TimelineTileBuilder.fromStyle(
      //     contentsAlign: ContentsAlign.alternating,
      //     contentsBuilder: (context, index) => Padding(
      //       padding: const EdgeInsets.all(24.0),
      //       child: Text('Timeline Event $index'),
      //     ),
      //     itemCount: 10,
      //   ),
      // ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CreateTargetPage();
                    }));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_add_alt_1,
                        size: 50,
                        color: Colors.red[900],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Penambahan Data',
                        style: TextStyle(color: Colors.red[900]),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchPage();
                    }));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.red[900],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pencarian DPO',
                        style: TextStyle(color: Colors.red[900]),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      print('penambahan data');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 50,
                          color: Colors.red[900],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Customize',
                          style: TextStyle(color: Colors.red[900]),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MapsPage();
                      }));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          size: 50,
                          color: Colors.red[900],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Peta',
                          style: TextStyle(color: Colors.red[900]),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
              ),
            ],
          ),
          // Container(
          //   child: Card(
          //     child: FutureBuilder(
          //       future: retrieve(),
          //       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //         // print(snapshot);
          //         if (snapshot.hasData) {
          //           if (snapshot.data != null) {
          //
          //           }
          //         } else {
          //           return new CircularProgressIndicator();
          //         }
          //       },
          //     ),
          //   )
          // )
          Column(
              children: activities
                  .map((activity) => activityCard(activity))
                  .toList()),
        ],
      ),
    );
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
                'Penyidik Resmob',
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

  Card suspectCard(SuspectModel suspectModel) {
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
                    '${suspectModel.name}',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    '${suspectModel.time}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Penyidik Resmob',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                '${suspectModel.number}',
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

  Expanded menuExpanded(IconData iconData, String label, Function redirect) {
    return Expanded(
      child: TextButton(
          onPressed: redirect(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 50,
                color: Colors.red[900],
              ),
              SizedBox(height: 10),
              Text(
                'Penambahan Data',
                style: TextStyle(
                  color: Colors.red[900],
                ),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
