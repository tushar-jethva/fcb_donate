import 'package:fcb_donate/admin/screens/user_details.dart';
import 'package:fcb_donate/admin/services/ngo_services.dart';
import 'package:fcb_donate/admin/widgets/accept_card.dart';
import 'package:fcb_donate/admin/widgets/request_card.dart';
import 'package:fcb_donate/features/ngo/service/ngo_service.dart';
import 'package:fcb_donate/models/donation.dart';
import 'package:fcb_donate/provider/ngoprovider.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MyCompletedDonation extends StatefulWidget {
  const MyCompletedDonation({super.key});

  @override
  State<MyCompletedDonation> createState() => _MyCompletedDonationState();
}

class _MyCompletedDonationState extends State<MyCompletedDonation> {
  NgoServices ngoService = NgoServices();
  List<Donation>? list;
  @override
  void initState() {
    fetchAllAcceptedDonation();
  }

  fetchAllAcceptedDonation() async {
    var ngo = Provider.of<NgoProvider>(context, listen: false).ngo;
    list = await ngoService.fetchAcceptedDonation(
      ngoId: ngo.id,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var ngo = Provider.of<NgoProvider>(context, listen: false).ngo;
    return Scaffold(
      body: list == null
          ? const Loader(
              isAdmin: true,
            )
          : GridView.builder(
              itemCount: list!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => MyUserDetails(
                              ngo: ngo,
                              donation: list![index],
                              isCompleted: true,
                            )));
                  },
                  child: MyAcceptedCard(
                    name: list![index].userName,
                    address: list![index].address,
                    image: list![index].images[0],
                  ),
                );
              }),
    );
  }
}
