import 'package:fcb_donate/utils/costom_textfield.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  static const routeName = '/donate';
  DonationScreen({super.key});
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _mobile1 = new TextEditingController();
  TextEditingController _mobile2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    "Donation Form",
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                        hintText: "Name", controller: _nameController),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(hintText: "Mobile1", controller: _mobile1),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(hintText: "Mobile2", controller: _mobile2),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: "Address",
                      controller: _address,
                      lines: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
