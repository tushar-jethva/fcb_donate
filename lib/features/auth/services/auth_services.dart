import 'dart:convert';

import 'package:fcb_donate/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants/all_constant.dart';

class AuthServices {
  signUpuser(
      {required String email,
      required String password,
      required name,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(Uri.parse('$url/api/auth/signUp'),
          body:
              jsonEncode({'name': name, 'email': email, 'password': password}));

      // ignore: use_build_context_synchronously
      httpErrorHandling(
          res: res,
          context: context,
          onSuccess: () {
          
            showSnackbar(context, "Sign up Successfully");
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
