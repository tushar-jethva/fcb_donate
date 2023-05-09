// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fcb_donate/features/ngo/screen/ngo_detials.dart';
import 'package:fcb_donate/features/ngo/service/ngo_service.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:fcb_donate/utils/see_ngo.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import '../features/ngo/screen/ngo_list_screen.dart';
import '../models/ngo.dart';

class MyNgoCard extends StatefulWidget {
  final String nameOfCity;
  final String type;
  final List<Map<String, dynamic>> list;
  const MyNgoCard(
      {Key? key,
      required this.nameOfCity,
      required this.list,
      required this.type})
      : super(key: key);

  @override
  State<MyNgoCard> createState() => _MyNgoCardState();
}

class _MyNgoCardState extends State<MyNgoCard> {
  List<Ngo>? ngos = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNgo();
  }

  fetchNgo() async {
    ngos = await NgoService()
        .getNgoByCity(city: widget.nameOfCity, type: widget.type);
    setState(() {});
  }

  navigateToNgoScreen(Ngo n) {
    Navigator.pushNamed(context, NgoDetailScreen.routeName, arguments: n);
  }

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
                    widget.nameOfCity,
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
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NgoListScreen.routeName,
                      arguments: ngos);
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black54, blurRadius: 0.1)
                ]),
            child: ngos!.length < 4
                ? const Loader()
                : Column(
                    children: [
                      const Gap(5),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateToNgoScreen(ngos![4]);
                            },
                            child: MySeeNGOCard(
                                img: ngos![4].ngo_photo ??
                                    "https://www.ngoregistration.org/wp-content/uploads/2018/06/NGO.jpg",
                                name: ngos![4].ngo_name,
                                area: ngos![4].area,
                                desc: ngos![4].description),
                          ),
                          InkWell(
                            onTap: () {
                              navigateToNgoScreen(ngos![5]);
                            },
                            child: MySeeNGOCard(
                                img: ngos![5].ngo_photo ??
                                    "https://www.ngoregistration.org/wp-content/uploads/2018/06/NGO.jpg",
                                name: ngos![5].ngo_name,
                                area: ngos![5].area,
                                desc: ngos![5].description),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateToNgoScreen(ngos![2]);
                            },
                            child: MySeeNGOCard(
                                img: ngos![2].ngo_photo == null
                                    ? "https://www.ngoregistration.org/wp-content/uploads/2018/06/NGO.jpg"
                                    : ngos![2].ngo_photo!,
                                name: ngos![2].ngo_name,
                                area: ngos![2].area,
                                desc: ngos![2].description),
                          ),
                          InkWell(
                            onTap: () {
                              navigateToNgoScreen(ngos![3]);
                            },
                            child: MySeeNGOCard(
                                img: ngos![3].ngo_photo ??
                                    "https://www.ngoregistration.org/wp-content/uploads/2018/06/NGO.jpg",
                                name: ngos![3].ngo_name,
                                area: ngos![3].area,
                                desc: ngos![3].description),
                          ),
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
