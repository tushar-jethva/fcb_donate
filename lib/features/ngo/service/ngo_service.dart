import 'dart:convert';
import 'dart:io';

import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/user/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/donation.dart';
import '../../../models/ngo.dart';

class NgoService {
  Future<List<Ngo>> getNgoByCity(
      {required String city, required String type}) async {
    List<Ngo> ngos = [];
    try {
      http.Response res = await http
          .get(Uri.parse("$url/api/getNgoByCity?city=$city&type=$type"));

      httpErrorHandling(
          res: res,
          onSuccess: () {
            print(res);
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              ngos.add(
                Ngo.fromJson(
                  jsonEncode(jsonDecode(res.body)[i]),
                ),
              );
            }
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
    return ngos;
  }

  Future<List<String>> getImagesUrl(
      {required List<XFile?> images, required String name}) async {
    List<String> imageUrl = [];
    final cloudnary = CloudinaryPublic('dc6k93vnd', 'nu3xzh53');
    for (int i = 0; i < images.length; i++) {
      CloudinaryResponse res = await cloudnary
          .uploadFile(CloudinaryFile.fromFile(images[i]!.path, folder: name));
      imageUrl.add(res.secureUrl);
    }
    return imageUrl;
  }

  postDonation(Donation donation, BuildContext context) async {
    try {
      http.Response res = await http.post(Uri.parse("$url/api/postDonation"),
          headers: {"Content-type": "application/json;charset=UTF-8"},
          body: jsonEncode(donation.toMap()));

      httpErrorHandling(
          res: res,
          onSuccess: () {
            GlobalSnakbar().showSnackbar("Donation successfully");
            Navigator.pop(context);
          });
     // ignore: use_build_context_synchronously
     await UserService().getTotalDonation(donation.userId, context);
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
  }
}
