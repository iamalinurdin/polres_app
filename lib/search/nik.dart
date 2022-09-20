import 'package:flutter/material.dart';
import 'package:polres_app/pages/evidence.dart';

class NikPage extends StatefulWidget {
  const NikPage({Key? key}) : super(key: key);

  @override
  State<NikPage> createState() => _NikPageState();
}

class _NikPageState extends State<NikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pencarian dengan NIK',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                hintText: 'NRP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EvidencePage();
                  }));
                },
                child: Text(
                  'Cari',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
