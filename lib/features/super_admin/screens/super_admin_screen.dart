import 'dart:developer';

import 'package:fcb_donate/features/ngo/screen/ngo_detials.dart';
import 'package:fcb_donate/features/super_admin/screens/details.dart';
import 'package:fcb_donate/features/super_admin/screens/request_screen.dart';
import 'package:fcb_donate/features/super_admin/screens/super_form.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:fcb_donate/utils/ngo_card.dart';
import 'package:fcb_donate/utils/see_ngo.dart';
import 'package:flutter/material.dart';

import '../../../models/ngo.dart';

class SuperAdminScreen extends StatefulWidget {
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
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RequestScreen.routeName);
              },
              child: Text("Request"))
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.pushNamed(context, AdminForm.routeName);
      //     SuperService().addTempNgo(ngo: allNgo![0], context: context);
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
