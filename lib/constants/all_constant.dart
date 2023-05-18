import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

String url = "https://fcb-donation.onrender.com";
// String url = "http://192.168.191.230:3000";

class GlobalSnakbar {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();
  showSnackbar(String data) {
    key.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(data)));
  }
}

httpErrorHandling(
    {required http.Response res, required VoidCallback onSuccess}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      GlobalSnakbar().showSnackbar(jsonDecode(res.body)['msg']);
      break;
    case 500:
      GlobalSnakbar().showSnackbar(jsonDecode(res.body)['error']);
      break;

    default:
      GlobalSnakbar().showSnackbar(jsonDecode(res.body));
  }
}

Future<List<XFile?>> pickMultiImage() async {
  List<XFile?> images = await ImagePicker().pickMultiImage(imageQuality: 20);
  return images;
}

Future<XFile?> pickOneImage() async {
  XFile? image = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 20);
  if (image != null) {
    return image;
  }
}

List images = [
  {
    'name': "Bhavnagar Ngo",
    'image':
        "https://img.freepik.com/free-vector/logo-made-with-wavy-human-silhouettes_1025-394.jpg",
    'location': "bhavnagar",
  },
  {
    'name': "Akshay patra",
    'image':
        "https://www.shutterstock.com/image-vector/ngo-logo-symbol-design-template-260nw-1618830400.jpg",
    'location': "bhavnagar",
  },
  {
    'name': "Life Ngo",
    'image':
        "https://img.freepik.com/free-vector/gradient-culture-logo-template_52683-100258.jpg?w=2000",
    'location': "bhavnagar",
  },
  {
    'name': "Grow Ngo",
    'image':
        "https://www.shutterstock.com/image-vector/ngo-logo-children-foundation-organization-260nw-1516420154.jpg",
    'location': "bhavnagar",
  },
  {
    'name': "Human Ngo",
    'image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSixxLdbDR10cUyWmcgJQOhQi5rujqCGKuFmA&usqp=CAU",
    'location': "bhavnagar",
  }
];

List type = ["books", "clothes", "money", "food"];
