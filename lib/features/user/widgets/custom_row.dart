// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fcb_donate/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyCustomRowSearching extends StatelessWidget {
  final String left;
  final String right;
  const MyCustomRowSearching({
    Key? key,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          left,
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(color: black),
        ),
        Text(
          right,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: black),
        ),
      ],
    );
  }
}
