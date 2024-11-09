import 'dart:async';

import 'package:fcb_donate/features/auth/screens/first_screen.dart';
import 'package:fcb_donate/features/auth/services/auth_services.dart';
import 'package:fcb_donate/features/super_admin/screens/bottombar.dart';
import 'package:fcb_donate/features/user/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../provider/userprovider.dart';
import '../utils/loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthServices services = AuthServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.getUserData(context: context);
    setState(() {});
    Timer(Duration(seconds: 5), () {
      print("another");
      another();
    });
  }

  void another() {
    var p = Provider.of<UserProvider>(context, listen: false).user;
    print("token is ${p.token}");
    print("user is ${p.type}");
    Provider.of<UserProvider>(context, listen: false).user.token.isNotEmpty
        ? Provider.of<UserProvider>(context, listen: false).user.type == 'user'
            ? Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false)
            : Provider.of<UserProvider>(context, listen: false).user.type ==
                    'super'
                ? Navigator.pushNamedAndRemoveUntil(
                    context, MySuperBottomBar.routeName, (route) => false)
                : Navigator.pushNamedAndRemoveUntil(
                    context, FirstScreen.routeName, (route) => false)
        : Navigator.pushNamedAndRemoveUntil(
            context, FirstScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 5, 27, 3),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        "assets/logo.png",
                      ),
                    ),
                  ),
                  Gap(10),
                  Center(
                    child: Text(
                      "FOOD | CLOTHES | BOOKS",
                      style: TextStyle(
                          color: Color.fromARGB(255, 206, 155, 4),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              )),
        ),
        Positioned(
          bottom: 200,
          left: MediaQuery.of(context).size.width * 0.45,
          child: const Loader(),
        )
      ],
    );
  }
}
