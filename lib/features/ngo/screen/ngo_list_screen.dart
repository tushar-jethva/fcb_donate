import 'package:fcb_donate/features/ngo/screen/ngo_detials.dart';
import 'package:fcb_donate/utils/see_ngo.dart';
import 'package:flutter/material.dart';
import '../../../models/ngo.dart';
import '../../../utils/ngo_details_card.dart';

// ignore: must_be_immutable
class NgoListScreen extends StatefulWidget {
  static const routeName = '/details';
  List<Ngo> ngos;
  NgoListScreen({super.key, required this.ngos});

  @override
  State<NgoListScreen> createState() => _NgoListScreenState();
}

class _NgoListScreenState extends State<NgoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                widget.ngos[0].city,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.w500),
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
        body: GridView.builder(
            itemCount: widget.ngos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NgoDetailScreen.routeName,
                    arguments: widget.ngos[index]
                  );
                },
                child: NgoDetailsCard(
                  img: widget.ngos[index].image!,
                  name: widget.ngos[index].ngo_name,
                  area: widget.ngos[index].area,
                ),
              );
            },),);
  }
}
