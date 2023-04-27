// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fcb_donate/utils/see_ngo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';



class MyNgoCard extends StatelessWidget {
  final String nameOfCity;
  final List<Map<String, dynamic>> list;
  const MyNgoCard({
    Key? key,
    required this.nameOfCity,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    nameOfCity,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                  const Gap(5),
                  Image.asset(
                    "assets/heart.png",
                    height: 34,
                    width: 30,
                  ),
                ],
              ),
              const Text(
                "See All",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Container(
            height: 524,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black54, blurRadius: 0.1)
                ]),
            child: Column(
              children: [
                const Gap(5),
                Row(
                  children: [
                    MySeeNGOCard(
                        img: list[0]['img'],
                        name: list[0]['name'],
                        area: list[0]['area'],
                        desc: list[0]['desc']),
                    MySeeNGOCard(
                        img: list[1]['img'],
                        name: list[1]['name'],
                        area: list[1]['area'],
                        desc: list[1]['desc']),
                  ],
                ),
                Row(
                  children: [
                    MySeeNGOCard(
                        img: list[2]['img'],
                        name: list[2]['name'],
                        area: list[2]['area'],
                        desc: list[2]['desc']),
                    MySeeNGOCard(
                        img: list[3]['img'],
                        name: list[3]['name'],
                        area: list[3]['area'],
                        desc: list[3]['desc']),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
