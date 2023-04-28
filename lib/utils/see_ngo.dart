// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySeeNGOCard extends StatelessWidget {
  final String img;
  final String name;
  final String area;
  final String desc;
  const MySeeNGOCard({
    Key? key,
    required this.img,
    required this.name,
    required this.area,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: size.height * 0.30,
      width: size.width * 0.40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
          color: Colors.amberAccent),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.2)
          ], stops: const [
            0.2,
            0.9
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                area,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Color.fromARGB(255, 244, 244, 244),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                desc,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey, fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
