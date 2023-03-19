import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/screens/login.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Login.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Login());

    case SignUp.routeName:
      return MaterialPageRoute(
          builder: (_) => SignUp(), settings: routeSettings);
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Page not found")),
        ),
      );
  }
}
