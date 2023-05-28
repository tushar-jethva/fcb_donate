
import 'package:flutter/material.dart';

import '../../../constants/all_constant.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.40,
                        width: size.width * 0.50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(images[index]['image']),
                          ),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 60,
                    width: size.width * 0.50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Name:${images[index]['name']}',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Location: ${images[index]['location']}",
                            overflow: TextOverflow.ellipsis,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
