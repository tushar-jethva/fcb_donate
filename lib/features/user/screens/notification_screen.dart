import 'package:fcb_donate/admin/widgets/custom_row.dart';
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/user/services/user_service.dart';
import 'package:fcb_donate/features/user/widgets/noti_card.dart';
import 'package:fcb_donate/models/receipt_model.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MyNotificationScreen extends StatefulWidget {
  static const routeName = '/noti';
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  UserService userService = UserService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReceipts();
  }

  List<ReceiptModel>? list;
  getReceipts() async {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    print(user.id);
    list = await userService.getAllReceipt(user_id: user.id);
    setState(() {});
    print(list![0].ngo_name);
  }

  openDialog(
      {String? date,
      String? time,
      required bool isAccepted,
      String? ngo_name}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: backgroudColor,
              title: Text("Receipt"),
              content: isAccepted
                  ? SizedBox(
                      height: 310,
                      child: Column(
                        children: [
                          Text(
                            "Your Donation is accepted by $ngo_name they'll comes to your door to pick donation, as per following date and time.",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Gap(10),
                          CustomRowReceipt(left: "Date", right: date!),
                          Gap(10),
                          CustomRowReceipt(left: "Time", right: time!),
                          Gap(10),
                          Text(
                            "For any queries, Please contact NGO!",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Gap(25),
                          Text(
                            "Thank You For Donation",
                            style: TextStyle(color: themeColor),
                          )
                        ],
                      ))
                  : SizedBox(
                      height: 125,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Donation is declined by $ngo_name!",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Gap(10),
                          Text(
                            "For any queries, Please contact NGO!",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Gap(25),
                          Center(
                            child: Text(
                              "Thank You",
                              style: TextStyle(color: themeColor),
                            ),
                          )
                        ],
                      ),
                    ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: themeColor,
            )),
      ),
      body: list == null
          ? const Loader(
              isAdmin: true,
            )
          : ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) {
                if (list![list!.length - index - 1].status == 1) {
                  return InkWell(
                    onTap: () {
                      openDialog(
                          date: list![list!.length - index - 1].date,
                          time: list![list!.length - index - 1].time,
                          isAccepted: true,
                          ngo_name: list![index].ngo_name);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      child: MyNotiCard(
                        isDeclined: false,
                        ngoName: list![list!.length - index - 1].ngo_name,
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      openDialog(
                          isAccepted: false,
                          ngo_name: list![list!.length - index - 1].ngo_name);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      child: MyNotiCard(
                        isDeclined: true,
                        ngoName: list![list!.length - index - 1].ngo_name,
                      ),
                    ),
                  );
                }
              }),
    );
  }
}
