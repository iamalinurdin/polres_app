import 'package:flutter/material.dart';
import 'package:polres_app/services/suspect.dart';

class EvidencePage extends StatefulWidget {
  const EvidencePage({Key? key, this.result}) : super(key: key);

  final result;

  // print(result);

  @override
  State<EvidencePage> createState() => _EvidencePageState();
}

class _EvidencePageState extends State<EvidencePage> {
  @override
  Widget build(BuildContext context) {
    final response = widget.result;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data DPO',
          style: TextStyle(color: Colors.black),
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
                contentPadding: EdgeInsets.all(10)),
            initialValue: response['report_number'],
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Nama Tersangka', contentPadding: EdgeInsets.all(10)),
            initialValue: response['full_name'],
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'NIK Tersangka', contentPadding: EdgeInsets.all(10)),
            initialValue: response['nik'],
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Nama Orang Tua Tersangka',
                contentPadding: EdgeInsets.all(10)),
            initialValue: response['parent_name'],
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Alamat Tersangka',
                contentPadding: EdgeInsets.all(10)),
            initialValue: response['address'],
            enabled: false,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Deskripsi', contentPadding: EdgeInsets.all(10)),
            initialValue: response['description'],
            enabled: false,
          ),
        ],
      ),
    );
  }
}
