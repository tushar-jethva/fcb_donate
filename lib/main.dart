import 'package:fcb_donate/features/admin/screens/home_screen.dart';
import 'package:fcb_donate/features/auth/screens/login.dart';
import 'package:fcb_donate/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FBC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => generateRoutes(settings),
        home: Login());
  }
}
