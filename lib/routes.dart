import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:fcb_donate/features/ngo/screen/donation_form.dart';
import 'package:fcb_donate/features/ngo/screen/ngo_detials.dart';

import 'package:fcb_donate/features/user/screens/home_screen.dart';
import 'package:fcb_donate/features/user/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/screens/login.dart';

import 'features/ngo/screen/ngo_list_screen.dart';

import 'models/ngo.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Login.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Login());

    case SignUp.routeName:
      return MaterialPageRoute(
          builder: (_) => const SignUp(), settings: routeSettings);
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
          builder: (_) => DonationForm(ngo: ngo), settings: routeSettings);

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Page not found")),
        ),
      );
  }
}
