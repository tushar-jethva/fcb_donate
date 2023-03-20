import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(
      name: '',
      id: '',
      token: '',
      mobile_no: -1,
      email: '',
      mobile_alt_no: -1,
      address: '',
      type: '');
  User get user => _user;
  void setUser(User newuser) {
    _user = newuser;
    notifyListeners();
  }
}
