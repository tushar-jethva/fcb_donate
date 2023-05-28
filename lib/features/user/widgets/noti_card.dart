// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:fcb_donate/constants/colors.dart';

class MyNotiCard extends StatelessWidget {
  final bool isDeclined;
  final String ngoName;
  const MyNotiCard({
    Key? key,
    required this.isDeclined,
    required this.ngoName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: isDeclined
                  ? DecorationImage(
                      image: AssetImage("assets/redlogo.png"),
                      fit: BoxFit.cover)
                  : DecorationImage(
                      image: AssetImage("assets/logo.png"), fit: BoxFit.cover)),
        ),
        title: isDeclined
            ? Text(
                "Sorry!, Your Donation has been Declined by $ngoName",
                style: TextStyle(color: black),
              )
            : Text(
                "Thank You, Your Donation has been Accepted by $ngoName",
                style: TextStyle(color: black),
              ),
        subtitle: Text(
          "Tap to know more details!",
        ),
      ),
    );
  }
}
