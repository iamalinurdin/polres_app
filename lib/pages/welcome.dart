import 'package:flutter/material.dart';
import 'package:polres_app/pages/select_role.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/logo-polda.png', width: 150, height: 150,),
            SizedBox(height: 50),
            Text(
              'Halo, Selamat datang di Aplikasi Santun Anti Tawuran',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.white
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // alignment: Alignment.,
                width: 300,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return SelectRolePage();
                    }));
                  },
                  child: Text('Get Started'),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
            ),

          ],
        )
      ),
    );
  }
}
