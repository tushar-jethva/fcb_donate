import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Donation {
  final String id;
  final String ngoName;
  final String category;
  final String userName;
  final String description;
  final List<String> images;
  final String address;
  final String pincode;
  final String city;
  final String state;
  Donation({
    required this.id,
    required this.ngoName,
    required this.category,
    required this.userName,
    required this.description,
    required this.images,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ngoName': ngoName,
      'category': category,
      'userName': userName,
      'description': description,
      'images': images,
      'address': address,
      'pincode': pincode,
      'city': city,
      'state': state,
    };
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      id: map['id'] as String,
      ngoName: map['ngoName'] as String,
      category: map['category'] as String,
      userName: map['userName'] as String,
      description: map['description'] as String,
      images: List<String>.from(
        (map['images'] as List<String>),
      ),
      address: map['address'] ?? "",
      pincode: map['pincode'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Donation.fromJson(String source) =>
      Donation.fromMap(json.decode(source) as Map<String, dynamic>);
}
