import 'package:flutter/material.dart';


class MyContainerImage extends StatelessWidget {
  final Widget widget;
  const MyContainerImage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: Colors.black87, blurRadius: 0.5)]),
      child: widget,
    );
  }
}
