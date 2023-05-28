// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/ngo/service/ngo_service.dart';
import 'package:fcb_donate/models/donation.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/utils/button.dart';
import 'package:fcb_donate/utils/costom_textfield.dart';
import 'package:fcb_donate/utils/loader.dart';

import '../../../models/ngo.dart';

class DonationForm extends StatefulWidget {
  static const routeName = '/form';
  Ngo ngo;

  DonationForm({
    Key? key,
    required this.ngo,
  }) : super(key: key);

  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  TextEditingController _nameController = new TextEditingController();

  TextEditingController _address = new TextEditingController();

  TextEditingController _mobile1 = new TextEditingController();

  TextEditingController _mobile2 = new TextEditingController();

  TextEditingController _city = new TextEditingController();

  TextEditingController _pincode = new TextEditingController();

  TextEditingController _state = new TextEditingController();

  TextEditingController _description = new TextEditingController();

  List<XFile?>? images;

  void pickImages() async {
    images = await pickMultiImage();
    setState(() {});
  }

  final _donationkey = GlobalKey<FormState>();
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              widget.ngo.ngo_name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
            ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              Form(
                key: _donationkey,
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
                    const Gap(20),
                    CustomTextField(
                      hintText: "City",
                      controller: _city,
                    ),
                    const Gap(20),
                    CustomTextField(
                      hintText: "Pincode",
                      controller: _pincode,
                    ),
                    const Gap(20),
                    CustomTextField(
                      hintText: "State",
                      controller: _state,
                    ),
                    const Gap(20),
                    CustomTextField(
                      hintText: "Description",
                      controller: _description,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Select Images",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  pickImages();
                },
                child: images == null
                    ? DottedBorder(
                        radius: const Radius.circular(20),
                        strokeCap: StrokeCap.round,
                        borderType: BorderType.RRect,
                        dashPattern: const [10, 4],
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.add_a_photo,
                              size: 40,
                            )),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images!.length,
                            itemBuilder: (context, index) {
                              return Image.file(
                                File(images![index]!.path),
                                fit: BoxFit.cover,
                              );
                            }),
                      ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoad = true;
                  });
                  String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
                  RegExp regExp = new RegExp(pattern);
                  if (_donationkey.currentState!.validate()) {
                    if (_mobile1.text.length != 10) {
                      GlobalSnakbar().showSnackbar("Enter valid Mobile Number");
                    } else if (!regExp.hasMatch(_mobile1.text)) {
                      GlobalSnakbar().showSnackbar("Enter valid Mobile Number");
                    } else {
                      List<String> urls = await NgoService().getImagesUrl(
                          images: images!, name: widget.ngo.ngo_name);
                      Donation donation = Donation(
                        ngoId: widget.ngo.id,
                        userId: user.id,
                        donationId: "",
                        ngoName: widget.ngo.ngo_name,
                        category: " ",
                        userName: _nameController.text,
                        description: _description.text,
                        images: urls,
                        address: _address.text,
                        pincode: _pincode.text,
                        city: _city.text,
                        state: _state.text,
                        mobile1: _mobile1.text,
                        mobile2: _mobile2.text,
                        status: 0,
                      );
                      
                      await NgoService().postDonation(donation, context);
                    }
                  } else {
                    GlobalSnakbar().showSnackbar("Some Field are blank");
                  }
                  setState(() {
                    isLoad = false;
                  });
                },
                child: CustomButton(
                    widget: isLoad
                        ? const Loader()
                        : Text(
                            "Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: white),
                          )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
