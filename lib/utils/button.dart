import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Widget widget;
  CustomButton({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 34, 103, 160),
            Color.fromARGB(255, 224, 95, 138)
          ])),
      child: Center(child: widget),
    );
  }
}
