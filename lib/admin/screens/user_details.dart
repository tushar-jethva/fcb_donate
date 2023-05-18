// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import 'package:fcb_donate/admin/screens/receipt_from.dart';
import 'package:fcb_donate/admin/services/ngo_services.dart';
import 'package:fcb_donate/admin/widgets/ngorowdetails.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/ngo/service/ngo_service.dart';
import 'package:fcb_donate/utils/button.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:provider/provider.dart';

import '../../constants/all_constant.dart';
import '../../models/donation.dart';
import '../../models/ngo.dart';
import '../../utils/costom_textfield.dart';

class MyUserDetails extends StatefulWidget {
  final Ngo ngo;
  final Donation donation;
  final bool isCompleted;
  const MyUserDetails({
    Key? key,
    required this.ngo,
    required this.donation,
    required this.isCompleted,
  }) : super(key: key);

  @override
  State<MyUserDetails> createState() => _MyUserDetailsState();
}

class _MyUserDetailsState extends State<MyUserDetails> {
  TextEditingController addDateController = TextEditingController();
  bool isLoad = false;
  final NgoServices ngoServices = NgoServices();

  callApis() async {
    setState(() {
      isLoad = true;
    });
    await ngoServices.declineDonation(
        userId: widget.donation.userId,
        donationId: widget.donation.donationId,
        context: context,
        onSuccess: () {
          GlobalSnakbar().showSnackbar("Donation Declined!");
        });
    await ngoServices.uploadReceipt(
        context: context,
        userId: widget.donation.userId,
        name: widget.ngo.ngo_name,
        mobile_no: widget.ngo.mobile_no,
        date: " ",
        time: " ",
        status: 2,
        onSuccess: () {
          Navigator.pop(context);
        });
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Donation Details ",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              isLoad == false
                  ? const Center(child: Loader())
                  : const SizedBox.shrink(),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.donation.images.length,
                      itemBuilder: ((context, index) {
                        return Image.network(widget.donation.images[index]);
                      }),
                    ),
                  ),
                  const Gap(20),
                  NgoRowDetails(
                      leftText: "Donor Name",
                      rightText: widget.donation.userName),
                  const Gap(10),
                  NgoRowDetails(
                      leftText: "Adddress", rightText: widget.donation.address),
                  const Gap(10),
                  NgoRowDetails(
                      leftText: "Donor City", rightText: widget.donation.city),
                  const Gap(10),
                  NgoRowDetails(
                      leftText: "Donor State",
                      rightText: widget.donation.state),
                  const Gap(10),
                  NgoRowDetails(
                      leftText: "Donation Category",
                      rightText: widget.donation.category),
                  const Gap(10),
                  NgoRowDetails(
                      leftText: "Pincode", rightText: widget.donation.pincode),
                  const Gap(10),
                  NgoRowDetails(
                      leftText: "Donation Description",
                      rightText: widget.donation.description),
                  const Gap(10),
                  NgoRowDetails(
                      leftText: "Donor MobileNo",
                      rightText: widget.donation.mobile1),
                  const Gap(10),
                  widget.donation.mobile2.isEmpty
                      ? NgoRowDetails(
                          leftText: "Donor MobileNo-2",
                          rightText: widget.donation.mobile2)
                      : const SizedBox.shrink(),
                  const Gap(10),
                  widget.isCompleted
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  callApis();
                                },
                                child: Container(
                                  height: 45,
                                  width: size.width * 0.41,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.red),
                                  child: isLoad
                                      ? const Loader()
                                      : Center(
                                          child: Text(
                                          "Decline",
                                          style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    isLoad = false;
                                  });
                                  // await NgoServices().acceptDonation(
                                  //     donationId: widget.donation.donationId,
                                  //     context: context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MyReceiptScreen(
                                              ngo: widget.ngo,
                                              donation: widget.donation)));
                                },
                                child: Container(
                                  height: 45,
                                  width: size.width * 0.41,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.green),
                                  child: const Center(
                                      child: Text(
                                    "Accept",
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
