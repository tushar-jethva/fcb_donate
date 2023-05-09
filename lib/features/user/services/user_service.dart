import 'dart:convert';

import 'package:fcb_donate/models/donation.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/all_constant.dart';

class UserService {
  getTotalDonation(String id, BuildContext context) async {
    final userPorovider = Provider.of<UserProvider>(context, listen: false);
    http.Response res = await http.get(
        Uri.parse("$url/api/getTotalDonation?id=$id"),
        headers: {'Content-type': 'application/json;charset=UTF-8'});
    int total = jsonDecode(res.body)['totalDonation'];
    userPorovider.setUser(userPorovider.user.copyWith(totalDonation: total));
  }

  Future<List<Donation>> getUserDonations(String id) async {
    List<Donation> userDonations = [];
    try {
      http.Response res = await http.get(
          Uri.parse("$url/api/getUserDonations?id=$id"),
          headers: {'Content-type': 'application/json;charset=UTF-8'});
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          userDonations.add(
            Donation.fromJson(
              jsonEncode(jsonDecode(res.body)[i]),
            ),
            // Donation.fromMap(jsonDecode(res.body)[i]),
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return userDonations;
  }

  userProfileSave(String id,String image, BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$url/api/updateProfilPic"),
        headers: {'Content-type': 'application/json;charset=UTF-8'},
        body: jsonEncode(
          {
            'profilePic': image,
            'id':id
          },
        ),
      );
      httpErrorHandling(
          res: res,
          onSuccess: () {
            String profilePic = jsonDecode(res.body)['profilePic'];
            userProvider
                .setUser(userProvider.user.copyWith(profilePic: profilePic));
          });
    } catch (e) {
      print(e.toString());
    }
  }
}
