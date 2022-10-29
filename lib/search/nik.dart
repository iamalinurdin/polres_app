import 'package:flutter/material.dart';
import 'package:polres_app/pages/evidence.dart';
import 'package:polres_app/services/suspect.dart';

class NikPage extends StatefulWidget {
  const NikPage({Key? key}) : super(key: key);

  @override
  State<NikPage> createState() => _NikPageState();
}

class _NikPageState extends State<NikPage> {
  final TextEditingController idNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pencarian dengan NIK',
            style: TextStyle(color: Colors.black),
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
                    hintText: 'NIK',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: idNumber,
              ),
              SizedBox(height: 20),
              Container(
                width: 100,
                height: 40,
                child: TextButton(
                  onPressed: () async {
                    final response = await Suspect().searchById(idNumber.text);

                    if (response['success']) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EvidencePage(result: response['data']);
                      }));
                    }
                  },
                  child: Text(
                    'Cari',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        ));
  }
}
