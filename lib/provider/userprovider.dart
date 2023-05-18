import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(
      name: '',
      id: '',
      token: '',
      mobile_no: "",
      email: '',
      mobile_alt_no: "",
      address: '',
      type: '',
      accepted: 0,
      declined: 0,
      profilePic: '',
      totalDonation: 0);
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
