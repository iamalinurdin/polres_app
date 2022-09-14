import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  bool showPasswordConf = false;

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
              child: ListView(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
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
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.verified_user),
                        hintText: 'Nama',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: 'NRP',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // DropdownButton(
                  //
                  //   items: items.map((item) {
                  //     return DropdownMenuItem(
                  //       value: item,
                  //       child: Text(item),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? selected) {
                  //     setState(() {
                  //       selected = selected!;
                  //     });
                  //   }
                  // ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.map),
                        hintText: 'Pilih Polres',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.smartphone),
                        hintText: 'No. Telepon',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        )
                    ),
                    obscureText: showPassword,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Ulangi Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(showPasswordConf ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              showPasswordConf = !showPasswordConf;
                            });
                          },
                        )
                    ),
                    obscureText: showPasswordConf,
                  ),
                  SizedBox(height: 20.0),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () {

                      },
                      icon: Icon(Icons.arrow_right_alt_rounded),
                      label: Text('Daftar'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red[900],
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          minimumSize: Size.fromHeight(50)
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
