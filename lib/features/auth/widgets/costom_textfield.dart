// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String hintText;
  bool isPass;
  TextEditingController controller;
  CustomTextField({
    Key? key,
    required this.hintText,
    this.isPass = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return widget.isPass
        ? TextField(
            controller: widget.controller,
            obscureText: isShow,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: isShow
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                ),
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                hintStyle: const TextStyle(fontSize: 14, color: Colors.black)),
          )
        : TextField(
            controller: widget.controller,
            obscureText: false,
            decoration: InputDecoration(
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                hintStyle: const TextStyle(fontSize: 14, color: Colors.black)),
          );
  }
}
