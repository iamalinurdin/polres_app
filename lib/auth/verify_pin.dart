import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyPinPage extends StatefulWidget {
  const VerifyPinPage({Key? key}) : super(key: key);

  @override
  State<VerifyPinPage> createState() => _VerifyPinPageState();
}

class _VerifyPinPageState extends State<VerifyPinPage> {
  @override

  int? pin;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: .5,
      ),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'We\'ve send you verification code on +621234567890',
                // style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 30.0
                // ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Pinput(),
              ),
              SizedBox(height: 20.0),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  onPressed: () {
                    print('ok');
                  },
                  icon: Icon(Icons.arrow_right_alt_rounded),
                  label: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15.0),
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
                child: Text('Resend code in 00:20'),
              )
            ],
          ),
        ),
      )
    );
  }
}
