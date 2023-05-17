import 'dart:convert';
import 'package:fcb_donate/admin/bottombar.dart';
import 'package:fcb_donate/admin/screens/home_ngo.dart';
import 'package:fcb_donate/features/auth/screens/first_screen.dart';
import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:fcb_donate/features/super_admin/screens/details.dart';
import 'package:fcb_donate/features/super_admin/screens/super_admin_screen.dart';
import 'package:fcb_donate/features/user/screens/home_screen.dart';
import 'package:fcb_donate/models/ngo.dart';
import 'package:fcb_donate/provider/ngoprovider.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/all_constant.dart';
import '../../../models/user.dart';

class AuthServices {
  signUpuser(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$url/api/auth/signUp'),
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandling(
          res: res,
          onSuccess: () {
            GlobalSnakbar().showSnackbar("Sign up Successfully");
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
  }

  signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(Uri.parse("$url/api/auth/SignIn"),
          body: jsonEncode({'email': email, 'password': password}),
          headers: {'Content-Type': 'application/json;charset=UTF-8'});

      // ignore: use_build_context_synchronously
      httpErrorHandling(
        res: res,
        onSuccess: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('x-auth-token', jsonDecode(res.body)['token']);
          var userProvider =
              // ignore: use_build_context_synchronously
              Provider.of<UserProvider>(context, listen: false);
          userProvider.setUser(User.fromMap(jsonDecode(res.body)));
          // ignore: use_build_context_synchronously
          var map = jsonDecode(res.body);
          userProvider.user.type == 'user'
              ?  Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false)
              :Navigator.pushNamedAndRemoveUntil(
                  context, SuperAdminScreen.routeName, (route) => false);
              
        },
      );
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
  }

  getUserData({required BuildContext context}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');

      if (token == null) {
        pref.setString('x-auth-token', "");
      }
      http.Response res = await http.get(
        Uri.parse("$url/api/isValidToken"),
        headers: {
          'x-auth-token': token!,
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      print(res.body);
      // ignore: use_build_context_synchronously
      httpErrorHandling(
          res: res,
          onSuccess: () async {
            if (jsonDecode(res.body) == true) {
              http.Response userRes = await http.get(
                Uri.parse("$url/api/getUserData"),
                headers: {
                  'x-auth-token': token,
                  'Content-Type': 'application/json;charset=UTF-8'
                },
              );
              var userProvider =

                  // ignore: use_build_context_synchronously
                  Provider.of<UserProvider>(context, listen: false);

              userProvider.setUser(User.fromMap(jsonDecode(userRes.body)));
            }
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
    }
  }

  void logOut(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('x-auth-token', "");
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      context,
      FirstScreen.routeName,
      (route) => false,
    );
  }

  singInNgo(
      {required String username,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(Uri.parse("$url/api/ngoLogin"),
          headers: {'Content-Type': 'application/json;charset=UTF-8'},
          body: jsonEncode({'username': username, 'password': password}));

      httpErrorHandling(
          res: res,
          onSuccess: () {
            print(res.body);
            final ngoProvider =
                Provider.of<NgoProvider>(context, listen: false);
            ngoProvider.ngoDetails(Ngo.fromMap(jsonDecode(res.body)));
            Navigator.pushNamedAndRemoveUntil(
                context, MyBottomBar.routeName, (route) => false);
          });
    } catch (e) {
      GlobalSnakbar().showSnackbar(e.toString());
      print(e.toString());
    }
  }
}
