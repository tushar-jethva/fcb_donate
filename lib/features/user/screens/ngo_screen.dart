import 'package:fcb_donate/features/user/screens/donation_screen.dart';
import 'package:fcb_donate/utils/button.dart';
import 'package:flutter/material.dart';

class NgoScreen extends StatelessWidget {
  Map<String, dynamic> data;
  static const routeName = '/ngo';
  NgoScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 120),
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 47, 139),
                Color.fromARGB(255, 38, 179, 189)
              ],
            ),
          ),
          child: SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.navigate_before,
                        color: Colors.grey,
                        size: 30,
                      )),
                  Text(
                    data['name']!,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
          child: Column(
            children: [
              Container(
                height: size.height * 0.40,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey),
                    right: BorderSide(color: Colors.grey),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data['image']!),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Text(
                      "About Ngo",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                        "We surprise you time to time by sending you our exclusive “happiness box” containing surprise goodies and vouchers for you."),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    Text(data['location']!),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DonationScreen.routeName);
                  },
                  child: CustomButton(widget: const Text("Donate")))
            ],
          ),
        ),
      ),
    );
  }
}
