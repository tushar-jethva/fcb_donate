import 'package:fcb_donate/features/auth/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FirstScreen extends StatelessWidget {
  static const routeName = '/first';
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/donate.jpg',
            height: size.height,
            // width: double.infinity,
            opacity: const AlwaysStoppedAnimation(0.4),
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Gap(size.height * 0.5),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Login.routeName,
                          arguments: true);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 221, 220, 220),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "User",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 70, 132, 148)),
                      )),
                    ),
                  ),
                  Gap(20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Login.routeName,
                          arguments: false);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 221, 220, 220),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Ngo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 70, 132, 148)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
