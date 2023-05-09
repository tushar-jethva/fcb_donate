import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MySuperModel {
  final String ngo_name;
  final String ngo_admin;
  final String mobile_no;
  String? website;
  int books ;
  int food ;
  int clothes ;
  int money ;
  String? payNumber;
  final String area;
  final String city;
  final String state;
  final String description;
  final String ngo_photo;
  final String regNumber;
  final String regProof;
  final String annualRepo;
  MySuperModel({
    required this.ngo_name,
    required this.ngo_admin,
    required this.mobile_no,
    this.website,
     this.books=0,
     this.food=0,
     this.clothes=0,
     this.money=0,
    this.payNumber,
    required this.area,
    required this.city,
    required this.state,
    required this.description,
    required this.ngo_photo,
    required this.regNumber,
    required this.regProof,
    required this.annualRepo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ngo_name': ngo_name,
      'ngo_admin': ngo_admin,
      'mobile_no': mobile_no,
      'website': website,
      'books': books,
      'food': food,
      'clothes': clothes,
      'money': money,
      'payNumber': payNumber,
      'area': area,
      'city': city,
      'state': state,
      'description': description,
      'ngo_photo': ngo_photo,
      'regNumber': regNumber,
      'regProof': regProof,
      'annualRepo': annualRepo,
    };
  }

  factory MySuperModel.fromMap(Map<String, dynamic> map) {
    return MySuperModel(
      ngo_name: map['ngo_name'] as String,
      ngo_admin: map['ngo_admin'] as String,
      mobile_no: map['mobile_no'] as String,
      website: map['website'] != null ? map['website'] as String : null,
      books: map['books'] ?? 0,
      food: map['food'] ?? 0,
      clothes: map['clothes'] ?? 0,
      money: map['money'] ?? 0,
      payNumber: map['payNumber'] != null ? map['payNumber'] as String : null,
      area: map['area'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      description: map['description'] as String,
      ngo_photo: map['ngo_photo'] as String,
      regNumber: map['regNumber'] as String,
      regProof: map['regProof'] as String,
      annualRepo: map['annualRepo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MySuperModel.fromJson(String source) =>
      MySuperModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
