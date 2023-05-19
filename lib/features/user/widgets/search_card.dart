// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import 'package:fcb_donate/admin/widgets/custom_row.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/user/widgets/custom_row.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MySearchCard extends StatelessWidget {
  final String url;
  final String ngo_name;
  final String ngo_number;
  final String ngo_city;
  final String ngo_area;
  MySearchCard({
    Key? key,
    required this.url,
    required this.ngo_name,
    required this.ngo_number,
    required this.ngo_city,
    required this.ngo_area,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: size.height * 0.165,
            width: 140,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(url), fit: BoxFit.cover),
            ),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(10),
              MyCustomRowSearching(left: "Ngo Name: ", right: ngo_name),
              Gap(10),
              MyCustomRowSearching(left: "Mobile No: ", right: ngo_number),
              Gap(10),
              MyCustomRowSearching(left: "Area: ", right: ngo_area),
              Gap(10),
              MyCustomRowSearching(left: "City: ", right: ngo_city),
            ],
          )
        ],
      ),
    );
  }
}
