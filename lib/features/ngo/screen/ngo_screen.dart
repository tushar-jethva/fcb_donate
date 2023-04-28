// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import '../../../utils/ngo_card.dart';

class MyNGOScreen extends StatefulWidget {
  final String imgUrl;
  const MyNGOScreen({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<MyNGOScreen> createState() => _MyNGOScreenState();
}

class _MyNGOScreenState extends State<MyNGOScreen> {
  List<Map<String, dynamic>> list = [
    {
      "img": "assets/clothes.jpeg",
      "name": "Shaishav",
      "area": "Ram Mantra",
      "desc": "We are work for child education and etc."
    },
    {
      "img": "assets/ngologo.png",
      "name": "Vidhya Foundation",
      "area": "VidhyaNagar",
      "desc": "We are work for child education and etc."
    },
    {
      "img": "assets/food.jpg",
      "name": "Sardar Patel Foundation",
      "area": "Sardar Nagar",
      "desc": "We are work for child education and etc."
    },
    {
      "img": "assets/books.jpeg",
      "name": "Jagruti Foundation",
      "area": "Kalia Bid",
      "desc": "We are work for child education and etc."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "Donate",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              ),
              const Gap(10),
              Image.asset(
                widget.imgUrl,
                height: 30,
                width: 30,
              )
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyNgoCard(
                nameOfCity: "Bhavnagar",
                list: list,
              ),
              const Gap(15),
              // MyNgoCard(
              //   nameOfCity: "SURAT",
              //   list: list,
              // ),
              const Gap(15),
            ],
          ),
        ));
  }
}
