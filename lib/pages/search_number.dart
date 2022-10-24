import 'package:flutter/material.dart';
import 'package:polres_app/search/nik.dart';

class SearchNumberPage extends StatefulWidget {
  const SearchNumberPage({Key? key}) : super(key: key);

  @override
  State<SearchNumberPage> createState() => _SearchNumberPageState();
}

class _SearchNumberPageState extends State<SearchNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pencarian',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 60,
                child: TextButton(
                  child: Text(
                    'Pencarian dengan NIK',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NikPage();
                    }));
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 60,
                child: TextButton(
                  child: Text(
                    'Pencarian dengan Nama',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    print('pencarian nama');
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 60,
                child: TextButton(
                  child: Text(
                    'Pencarian dengan Foto',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    print('pencarian foto');
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 60,
                child: TextButton(
                  child: Text(
                    'Pencarian dengan Nomor LP',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    print('pencarian nomor lp');
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}
