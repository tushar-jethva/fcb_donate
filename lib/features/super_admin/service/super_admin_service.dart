import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:fcb_donate/constants/all_constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../models/ngo.dart';
import '../../../models/tusharmodel.dart';

class SuperService {
  Future<String> storageNgoImage(XFile image, String name) async {
    print(name);
    print(image.toString());
    final cloudnary = CloudinaryPublic('dc6k93vnd', 'nu3xzh53');

    CloudinaryResponse res = await cloudnary
        .uploadFile(CloudinaryFile.fromFile(image.path, folder: name));
    print(res.secureUrl);
    return res.secureUrl;
  }
//addNgo

  addNgo({required Ngo ngo, required BuildContext context}) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$url/api/addNgo"),
        headers: {"Content-type": "application/json;charset=UTF-8"},
        body: jsonEncode(
          ngo.toMap(),
        ),
      );
      httpErrorHandling(
          res: res,
          onSuccess: () {
            GlobalSnakbar().showSnackbar("Ngo Add Successfully");
            Navigator.pop(context);
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
  }

  fetchNgos() async {
    try {} catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
  }

  Future<List<Ngo>> fetchAllNgo() async {
    List<Ngo> allNgo = [];
    try {
      http.Response res = await http.get(Uri.parse("$url/api/getAllNgo"),
          headers: {"Content-type": "application/json;charset=UTF-8"});

      httpErrorHandling(
          res: res,
          onSuccess: () {
            print(res.body);
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              allNgo.add(Ngo.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
      print(e.toString());
    }
    return allNgo;
  }

//Decline Temp Ngo
  declineNgo(String id) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$url/api/declineNgo"),
        headers: {"Content-type": "application/json;charset=UTF-8"},
        body: jsonEncode({"id": id}),
      );
      GlobalSnakbar().showSnackbar(jsonDecode(res.body)['msg']);
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
  }

  deleteNgo(String id) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$url/api/deleteNgo"),
        headers: {"Content-type": "application/json;charset=UTF-8"},
        body: jsonEncode({"id": id}),
      );
      // httpErrorHandling(
      //     res: res,
      //     onSuccess: () {
      //       GlobalSnakbar().showSnackbar("Ngo deleted Successfully");
      //     });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
      print(e.toString());
    }
  }

  Future<List<Ngo>> fetchRequestedNgo() async {
    List<Ngo> allNgo = [];
    try {
      http.Response res = await http.get(Uri.parse("$url/api/getAllTempNgo"),
          headers: {"Content-type": "application/json;charset=UTF-8"});

      httpErrorHandling(
          res: res,
          onSuccess: () {
            print(res);
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              allNgo.add(Ngo.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
      print(e.toString());
    }
    return allNgo;
  }

  //add Temp ngo
  addTempNgo({required Ngo ngo, required BuildContext context}) async {
    try {
      print(ngo.toMap());
      http.Response res = await http.post(Uri.parse("$url/api/addNgoTemp"),
          headers: {"Content-type": "application/json;charset=UTF-8"},
          body: ngo.toJson());
      httpErrorHandling(
          res: res,
          onSuccess: () {
            print(res.body);
            GlobalSnakbar().showSnackbar("Ngo Add Successfully");
            Navigator.pop(context);
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
      print(e.toString());
    }
  }
}
