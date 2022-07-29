import 'package:flutter/material.dart';

class CreateTargetPage extends StatefulWidget {
  const CreateTargetPage({Key? key}) : super(key: key);

  @override
  State<CreateTargetPage> createState() => _CreateTargetPageState();
}

class _CreateTargetPageState extends State<CreateTargetPage> {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.file_present),
              hintText: 'Nomor Laporan Polisi'
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Nama Tersangka'
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_card),
              hintText: 'NIK Tersangka'
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.group),
                hintText: 'Nama Orangtua Tersangka'
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.home),
                hintText: 'Alamat Tersangka'
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_month),
              hintText: 'Tanggal kejadian',
              suffixIcon: Icon(Icons.keyboard_arrow_down)
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now()
              );
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Uraian singkat kejadian'
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0
                  ),
                ),
                Expanded(
                  child: Text('Klik gambar untuk upload foto tersangka')
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print('submitted');
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
