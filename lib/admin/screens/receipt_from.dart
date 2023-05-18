// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fcb_donate/admin/services/ngo_services.dart';
import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/ngo/service/ngo_service.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:fcb_donate/admin/widgets/custom_row.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/models/donation.dart';
import 'package:fcb_donate/utils/button.dart';

import '../../models/ngo.dart';

class MyReceiptScreen extends StatefulWidget {
  static const routeName = '/receipt';
  final Ngo ngo;
  final Donation donation;
  const MyReceiptScreen({
    Key? key,
    required this.ngo,
    required this.donation,
  }) : super(key: key);

  @override
  State<MyReceiptScreen> createState() => _MyReceiptScreenState();
}

class _MyReceiptScreenState extends State<MyReceiptScreen> {
  final NgoServices ngoServices = NgoServices();
  bool isPicked = false;
  bool isTimePicked = false;
  String date = "";
  String time = "";
  bool isLoad = false;

  pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024));

    if (pickedDate != null) {
      DateFormat dateFormat = DateFormat("dd-MMM-yyyy");
      String tempd = dateFormat.format(pickedDate);
      setState(() {
        date = tempd;
        isPicked = true;
      });
    }
  }

  pickTime() async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      // DateFormat timeFormat = DateFormat("HH:mm");
      // TimeOfDayFormat timeOfDayFormat = TimeOfDayFormat.HH_colon_mm;
      setState(() {
        time =
            '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
        isTimePicked = true;
      });
    }
  }

  final receiptKey = GlobalKey<FormState>();
  callApis() async {
    setState(() {
      isLoad = true;
    });
    await ngoServices.acceptDonation(
        userId: widget.donation.userId,
        donationId: widget.donation.donationId,
        context: context);
    await ngoServices.uploadReceipt(
        context: context,
        userId: widget.donation.userId,
        name: widget.ngo.ngo_name,
        mobile_no: widget.ngo.mobile_no,
        date: date,
        time: time,
        status: 1,
        onSuccess: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Receipt",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: themeColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Form(
            key: receiptKey,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info,
                      color: themeColor,
                    ),
                    const Gap(10),
                    Flexible(
                      child: Text(
                        "In following receipt you have to specify Pick up date and Pick up time for when you pick up donation from Donor's house!",
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(20),
                CustomRowReceipt(
                  left: "NGO Name",
                  right: widget.ngo.ngo_name,
                ),
                const Gap(20),
                CustomRowReceipt(
                    left: "Mobile No", right: widget.ngo.mobile_no),
                const Gap(20),
                Row(
                  children: [
                    Text(
                      "Date",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black, fontSize: 17),
                    ),
                    const Gap(55),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          pickDate();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isPicked
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Text(
                                        date,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 112, 112, 112)),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        "Pick a Date",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                              Icon(
                                Icons.calendar_month,
                                color: themeColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    Text(
                      "Time",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black, fontSize: 17),
                    ),
                    const Gap(55),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          pickTime();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isTimePicked
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        time,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 112, 112, 112)),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        "Pick a time",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                              Icon(
                                Icons.access_time,
                                color: themeColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gap(30),
                InkWell(
                  onTap: () {
                    if (date.isEmpty) {
                      GlobalSnakbar()
                          .showSnackbar("Please Enter pick up Date!");
                    } else if (time.isEmpty) {
                      GlobalSnakbar().showSnackbar("Please Enter Time!");
                    } else {
                      callApis();
                    }
                  },
                  child: CustomButton(
                      widget: isLoad
                          ? Loader()
                          : Text(
                              "Send",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.bold),
                            )),
                )
              ],
            )),
      ),
    );
  }
}
