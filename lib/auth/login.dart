import 'package:flutter/material.dart';
import 'package:polres_app/auth/register.dart';
import 'package:polres_app/auth/reset_password.dart';
import 'package:polres_app/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool remember = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0
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
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
                activeColor: Colors.red[700],
                activeTrackColor: Colors.red[500],
              ),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ResetPasswordPage();
                    }));
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  )
              )
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              icon: Icon(Icons.arrow_right_alt_rounded),
              label: Text('Masuk'),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }));
                  },
                  child: Text(
                    'Belum punya akun? Daftar.',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

