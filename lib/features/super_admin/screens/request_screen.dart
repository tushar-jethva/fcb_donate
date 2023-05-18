import 'package:fcb_donate/features/super_admin/screens/details.dart';
import 'package:fcb_donate/features/super_admin/service/super_admin_service.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:fcb_donate/utils/see_ngo.dart';
import 'package:flutter/material.dart';

import '../../../models/ngo.dart';

class RequestScreen extends StatefulWidget {
  static const routeName = "/request";
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  List<Ngo>? tempNog;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTempNgo();
  }

  fetchTempNgo() async {
    tempNog = await SuperService().fetchRequestedNgo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add or Remove",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),
      body: tempNog == null
          ? const Loader(
              isAdmin: true,
            )
          : GridView.builder(
              itemCount: tempNog!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SuperDetails.routeName,
                        arguments: {"ngo": tempNog![index], "isExist": false});
                  },
                  child: MySeeNGOCard(
                      img: tempNog![index].ngo_photo,
                      name: tempNog![index].ngo_name,
                      area: tempNog![index].area,
                      desc: tempNog![index].description),
                );
              }),
    );
  }
}
