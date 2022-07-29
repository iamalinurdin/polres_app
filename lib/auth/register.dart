import 'package:flutter/material.dart';
import 'package:polres_app/auth/login.dart';
import 'package:polres_app/auth/verify_pin.dart';
import 'verify_pin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool showPassword = false;
  bool showPasswordConf = false;
  // Initial Selected Value
  String selected = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
        children: [
          Text(
            'Daftar',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0
            ),
          ),
          SizedBox(height: 20.0),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VerifyPinPage();
                }));
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

          SizedBox(height: 20.0),
          Center(
            child: Text('OR'),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Text(
                    'Sudah punya akun? Masuk.',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
