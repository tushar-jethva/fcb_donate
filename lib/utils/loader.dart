import 'package:fcb_donate/constants/colors.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final bool isAdmin;
  const Loader({super.key,this.isAdmin=false});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: 
      isAdmin?const CircularProgressIndicator(
        color: themeColor,
      ):
      const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
