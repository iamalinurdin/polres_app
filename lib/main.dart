import 'package:flutter/material.dart';
import 'auth/register.dart';
import 'package:polres_app/auth/login.dart';
import 'package:polres_app/pages/welcome.dart';

void main() {
  runApp(MaterialApp(
    home: WelcomePage()
  ));
}

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//
//   bool remember = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: Text('Polres App'),
//         // ),
//         body: Builder(
//           builder: (context) => Container(
//             padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Login',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30.0
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.mail),
//                       hintText: 'NRP',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.lock),
//                       hintText: 'Password',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 5.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Switch(
//                       value: remember,
//                       onChanged: (value) {
//                         setState(() {
//                           remember = value;
//                         });
//                       },
//                       activeColor: Colors.red[700],
//                       activeTrackColor: Colors.red[500],
//                     ),
//                     TextButton(
//                         onPressed: (){
//
//                         },
//                         child: Text(
//                           'Forgot password?',
//                           style: TextStyle(
//                               color: Colors.black
//                           ),
//                         )
//                     )
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     print('ok');
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(15.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Masuk',
//                           style: TextStyle(
//                               fontSize: 18.0
//                           ),
//                         ),
//                         Icon(
//                           Icons.arrow_right_alt_rounded,
//                         )
//                       ],
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.red[900],
//                       alignment: Alignment.center,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 // Center(
//                 //   child: Text('OR'),
//                 // ),
//                 // SizedBox(height: 20.0),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //
//                 //   },
//                 //   child: Padding(
//                 //     padding: EdgeInsets.all(15.0),
//                 //     child: Row(
//                 //       children: [
//                 //         Text(
//                 //           'Login with Google',
//                 //           style: TextStyle(
//                 //             fontSize: 15.0,
//                 //             color: Colors.black
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     )
//                 //   ),
//                 //   style: ElevatedButton.styleFrom(
//                 //     primary: Colors.white,
//                 //     shape: RoundedRectangleBorder(
//                 //         borderRadius: BorderRadius.circular(10.0)
//                 //     )
//                 //   ),
//                 // ),
//                 SizedBox(height: 20.0),
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) {
//                             return RegisterPage();
//                           }));
//                         },
//                         child: Text(
//                           'Belum punya akun? Daftar.',
//                           style: TextStyle(
//                               color: Colors.black
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ),
//     );
//   }
// }
