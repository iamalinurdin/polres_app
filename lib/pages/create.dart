import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polres_app/pages/home.dart';
import 'package:polres_app/services/suspect.dart';

class CreateTargetPage extends StatefulWidget {
  const CreateTargetPage({Key? key}) : super(key: key);

  @override
  State<CreateTargetPage> createState() => _CreateTargetPageState();
}

class _CreateTargetPageState extends State<CreateTargetPage> {
  File? image;
  TextEditingController report_number = TextEditingController();
  TextEditingController full_name = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController parent_name = TextEditingController();
  TextEditingController address = TextEditingController();
  // TextEditingController incident_date = TextEditingController();
  TextEditingController description = TextEditingController();
  DateTime? incident_date;

  Future pickImage () async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final tempImage = File(image.path);

      print(tempImage);

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
          'Penambahan Data',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        // bottom: PreferredSize(
        //   child: Align(
        //     alignment: Alignment.topLeft,
        //     child: Text('${DateTime.now()}'),
        //   ),
        //   preferredSize: Size.fromHeight(10),
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.red[900],
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.file_present),
              hintText: 'Nomor Laporan Polisi'
            ),
            controller: report_number,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Nama Tersangka'
            ),
            controller: full_name,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_card),
              hintText: 'NIK Tersangka'
            ),
            controller: nik,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.group),
                hintText: 'Nama Orangtua Tersangka'
            ),
            controller: parent_name,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.home),
                hintText: 'Alamat Tersangka'
            ),
            controller: address,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_month),
              hintText: 'Tanggal kejadian',
              suffixIcon: Icon(Icons.keyboard_arrow_down)
            ),
            // controller: incident_date,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now()
              ).then((date) {
                setState(() {
                  incident_date = date;
                });
              });

            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Uraian singkat kejadian'
            ),
            controller: description,
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (image == null) ElevatedButton(
                  onPressed: () => pickImage(),
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                ) else Image.file(
                  image!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'Klik gambar untuk upload foto tersangka',
                    style: TextStyle(
                      color: Colors.grey[400]
                    ),
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final response = await Suspect().store({
                'report_number': report_number.text,
                'full_name': full_name.text,
                'nik': nik.text,
                'parent_name': parent_name.text,
                'address': address.text,
                'incident_date': incident_date.toString(),
                'description': description.text,
                'photo': image,
              });

              print(response);

              if (response['success']) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              }

              // print(response);

              // print(report_number.text);
              // print(full_name.text);
              // print(nik.text);
              // print(parent_name.text);
              // print(address.text);
              // print(incident_date.toString());
              // print(description.text);
              // print(image!.path);
            },
            child: Text('Save'),
            style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                minimumSize: Size.fromHeight(50)
            ),
          )
        ],
      ),
    );
  }
}
