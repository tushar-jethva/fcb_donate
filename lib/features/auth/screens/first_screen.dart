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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Gap(size.height * 0.3),
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage(
              "assets/logo.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const Gap(10),
                const Text(
                  "Login as",
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 155, 4),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                const Gap(10),
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
                    child: const Center(
                        child: Text(
                      "User",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 206, 155, 4)),
                    )),
                  ),
                ),
                const Gap(20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Login.routeName,
                        arguments: false);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 221, 220, 220),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Ngo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 206, 155, 4)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
