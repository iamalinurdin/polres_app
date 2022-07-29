import 'package:flutter/material.dart';
import 'package:polres_app/services/activity.dart';
import 'package:polres_app/pages/create.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  List<Activity> activities = [
    Activity(user: 'John Doe', time: '17:00', activity: 'Input data target baru'),
    Activity(user: 'Jane Doe', time: '17:00', activity: 'Input data target baru'),
    Activity(user: 'Mr. X', time: '17:00', activity: 'Input data target baru'),
    Activity(user: 'Mrs. X', time: '17:00', activity: 'Input data target baru'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                        style: TextStyle(
                            color: Colors.red[900]
                        ),
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
                        Icons.person,
                        size: 50,
                        color: Colors.red[900],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pencarian DPO',
                        style: TextStyle(
                          color: Colors.red[900]
                        ),
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
                          style: TextStyle(
                            color: Colors.red[900]
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
          Column(
            children: activities.map((activity) => activityCard(activity)).toList()
          )
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
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                  ),
                ),
                Text(
                  '${activity.time}',
                  style: TextStyle(
                    color: Colors.white
                  ),
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
                fontSize: 17
              ),
            )
          ],
        )
      ),
      color: Colors.red[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
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
        )
      ),
    );
  }
}

