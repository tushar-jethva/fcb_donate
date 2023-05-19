import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/auth/screens/first_screen.dart';
import 'package:fcb_donate/features/ngo/screen/ngo_detials.dart';
import 'package:fcb_donate/features/super_admin/screens/details.dart';
import 'package:fcb_donate/features/super_admin/screens/request_screen.dart';
// import 'package:fcb_donate/features/super_admin/screens/super_form.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:fcb_donate/utils/ngo_card.dart';
import 'package:fcb_donate/utils/see_ngo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../models/ngo.dart';

class SuperAdminScreen extends StatefulWidget {
  static const routeName = "/super";
  const SuperAdminScreen({super.key});

  @override
  State<SuperAdminScreen> createState() => _SuperAdminScreenState();
}

class _SuperAdminScreenState extends State<SuperAdminScreen> {
  List<Ngo>? allNgo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllNgo();
  }

  fetchAllNgo() async {
    allNgo = await SuperService().fetchAllNgo();
    setState(() {});
  }

  showdialogg() {
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, FirstScreen.routeName, (route) => false);
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NGOs",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showdialogg();
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: allNgo == null
          ? const Loader()
          : RefreshIndicator(
              onRefresh: () {
                return fetchAllNgo();
              },
              child: GridView.builder(
                itemCount: allNgo!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SuperDetails.routeName,
                          arguments: {"ngo": allNgo![index], "isExist": true});
                    },
                    child: MySeeNGOCard(
                        img: allNgo![index].ngo_photo,
                        name: allNgo![index].ngo_name,
                        area: allNgo![index].area,
                        desc: allNgo![index].description),
                  );
                },
              ),
            ),
    );
  }
}
