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
                    color: Colors.grey[400],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
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
