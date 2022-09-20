import 'package:flutter/material.dart';

class EvidencePage extends StatefulWidget {
  const EvidencePage({Key? key}) : super(key: key);

  @override
  State<EvidencePage> createState() => _EvidencePageState();
}

class _EvidencePageState extends State<EvidencePage> {
  @override

  var report_number = '1234567890';
  var evidence_name = 'John Doe';
  var id_number = '1234567890';
  var guardian_name = 'Jane Doe';
  var address = 'Jl. Kenangan';
  var date = '01-01-2000';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data DPO',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.red[900],
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Center(
            child: Icon(
              Icons.person,
              size: 200,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Nomor Laporan Polisi',
              contentPadding: EdgeInsets.all(10)
            ),
            initialValue: report_number,
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Nama Tersangka',
                contentPadding: EdgeInsets.all(10)
            ),
            initialValue: evidence_name,
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'NIK Tersangka',
                contentPadding: EdgeInsets.all(10)
            ),
            initialValue: id_number,
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Nama Orang Tua Tersangka',
                contentPadding: EdgeInsets.all(10)
            ),
            initialValue: guardian_name,
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Alamat Tersangka',
                contentPadding: EdgeInsets.all(10)
            ),
            initialValue: address,
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Nomor Laporan Polisi',
                contentPadding: EdgeInsets.all(10)
            ),
            initialValue: date,
            enabled: false,
          ),
        ],
      ),
    );
  }
}
