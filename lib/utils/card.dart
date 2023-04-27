import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class NGOCard extends StatelessWidget {
  final AssetImage image;
  const NGOCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 61, 90, 254),
              Color.fromARGB(255, 62, 91, 252),
              Color.fromARGB(255, 97, 121, 255),
              Color.fromARGB(255, 121, 140, 250),
              Color.fromARGB(255, 143, 160, 252)
            ], stops: [
              0.2,
              0.4,
              0.79,
              0.9,
              1.0
            ]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: image, fit: BoxFit.cover),
              ),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Text(
                  "Ram NGO",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(5),
                Text("Bhavnagar",
                    style: Theme.of(context).textTheme.titleMedium),
                const Gap(5),
                Text("VrudhaShram",
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            )
          ],
        ),
      ),
    );
  }
}
