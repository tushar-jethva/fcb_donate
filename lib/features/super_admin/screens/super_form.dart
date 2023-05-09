import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/utils/button.dart';
import 'package:fcb_donate/utils/costom_textfield.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/ngo.dart';

class AdminForm extends StatefulWidget {
  static const routeName = '/super';
  const AdminForm({super.key});

  @override
  State<AdminForm> createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm> {
  final TextEditingController _ngo = TextEditingController();
  final TextEditingController _admin = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final _adminFormKey = GlobalKey<FormState>();

  XFile? ngoImage;
  pickNgoImage() async {
    ngoImage = await pickOneImage();
    setState(() {});
  }

  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "Form",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              ),
              const Gap(10),
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                Form(
                  key: _adminFormKey,
                  child: Column(
                    children: [
                      CustomTextField(hintText: "Ngo Name", controller: _ngo),
                      const Gap(10),
                      CustomTextField(
                          hintText: "Admin Name", controller: _admin),
                      const Gap(10),
                      CustomTextField(hintText: "Ngo type", controller: _type),
                      const Gap(10),
                      CustomTextField(hintText: "Ngo City", controller: _city),
                      const Gap(10),
                      CustomTextField(hintText: "Ngo Area", controller: _area),
                      const Gap(10),
                      CustomTextField(
                          hintText: "Ngo Description",
                          controller: _description),
                      const Gap(10),
                      CustomTextField(
                          hintText: "Ngo Mobile", controller: _mobile),
                      const Gap(10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Select Ngo Image",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Gap(10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Books:"),
                              Checkbox(value: true, onChanged: (val) {}),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Clothes:"),
                              Checkbox(value: true, onChanged: (val) {}),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Food:"),
                              Checkbox(value: true, onChanged: (val) {}),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Money:"),
                              Checkbox(value: true, onChanged: (val) {}),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Select Ngo Image",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    pickNgoImage();
                  },
                  child: ngoImage == null
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
                            child: const Icon(
                              Icons.add_a_photo,
                              size: 40,
                            ),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: FileImage(
                                File(ngoImage!.path),
                              ),
                            ),
                          ),
                        ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoad = true;
                    });
                    String url = await SuperService()
                        .storageNgoImage(ngoImage!, _ngo.text);

                    // Ngo data = Ngo(
                    //     annualRepo: " ",
                    //     payNumber: " ",
                    //     refProof: " ",
                    //     regNumber: " ",
                    //     books: 1,
                    //     clothes: 0,
                    //     food: 1,
                    //     money: 1,
                    //     website: " ",
                    //     id: " ",
                    //     ngo_name: _ngo.text,
                    //     ngo_admin: _admin.text,
                    //     city: _city.text,
                    //     area: _area.text,
                    //     description: _description.text,
                    //     mobile_no: _mobile.text,
                    //     image: url);

                    // await SuperService().addNgo(ngo: data, context: context);
                    setState(() {
                      isLoad = false;
                    });
                  },
                  child: CustomButton(
                    widget: isLoad ? const Loader() : const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
