import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  String image;
  String name;
  FeedCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Image.network(
                image,
                fit: BoxFit.contain,
                width: 300,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 20,
                  width: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Donate",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
