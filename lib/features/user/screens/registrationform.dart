import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/ngo/service/ngo_service.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/models/ngo.dart';
import 'package:fcb_donate/models/tusharmodel.dart';
import 'package:fcb_donate/utils/button.dart';
import 'package:fcb_donate/utils/costom_textfield.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/mycheckbox.dart';
import '../../../utils/myphoto.dart';

class MySuperForm extends StatefulWidget {
  static const routeName = '/register';
  const MySuperForm({super.key});

  @override
  State<MySuperForm> createState() => _MySuperFormState();
}

class _MySuperFormState extends State<MySuperForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ngoNameController = TextEditingController();
  final TextEditingController _ngoAdminController = TextEditingController();
  final TextEditingController _ngoMobileController = TextEditingController();
  final TextEditingController _ngoWebsiteController = TextEditingController();
  final TextEditingController _ngoAreaController = TextEditingController();
  final TextEditingController _ngoCityController = TextEditingController();
  final TextEditingController _ngoStateController = TextEditingController();
  final TextEditingController _ngoDiscriptionController =
      TextEditingController();
  final TextEditingController _ngoPayNumberController = TextEditingController();
  final TextEditingController _ngoRegistrationNumber = TextEditingController();
  // final MySuperFormService mySuperFormService = MySuperFormService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ngoNameController;
    _ngoAdminController;
    _ngoMobileController;
    _ngoWebsiteController;
    _ngoAreaController;
    _ngoCityController;
    _ngoStateController;
    _ngoDiscriptionController;
    _ngoRegistrationNumber;
    _ngoPayNumberController.dispose();
  }

  bool book = false;
  bool food = false;
  bool clothes = false;
  bool money = false;

  XFile? image;
  void pickImage1() async {
    image = await pickOneImage();
    setState(() {});
  }

  XFile? image2;
  void pickImage2() async {
    image2 = await pickOneImage();
    setState(() {});
  }

  XFile? image3;
  void pickImage3() async {
    image3 = await pickOneImage();
    setState(() {});
  }

  bool isLoad = false;
  void addTempNgo() async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Enter Ngo Details",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(30),
                      CustomTextField(
                          controller: _ngoNameController, hintText: "NGO Name"),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoAdminController,
                          hintText: "Admin Name"),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoMobileController, hintText: "Mobile"),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoWebsiteController,
                          hintText: "Website"),
                      const Gap(20),
                      Container(
                        child: Text(
                          "Donation Types:",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyCheckBox(
                              checkValue: book,
                              checkName: "Book",
                              fun: (val) {
                                setState(() {
                                  book = val;
                                });
                              },
                            ),
                            MyCheckBox(
                              checkValue: food,
                              checkName: "Food",
                              fun: (val) {
                                setState(() {
                                  food = val;
                                });
                              },
                            ),
                            MyCheckBox(
                                fun: (val) {
                                  setState(() {
                                    clothes = val;
                                  });
                                },
                                checkValue: clothes,
                                checkName: "Clothes"),
                            MyCheckBox(
                              checkValue: money,
                              checkName: "Money",
                              fun: (val) {
                                setState(() {
                                  money = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      money
                          ? CustomTextField(
                              controller: _ngoPayNumberController,
                              hintText: "PayNumber")
                          : const SizedBox.shrink(),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoAreaController, hintText: "Area"),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoCityController, hintText: "City"),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoStateController, hintText: "State"),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoDiscriptionController,
                          hintText: "Description"),
                      const Gap(20),
                      CustomTextField(
                          controller: _ngoRegistrationNumber,
                          hintText: "Registration No."),
                      const Gap(20),
                      MyPhotoTaken(
                          fun: () {
                            pickImage1();
                          },
                          image: image,
                          text: "Add NGO Photo"),
                      const Gap(20),
                      MyPhotoTaken(
                          fun: () {
                            pickImage2();
                          },
                          image: image2,
                          text: "Add Registration Proof"),
                      const Gap(20),
                      MyPhotoTaken(
                          fun: () {
                            pickImage3();
                          },
                          image: image3,
                          text: "Add Annual Report"),
                      const Gap(4),
                      Text(
                        "Upload only jpg, jpeg or png file.",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey),
                      ),
                      const Gap(20),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoad = true;
                            });
                            String ngoPhoto = await SuperService()
                                .storageNgoImage(image!, "NgoImage");
                            String regProof = await SuperService()
                                .storageNgoImage(image2!, "Regi_proof");
                            String annualRepo = await SuperService()
                                .storageNgoImage(image3!, "annual");

                            Ngo model = Ngo(
                                books: book ? 1 : 0,
                                clothes: clothes ? 1 : 0,
                                food: food ? 1 : 0,
                                money: money ? 1 : 0,
                                id: " ",
                                password: " ",
                                username: " ",
                                state: _ngoStateController.text,
                                ngo_name: _ngoNameController.text,
                                ngo_admin: _ngoAdminController.text,
                                city: _ngoCityController.text,
                                area: _ngoAreaController.text,
                                description: _ngoDiscriptionController.text,
                                mobile_no: _ngoMobileController.text,
                                ngo_photo: ngoPhoto,
                                website: _ngoWebsiteController.text,
                                payNumber: _ngoPayNumberController.text,
                                regNumber: _ngoRegistrationNumber.text,
                                regProof: regProof,
                                annualRepo: annualRepo);

                            // ignore: use_build_context_synchronously
                            print(model.toMap());
                            await SuperService().addTempNgo(
                                ngo: model, context: context);
                          }
                        },
                        child: CustomButton(
                          widget: const Text(
                            "Register",
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isLoad
              ? Positioned(
                  top: size.height * 0.5,
                  right: size.width * 0.5,
                  child: const Loader())
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
