// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  final String name;
  final String id;
  final String token;
  final String mobile_no;
  final String email;
  final String mobile_alt_no;
  final String address;
  final String type;
  User({
    required this.name,
    required this.id,
    required this.token,
    required this.mobile_no,
    required this.email,
    required this.mobile_alt_no,
    required this.address,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'token': token,
      'mobile_no': mobile_no,
      'email': email,
      'mobile_alt_no': mobile_alt_no,
      'address': address,
      'type': type,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      id: map['_id'] ?? '',
      token: map['token'] ?? '',
      mobile_no: map['mobile_no'] ?? "",
      email: map['email'] ?? '',
      mobile_alt_no: map['mobile_alt_no'] ?? "",
      address: map['address'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
