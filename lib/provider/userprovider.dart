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
      type: '');
  User get user => _user;
  void setUser(User newuser) {
    _user = newuser;
    notifyListeners();
  }
}
