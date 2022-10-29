import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polres_app/search/name.dart';
import 'package:polres_app/search/nik.dart';
import 'package:polres_app/search/number.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  File? image;

  Future pickImage () async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final tempImage = File(image.path);

      setState(() {
        this.image = tempImage;
      });
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NamePage();
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
                    'Pencarian dengan Foto',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () => pickImage(),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NumberPage();
                    }));
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}
