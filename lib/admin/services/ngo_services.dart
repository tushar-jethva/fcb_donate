import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../constants/all_constant.dart';
import '../../models/donation.dart';
import '../../models/ngo.dart';
import '../../provider/ngoprovider.dart';

class NgoServices {
  Future<Ngo?> getNgoDetails({
    required BuildContext context,
  }) async {
    Ngo? ngo;
    try {
      http.Response res = await http.get(
        Uri.parse("$url/api/getNgoDetails"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);
        ngo = Ngo.fromMap(map);
        var ngoProvider =
            Provider.of<NgoProvider>(context, listen: false).ngoDetails(ngo);
      }
    } catch (e) {
      print(e);
    }
    return ngo;
  }

  Future<List<Donation>> getDonorsDetails({
    required String id,
  }) async {
    List<Donation>? list = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$url/api/getAllRequests?id=$id"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          list.add(
            Donation.fromJson(
              jsonEncode(
                jsonDecode(res.body)[i],
              ),
            ),
          );
        }
      }
      print(list);
    } catch (e) {
      print(e);
    }
    return list;
  }

  acceptDonation({required String ngoId,}) async {
    try {
      http.Response res = await http.post(Uri.parse("$url/api/acceptDonation"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'ngoId': ngoId}));
      httpErrorHandling(
          res: res,
          onSuccess: () {
            GlobalSnakbar().showSnackbar("Donation Accepted");
          });
    } catch (e) {}
  }
}
