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
  final String profilePic;
  

  final int totalDonation;
  final int accepted;
  final int declined;
  User({
    required this.name,
    required this.id,
    required this.token,
    required this.mobile_no,
    required this.email,
    required this.mobile_alt_no,
    required this.address,
    required this.type,
    required this.profilePic,
  
    required this.totalDonation,
    required this.accepted,
    required this.declined,
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
      'profilePic': profilePic,
      'totalDonation': totalDonation,
      'accepted': accepted,
      'declined': declined,
      
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      
      name: map['name'] ?? "",
      id: map['_id'] ?? "",
      token: map['token'] ?? "",
      mobile_no: map['mobile_no'] ?? "",
      email: map['email'] ?? "",
      mobile_alt_no: map['mobile_alt_no'] ?? "",
      address: map['address'] ?? "",
      type: map['type'] ?? "",
      profilePic: map['profilePic'] ?? "",
      totalDonation: map['totalDonation'] ?? 0,
      accepted: map['accepted'] ?? 0,
      declined: map['declined'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

 

  User copyWith({
    String? name,
    String? id,
    String? token,
    String? mobile_no,
    String? email,
    String? mobile_alt_no,
    String? address,
    String? type,
    String? profilePic,
   
    int? totalDonation,
    int? accepted,
    int? declined,
  }) {
    return User(
      name: name ?? this.name,
      id: id ?? this.id,
      token: token ?? this.token,
      mobile_no: mobile_no ?? this.mobile_no,
      email: email ?? this.email,
      mobile_alt_no: mobile_alt_no ?? this.mobile_alt_no,
      address: address ?? this.address,
      type: type ?? this.type,
      profilePic: profilePic ?? this.profilePic,
      
      totalDonation: totalDonation ?? this.totalDonation,
      accepted: accepted ?? this.accepted,
      declined: declined ?? this.declined,
    );
  }
}
