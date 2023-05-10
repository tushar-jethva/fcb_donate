import 'package:fcb_donate/features/auth/screens/login.dart';
import 'package:fcb_donate/features/user/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FirstScreen extends StatelessWidget {
  static const routeName = '/first';
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(size.height * 0.17),
            const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  "assets/logo.png",
                ),
              ),
            ),
            Gap(size.height * 0.25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const Gap(10),
                  const Gap(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Login.routeName,
                              arguments: true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * 0.87,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 31, 64, 60),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "User",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 192, 55),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      const Gap(25),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Login.routeName,
                              arguments: true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * 0.87,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 31, 64, 60),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "NGO",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 192, 55),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(size.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Please check out ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 31, 64, 60),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Terms and Conditions!",
                      style: TextStyle(
                          color: Color.fromARGB(255, 31, 64, 60),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
