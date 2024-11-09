// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/ngo/screen/ngo_detials.dart';
import 'package:fcb_donate/features/user/widgets/search_card.dart';
import 'package:fcb_donate/utils/loader.dart';
import 'package:flutter/material.dart';

import 'package:fcb_donate/features/user/services/user_service.dart';

import '../../../models/ngo.dart';

class SearchResultScreen extends StatefulWidget {
  final String name;
  static const routeName = '/search';
  const SearchResultScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool isData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllSearchProduct();
  }
  

  List<Ngo>? list;
  getAllSearchProduct() async {
    list = await UserService().searchNgo(name: widget.name);
    setState(() {});
    print("list is ${list![5].ngo_name}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
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
      ),
      body: list != null
          ? ListView.builder(
             
              itemCount: list!.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NgoDetailScreen.routeName,
                        arguments: {'ngo': list![index], 'isSearch': true});
                  },
                  child: MySearchCard(
                    url: list![index].ngo_photo,
                    ngo_name: list![index].ngo_name,
                    ngo_number: list![index].mobile_no,
                    ngo_city: list![index].city,
                    ngo_area: list![index].area,
                  ),
                );
              }),
            )
          : Center(
              child: Text("Search result is not Found!"),
            ),
    );
  }
}
