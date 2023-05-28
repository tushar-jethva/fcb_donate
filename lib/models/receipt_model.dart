import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReceiptModel {
  final String user_id;
  final String ngo_name;
  final String ngo_number;
  final String date;
  final String time;
  final int status;
  ReceiptModel({
    required this.user_id,
    required this.ngo_name,
    required this.ngo_number,
    required this.date,
    required this.time,
    required this.status,
  });

  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': user_id,
      'ngo_name': ngo_name,
      'ngo_number': ngo_number,
      'date': date,
      'time': time,
      'status': status,
    };
  }

  factory ReceiptModel.fromMap(Map<String, dynamic> map) {
    return ReceiptModel(
      user_id: map['user_id'] as String,
      ngo_name: map['ngo_name'] as String,
      ngo_number: map['ngo_number'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      status: map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReceiptModel.fromJson(String source) => ReceiptModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
