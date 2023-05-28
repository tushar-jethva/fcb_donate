// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ngo {
  final String id;
  final String username;
  final String password;
  final String ngo_name;
  final String ngo_admin;
  final String city;
  final String area;
  final String state;
  final String description;
  final String mobile_no;
  final String ngo_photo;
  final String website;
  final int books;
  final int food;
  final int clothes;
  final int money;
  final String payNumber;
  final String regNumber;
  final String regProof;
  final String annualRepo;
  Ngo({
    required this.id,
    required this.username,
    required this.password,
    required this.ngo_name,
    required this.ngo_admin,
    required this.city,
    required this.area,
    required this.state,
    required this.description,
    required this.mobile_no,
    required this.ngo_photo,
    required this.website,
    this.books = 0,
    this.food = 0,
    this.clothes = 0,
    this.money = 0,
    required this.payNumber,
    required this.regNumber,
    required this.regProof,
    required this.annualRepo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'id': id,
      'ngo_name': ngo_name,
      'ngo_admin': ngo_admin,
      'city': city,
      'area': area,
      'description': description,
      'mobile_no': mobile_no,
      'ngo_photo': ngo_photo,
      'website': website,
      'books': books,
      'food': food,
      'clothes': clothes,
      'money': money,
      'state':state,
      'payNumber': payNumber,
      'regNumber': regNumber,
      'regProof': regProof,
      'annualRepo': annualRepo,
    };
  }

  factory Ngo.fromMap(Map<String, dynamic> map) {
    return Ngo(
      state: map['state']??'',
      id: map['_id'] ?? "",
      ngo_name: map['ngo_name'] ?? " ",
      ngo_admin: map['ngo_admin'] ?? " ",
      city: map['city'] ?? " ",
      area: map['area'] ?? " ",
      description: map['description'] ?? " ",
      mobile_no: map['mobile_no'] ?? " ",
      ngo_photo: map['ngo_photo'] ?? " ",
      website: map['website'] ?? "",
      books: map['books'] ?? 0,
      food: map['food'] ?? 0,
      clothes: map['clothes'] ?? 0,
      money: map['money'] ?? 0,
      payNumber: map['payNumber'] ?? "",
      regNumber: map['regNumber'] ?? "",
      regProof: map['regProof'] ?? "",
      annualRepo: map['annualRepo'] ?? "",
      password: map['password'] ?? "",
      username: map['username'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Ngo.fromJson(String source) =>
      Ngo.fromMap(json.decode(source) as Map<String, dynamic>);
}
