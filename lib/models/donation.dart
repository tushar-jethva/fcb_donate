import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Donation {
  final String donationId;
  final String userId;
  final String ngoName;
  final String mobile1;
  final String mobile2;
  final String category;
  final String userName;
  final String description;
  final List<String> images;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final String ngoId;
  final int status;
  Donation({
    required this.donationId,
    required this.userId,
    required this.ngoName,
    required this.mobile1,
    required this.mobile2,
    required this.category,
    required this.userName,
    required this.description,
    required this.images,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
    required this.ngoId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'donationId': donationId,
      'userId': userId,
      'ngoName': ngoName,
      'mobile1': mobile1,
      'mobile2': mobile2,
      'category': category,
      'userName': userName,
      'description': description,
      'images': images,
      'address': address,
      'pincode': pincode,
      'city': city,
      'state': state,
      'ngoId': ngoId,
      'status': status,
    };
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      donationId: map['_id'] as String,
      userId: map['userId'] as String,
      ngoName: map['ngoName'] as String,
      mobile1: map['mobile1'] as String,
      mobile2: map['mobile2'] as String,
      category: map['category'] as String,
      userName: map['userName'] as String,
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List<dynamic>)),
      address: map['address'] as String,
      pincode: map['pincode'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      ngoId: map['ngoId'] as String,
      status: map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Donation.fromJson(String source) =>
      Donation.fromMap(json.decode(source) as Map<String, dynamic>);
}
