// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import 'ngorowdetails.dart';

class MyRequestCard extends StatelessWidget {
  final String donorName;
  final String mobile_no;
  final String address;
  const MyRequestCard({
    Key? key,
    required this.donorName,
    required this.mobile_no,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: [
          Align(
            child: Text(
              "Details",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
          ),
          Gap(30),
          NgoRowDetails(leftText: "DonorName", rightText: donorName),
          const Gap(5),
          NgoRowDetails(leftText: "MobileNo", rightText: mobile_no),
          const Gap(5),
          NgoRowDetails(leftText: "Address", rightText: address),
          const Gap(5),
        ],
      ),
    );
  }
}
