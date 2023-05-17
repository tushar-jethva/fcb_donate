// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NgoRowDetails extends StatelessWidget {
  String leftText;
  String rightText;
  NgoRowDetails({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$leftText:",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Expanded(
          child: Text(
            "  $rightText",
            style: const TextStyle(color: Colors.grey, fontSize: 17),
          ),
        )
      ],
    );
  }
}
