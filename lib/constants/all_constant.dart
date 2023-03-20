import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = "http://192.168.242.230:3000";

showSnackbar(BuildContext context, String data) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
}

httpErrorHandling(
    {required http.Response res,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(res.body)['message']);
      break;
    case 500:
      showSnackbar(context, jsonDecode(res.body)['error']);
      break;

    default:
      showSnackbar(context, jsonDecode(res.body));
  }
}
