// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  bool checkValue;
  final String checkName;
  Function fun;
  MyCheckBox({
    Key? key,
    required this.checkValue,
    required this.checkName,
    required this.fun,
  }) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.checkValue,
            onChanged: (val) {
              widget.fun(val);
            }),
        Text(
          widget.checkName,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
        ),
      ],
    );
  }
}
