// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  final String name;
  final String id;
  final String token;
  final num mobile_no;
  final String email;
  final num mobile_alt_no;
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
      name: map['name'] as String,
      id: map['id'] as String,
      token: map['token'] as String,
      mobile_no: map['mobile_no'] as num,
      email: map['email'] as String,
      mobile_alt_no: map['mobile_alt_no'] as num,
      address: map['address'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
