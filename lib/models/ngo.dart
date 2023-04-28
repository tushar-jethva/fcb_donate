// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ngo {
  final String ngo_name;
  final String ngo_admin;
  final String city;
  final String area;
  final String description;
  final String mobile_no;
  final String ?image;
  Ngo({
    required this.ngo_name,
    required this.ngo_admin,
    required this.city,
    required this.area,
    required this.description,
    required this.mobile_no,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ngo_name': ngo_name,
      'ngo_admin': ngo_admin,
      'city': city,
      'area': area,
      'description': description,
      'mobile_no': mobile_no,
      'image': image,
    };
  }

  factory Ngo.fromMap(Map<String, dynamic> map) {
    return Ngo(
      ngo_name: map['ngo_name'] as String,
      ngo_admin: map['ngo_admin'] as String,
      city: map['city'] as String,
      area: map['area'] as String,
      description: map['description'] as String,
      mobile_no: map['mobile_no'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ngo.fromJson(String source) =>
      Ngo.fromMap(json.decode(source) as Map<String, dynamic>);

  Ngo copyWith({
    String? ngo_name,
    String? ngo_admin,
    String? city,
    String? area,
    String? description,
    String? mobile_no,
    String? image,
  }) {
    return Ngo(
      ngo_name: ngo_name ?? this.ngo_name,
      ngo_admin: ngo_admin ?? this.ngo_admin,
      city: city ?? this.city,
      area: area ?? this.area,
      description: description ?? this.description,
      mobile_no: mobile_no ?? this.mobile_no,
      image: image ?? this.image,
    );
  }
}
