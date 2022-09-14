import 'package:flutter/material.dart';
import 'package:polres_app/auth/login.dart';

class SelectRolePage extends StatelessWidget {
  const SelectRolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // alignment: Alignment.center,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pilih Pengguna',
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xff747688)
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 275,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Text(
                    'Kepolisian',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffCC2930),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 275,
                height: 50,
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Sekolah',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xffCC2930),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 275,
                height: 50,
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Mitra',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xffCC2930),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
