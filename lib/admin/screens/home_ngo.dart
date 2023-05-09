import 'dart:convert';

import 'package:fcb_donate/admin/screens/request.dart';
import 'package:fcb_donate/provider/ngoprovider.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/utils/container_image.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:provider/provider.dart';

import '../../models/ngo.dart';
import '../services/ngo_services.dart';
import '../widgets/ngorowdetails.dart';

class MyHomeNgoAdmin extends StatefulWidget {
  static const routeName = '/ngoadmin';
  const MyHomeNgoAdmin({super.key});

  @override
  State<MyHomeNgoAdmin> createState() => _MyHomeNgoAdminState();
}

class _MyHomeNgoAdminState extends State<MyHomeNgoAdmin> {
  final NgoServices ngoServices = NgoServices();
  @override
  void initState() {
    super.initState();
    print("hi");
    getNgoDetails();
  }

  Ngo? ngo;
  void getNgoDetails() async {
    final user = Provider.of<UserProvider>(context).user;
    ngo = await ngoServices.getNgoDetails(
      context: context,
    );
    setState(() {});
  }

  bool isBright = true;
  void dark() {
    if (isBright) {
      setState(() {
        isBright = false;
      });
    } else {
      setState(() {
        isBright = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ngoProvider = Provider.of<NgoProvider>(context, listen: false).ngo;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: dark,
                    child: MyContainerImage(
                      widget: isBright
                          ? const Icon(
                              Icons.nights_stay_outlined,
                              color: Colors.teal,
                            )
                          : const Icon(
                              Icons.sunny,
                              color: Colors.teal,
                            ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyRequestPage()));
                    },
                    child: const MyContainerImage(
                      widget: Icon(
                        Icons.login_rounded,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(50),
              Container(
                height: 150,
                width: 150,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/ngo.jpg"), fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
              const Gap(5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Ngo Name",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black87, fontSize: 20),
                ),
              ),
              const Gap(50),
              NgoRowDetails(
                leftText: "Admin Name:",
                rightText: ngoProvider.ngo_admin,
              ),
              const Gap(10),
              NgoRowDetails(
                leftText: "Contact Details:",
                rightText: ngoProvider.mobile_no,
              ),
              const Gap(10),
              NgoRowDetails(
                leftText: "Area:",
                rightText: ngoProvider.area,
              ),
              const Gap(10),
              NgoRowDetails(
                leftText: "City:",
                rightText: ngoProvider.city,
              ),
              const Gap(10),
              NgoRowDetails(
                leftText: "Description:",
                rightText: ngoProvider.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
