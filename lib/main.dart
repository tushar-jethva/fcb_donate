import 'package:fcb_donate/admin/screens/completed.dart';
import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/auth/screens/first_screen.dart';
import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:fcb_donate/features/auth/services/auth_services.dart';
import 'package:fcb_donate/features/super_admin/screens/super_admin_screen.dart';
import 'package:fcb_donate/provider/ngoprovider.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/routes.dart';
import 'package:fcb_donate/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'admin/screens/home_ngo.dart';
import 'features/user/screens/home_screen.dart';

void main() {
  //hi i am tushargit branch

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NgoProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: GlobalSnakbar.key,
      debugShowCheckedModeBanner: false,
      title: 'FBC',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 244, 244, 244),
        appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 244, 244, 244),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87)),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            titleSmall: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: const SplashScreen(),
     
    );
  }
}
