class SuspectModel {
  final String name;
  final String time;
  final String number;

  SuspectModel({required this.name, required this.time, required this.number});

  factory SuspectModel.fromJson(Map<String, dynamic> value) {
    return SuspectModel(
        name: value['full_name'],
        time: value['createdAt'],
        number: value['report_number']);
  }
}
