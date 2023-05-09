import 'dart:async';

import 'package:fcb_donate/features/auth/screens/first_screen.dart';
import 'package:fcb_donate/features/user/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../admin/screens/home_ngo.dart';
import '../provider/userprovider.dart';
import '../utils/loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      another();
    });
  }

  another() {
    Provider.of<UserProvider>(context, listen: false).user.token.isNotEmpty
        ? Provider.of<UserProvider>(context, listen: false).user.type == 'user'
            ? Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route) => false)
            : Navigator.pushNamedAndRemoveUntil(context, FirstScreen.routeName,(route) => false)
        : Navigator.pushNamedAndRemoveUntil(context, FirstScreen.routeName,(route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage())
        )
      ),
    );
  }
}
