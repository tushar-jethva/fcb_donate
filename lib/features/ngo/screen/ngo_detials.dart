// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/user/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:fcb_donate/features/ngo/screen/donation_form.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/utils/button.dart';

import '../../../constants/all_constant.dart';
import '../../../models/ngo.dart';

class NgoDetailScreen extends StatelessWidget {
  static const routeName = '/ngodetails';

  Map<String, dynamic> map;
  NgoDetailScreen({
    Key? key,
    required this.map,
  }) : super(key: key);

  deleteNgo(String id) {}

  @override
  Widget build(BuildContext context) {
    Ngo ngo = map['ngo'];
    bool isSearch = map['isSearch'];
    final user = Provider.of<UserProvider>(context).user;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              ngo.ngo_name,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(ngo.ngo_photo),
                    ),
                  ),
                ),
                const Gap(15),
                MyCustomRowSearching(left: "Ngo Name: ", right: ngo.ngo_name),
                const Gap(15),
                MyCustomRowSearching(left: "Ngo Admin: ", right: ngo.ngo_admin),
                const Gap(15),
                MyCustomRowSearching(left: "Mobile No: ", right: ngo.mobile_no),
                const Gap(15),
                MyCustomRowSearching(left: "Area: ", right: ngo.area),
                Gap(15),
                MyCustomRowSearching(left: "City: ", right: ngo.city),
                const Gap(15),
                MyCustomRowSearching(
                    left: "Description: ", right: ngo.description),
                const Gap(15),
                isSearch
                    ? SizedBox.shrink()
                    : GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(context, DonationForm.routeName,
                              arguments: ngo);

                          // GlobalSnakbar().showSnackbar("Ngo deleted Successfully");
                        },
                        child: CustomButton(
                          widget: const Text(
                            "Donate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
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
