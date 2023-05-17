// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  int? lines;
  String hintText;
  bool isPass;
  TextEditingController controller;
  CustomTextField({
    Key? key,
    required this.hintText,
    this.lines = 1,
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
        ? TextFormField(
            style: const TextStyle(color: Colors.black),
            validator: (val) {
              if (widget.hintText != "Mobile2" && val!.isEmpty || val == null) {
                return 'Enter your ${widget.hintText}';
              }
            },
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
                labelText: widget.hintText,
                labelStyle: TextStyle(color: Color.fromARGB(255, 31, 64, 60)),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(255, 31, 64, 60)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 31, 64, 60)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 31, 64, 60)),
                ),
                hintStyle: const TextStyle(fontSize: 14, color: Colors.black)),
          )
        : TextFormField(
            style: TextStyle(color: Colors.black),
            maxLines: widget.lines,
            validator: (val) {
              if (widget.hintText != "Mobile2" && val!.isEmpty || val == null) {
                return 'Enter your ${widget.hintText}';
              }
            },
            controller: widget.controller,
            obscureText: false,
            decoration: InputDecoration(
                labelText: widget.hintText,
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 31, 64, 60)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 31, 64, 60)),
                ),
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
          );
  }
}
