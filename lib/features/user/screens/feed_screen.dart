import 'package:flutter/material.dart';

import '../../../constants/all_constant.dart';
import '../widgets/feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 120),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 64, 47, 139),
                  Color.fromARGB(255, 38, 179, 189)
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  width: 300,
                  child: FeedCard(
                    image: images[index]['image'],
                    name: images[index]['name'],
                  ),
                );
              }),
        ));
  }
}
