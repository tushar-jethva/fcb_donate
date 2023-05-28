import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/auth/services/auth_services.dart';
import 'package:fcb_donate/features/ngo/service/ngo_service.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/models/user.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../models/donation.dart';
import '../services/user_service.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Donation> userDonations = [];

  @override
  void initState() {
    fetchUserDonation();
    fetchTotalDonation();
    super.initState();
    // print(userDonations);
  }

  fetchTotalDonation() async {
    await UserService().getTotalDonation(
        Provider.of<UserProvider>(context, listen: false).user.id, context);
  }

  fetchUserDonation() async {
    final id = Provider.of<UserProvider>(context, listen: false).user.id;
    userDonations = await UserService().getUserDonations(id);
    setState(() {});
  }

  XFile? profilePic;
  bool profileLoader = true;

  choseProfilePic(String id) async {
    profilePic = await pickOneImage();
    setState(() {
      profileLoader = false;
    });
    String imageUrl =
        await SuperService().storageNgoImage(profilePic!, "profilePoc");
    await UserService().userProfileSave(id, imageUrl, context);
    setState(() {
      profileLoader = true;
    });
  }

  showdialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("LogOut"),
          content: Text(
            "Are you sure to LogOut?",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Cancle",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                InkWell(
                  onTap: () {
                    AuthServices().logOut(context);
                  },
                  child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Yes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: white)),
                      ),
                    ),
                  ),
                ),
                const Gap(10)
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    return WillPopScope(
      onWillPop: () async => profileLoader,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: const BoxDecoration(),
            child: AppBar(
              title: Text(
                "Profile",
                style: TextStyle(color: black),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: themeColor,
                  )),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                    onPressed: () {
                      showdialog();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: themeColor,
                    ))
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                profileLoader == false
                    ? const Positioned(child: Loader())
                    : const SizedBox.shrink(),
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/logo.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: themeColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      const Text(
                                        "Total Donations",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        user.totalDonation.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: white),
                                      )
                                    ]),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: themeColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      const Text(
                                        "Accepted",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        user.accepted.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: white),
                                      )
                                    ]),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: themeColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Declined",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          user.declined.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Donations",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                itemCount: userDonations.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return CachedNetworkImage(
                                    imageUrl:userDonations[index].images[0],
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: constraints.maxWidth * 0.62,
                  top: constraints.maxHeight / 6,
                  child: profilePic == null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          backgroundImage: CachedNetworkImageProvider(user.profilePic))
                      : CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          backgroundImage: FileImage(File(profilePic!.path))),
                ),
                Positioned(
                    right: constraints.maxWidth * 0.63,
                    top: constraints.maxHeight / 3.7,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 30,
                        color: Color.fromARGB(255, 237, 180, 8),
                      ),
                      onPressed: () {
                        choseProfilePic(user.id);
                      },
                    )),
                Positioned(
                    right: constraints.maxWidth * 0.20,
                    top: constraints.maxHeight / 4.5,
                    child: Text(
                      user.name,
                      style: TextStyle(color: white),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
