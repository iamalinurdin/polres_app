import 'package:flutter/material.dart';
import 'package:polres_app/pages/edit_profile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        // padding: EdgeInsets.all(0),
        alignment: FractionalOffset.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: 0.85,
          widthFactor: 1,
          child: Container(
            // decoration: BoxDecoration(
              // color: Colors.red,
              // borderRadius: BorderRadius.circular(20.0),
            // ),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  transform: Matrix4.translationValues(0, -40, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    )
                  )
                ),
                FractionallySizedBox(
                  widthFactor: .9,
                  child: Container(
                    height: 75,
                    child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Notifikasi'),
                                Switch(
                                  value: true,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   remember = value;
                                    // });
                                  },
                                  activeColor: Colors.red[700],
                                  activeTrackColor: Colors.red[500],
                                ),
                              ],
                            )
                        )
                    ),
                  )
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditProfilePage();
                    }));
                  },
                  child: FractionallySizedBox(
                    widthFactor: .9,
                    child: Container(
                        height: 75,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Edit Profil')
                              ],
                            )
                          )
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    print('ok');
                  },
                  child: FractionallySizedBox(
                    widthFactor: .9,
                    child: Container(
                        height: 75,
                        child: Card(
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Logout')
                                  ],
                                )
                            )
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
