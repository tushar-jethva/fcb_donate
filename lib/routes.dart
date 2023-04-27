import 'package:fcb_donate/features/auth/screens/signup_screen.dart';

import 'package:fcb_donate/features/user/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/screens/login.dart';
import 'features/user/screens/donation_screen.dart';
import 'features/user/screens/ngo_screen.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Login.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Login());

    case SignUp.routeName:
      return MaterialPageRoute(
          builder: (_) => const SignUp(), settings: routeSettings);

    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const HomeScreen(), settings: routeSettings);

    case NgoScreen.routeName:
      Map<String, dynamic> data =
          routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (_) => NgoScreen(
                data: data,
              ),
          settings: routeSettings);

    case DonationScreen.routeName:
      // Map<String, dynamic> data =
      //     routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (_) => DonationScreen(), settings: routeSettings);
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Page not found")),
        ),
      );
  }
}
