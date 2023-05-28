import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPhotoTaken extends StatelessWidget {
  final VoidCallback fun;
  final XFile? image;
  final String text;
  const MyPhotoTaken({
    Key? key,
    required this.fun,
    this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: image == null
          ? DottedBorder(
              radius: const Radius.circular(20),
              borderType: BorderType.RRect,
              dashPattern: const [10, 4],
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(text),
                      Icon(
                        Icons.add_a_photo,
                        size: 40,
                      ),
                    ],
                  )),
            )
          : Container(
              height: MediaQuery.of(context).size.height * 0.27,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(80)),
              child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
    );
  }
}
