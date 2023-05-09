import 'package:fcb_donate/admin/screens/home_ngo.dart';
import 'package:fcb_donate/features/auth/screens/first_screen.dart';
import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:fcb_donate/features/ngo/screen/donation_form.dart';
import 'package:fcb_donate/features/ngo/screen/ngo_detials.dart';
import 'package:fcb_donate/features/super_admin/screens/details.dart';

import 'package:fcb_donate/features/user/screens/home_screen.dart';
import 'package:fcb_donate/features/user/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/screens/login.dart';

import 'features/ngo/screen/ngo_list_screen.dart';

import 'features/super_admin/screens/request_screen.dart';
import 'features/super_admin/screens/super_form.dart';
import 'features/user/screens/registrationform.dart';
import 'models/ngo.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case FirstScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const FirstScreen(), settings: routeSettings);
    case Login.routeName:
      final bool user = routeSettings.arguments as bool;
      return MaterialPageRoute(
          builder: (_) => Login(
                user: user,
              ),
          settings: routeSettings);

    case SignUp.routeName:
      final bool user = routeSettings.arguments as bool;
      return MaterialPageRoute(
          builder: (_) => SignUp(
                user: user,
              ),
          settings: routeSettings);
    case NgoListScreen.routeName:
      List<Ngo> ngos = routeSettings.arguments as List<Ngo>;
      return MaterialPageRoute(
          builder: (_) => NgoListScreen(
                ngos: ngos,
              ),
          settings: routeSettings);

    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const HomeScreen(), settings: routeSettings);

    case ProfileScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const ProfileScreen(), settings: routeSettings);
    case NgoDetailScreen.routeName:
      Ngo ngo = routeSettings.arguments as Ngo;
      return MaterialPageRoute(
          builder: (_) => NgoDetailScreen(
                ngo: ngo,
              ),
          settings: routeSettings);

    case DonationForm.routeName:
      Ngo ngo = routeSettings.arguments as Ngo;
      return MaterialPageRoute(
          builder: (_) => DonationForm(
                ngo: ngo,
              ),
          settings: routeSettings);

    case AdminForm.routeName:
      return MaterialPageRoute(
          builder: (_) => const AdminForm(), settings: routeSettings);

    case RequestScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const RequestScreen(), settings: routeSettings);

    case MySuperForm.routeName:
      return MaterialPageRoute(
          builder: (_) => const MySuperForm(), settings: routeSettings);

    case SuperDetails.routeName:
      Map<String, dynamic> data =
          routeSettings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
          builder: (_) => SuperDetails(
                isExist: data['isExist'],
                ngo: data['ngo'],
              ),
          settings: routeSettings);

    case MyHomeNgoAdmin.routeName:
      return MaterialPageRoute(
          builder: (_) => const MyHomeNgoAdmin(), settings: routeSettings);

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Page not found")),
        ),
      );
  }
}
