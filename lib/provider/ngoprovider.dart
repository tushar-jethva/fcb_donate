import 'package:fcb_donate/models/ngo.dart';
import 'package:flutter/material.dart';

class NgoProvider extends ChangeNotifier {
  Ngo _ngo = Ngo(
      id: '',
      username: '',
      password: '',
      ngo_name: '',
      ngo_admin: '',
      city: '',
      area: '',
      state: '',
      description: '',
      mobile_no: '',
      ngo_photo: '',
      website: '',
      payNumber: '',
      regNumber: '',
      regProof: '',
      annualRepo: '');

  Ngo get ngo => _ngo;

   ngoDetails(Ngo ngo) {
    _ngo = ngo;
    notifyListeners();
  }
}
