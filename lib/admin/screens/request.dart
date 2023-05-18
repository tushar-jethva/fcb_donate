import 'dart:async';

import 'package:fcb_donate/admin/screens/user_details.dart';
import 'package:fcb_donate/admin/services/ngo_services.dart';
import 'package:fcb_donate/admin/widgets/request_card.dart';
import 'package:fcb_donate/utils/loader.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../models/donation.dart';
import '../../provider/ngoprovider.dart';

class MyRequestPage extends StatefulWidget {
  const MyRequestPage({super.key});

  @override
  State<MyRequestPage> createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {
  final NgoServices ngoServices = NgoServices();
  List<Donation> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDonorDetails();
  }

  void getDonorDetails() async {
    var provider = Provider.of<NgoProvider>(context, listen: false).ngo;

    list = await ngoServices.getDonorsDetails(id: provider.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var ngo = Provider.of<NgoProvider>(context, listen: false).ngo;
    return SafeArea(
      child: Scaffold(
        body: list.isEmpty
            ? Center(child: Text("No Requests"))
            : ListView.builder(
                itemCount: list.length,
                padding: const EdgeInsets.all(15),
                itemBuilder: (
                  context,
                  index,
                ) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => MyUserDetails(
                                  ngo:ngo,
                                  donation: list[index],
                                  isCompleted: false,
                                )));
                      },
                      child: MyRequestCard(
                        donorName: list[index].userName,
                        mobile_no: list[index].mobile1,
                        address: list[index].address,
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
