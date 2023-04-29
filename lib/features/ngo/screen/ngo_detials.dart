import 'package:fcb_donate/features/ngo/screen/donation_form.dart';
import 'package:fcb_donate/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../models/ngo.dart';

class NgoDetailScreen extends StatelessWidget {
  static const routeName = '/ngodetails';

  Ngo ngo;
  NgoDetailScreen({super.key, required this.ngo});

  @override
  Widget build(BuildContext context) {
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
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(ngo.image!),
                    ),
                  ),
                ),
                const Gap(15),
                Row(
                  children: [
                    const Text(
                      "Ngo Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        ngo.ngo_name,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Row(
                  children: [
                    const Text(
                      "Ngo Description: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        ngo.description,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Row(
                  children: [
                    const Text(
                      "Ngo Area : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        ngo.area,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Row(
                  children: [
                    const Text(
                      "Ngo City: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        ngo.city,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Row(
                  children: [
                    const Text(
                      "Ngo Contact: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        ngo.mobile_no,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Row(
                  children: [
                    const Text(
                      "Ngo Admin: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        ngo.ngo_admin,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DonationForm.routeName,
                        arguments: ngo);
                  },
                  child: CustomButton(
                    widget: const Text(
                      "Donate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
