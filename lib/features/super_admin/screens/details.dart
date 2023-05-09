import 'package:fcb_donate/features/ngo/screen/donation_form.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../constants/all_constant.dart';
import '../../../models/ngo.dart';
import '../../../utils/loader.dart';

class SuperDetails extends StatefulWidget {
  static const routeName = '/superdetails';

  Ngo ngo;
  bool isExist;
  SuperDetails({super.key, required this.ngo, required this.isExist});

  @override
  State<SuperDetails> createState() => _SuperDetailsState();
}

class _SuperDetailsState extends State<SuperDetails> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final size = MediaQuery.of(context).size;
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
      body: SafeArea(
        child: isLoad
            ? const Loader()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    Container(
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.ngo.ngo_photo),
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
                            widget.ngo.ngo_name,
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
                            widget.ngo.description,
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
                            widget.ngo.area,
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
                            widget.ngo.city,
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
                            widget.ngo.mobile_no,
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
                            widget.ngo.ngo_admin,
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
                          "PayMent Number ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            widget.ngo.payNumber,
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
                          "Registration Number ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            widget.ngo.regNumber,
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
                          "Ngo Website: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            widget.ngo.website,
                            style: const TextStyle(color: Colors.grey),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                    Container(
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.ngo.regProof),
                        ),
                      ),
                    ),
                    widget.isExist
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  isLoad = true;
                                });
                                await SuperService().deleteNgo(widget.ngo.id);

                                setState(() {
                                  isLoad = false;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red),
                                child: const Center(child: Text("Delete")),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      isLoad = true;
                                    });
                                    await SuperService()
                                        .declineNgo(widget.ngo.id);

                                    setState(() {
                                      isLoad = false;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: size.width * 0.41,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.red),
                                    child: const Center(child: Text("Decline")),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      isLoad = true;
                                    });
                                    await SuperService().addNgo(
                                        ngo: widget.ngo, context: context);

                                    setState(() {
                                      isLoad = false;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: size.width * 0.41,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.green),
                                    child: const Center(child: Text("Accept")),
                                  ),
                                )
                              ],
                            ),
                          )
                  ]),
                ),
              ),
      ),
    );
  }
}
