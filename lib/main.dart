import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/admin/screens/admin_screen.dart';

import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:fcb_donate/features/auth/services/auth_services.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/routes.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/user/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  AuthServices services = AuthServices();
  @override
  void initState() {
    services.getUserData(context: context);
    super.initState();
  }

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
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              titleMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              titleSmall: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ),
        onGenerateRoute: (settings) => generateRoutes(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const HomeScreen()
                : const AdminScreen()
            : const SignUp());
  }
}
