import 'dart:convert';

import 'package:fcb_donate/constants/all_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/ngo.dart';

class NgoService {
  Future<List<Ngo>> getNgoByCity(String city, BuildContext context) async {
    List<Ngo> ngos = [];
    try {
      http.Response res =
          await http.get(Uri.parse("$url/api/getNgoByCity?city=$city"));
      // ignore: use_build_context_synchronously
      httpErrorHandling(
          res: res,
          context: context,
          onSuccess: () {
            print(res.body);
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
}
