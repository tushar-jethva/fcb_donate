import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/admin/screens/admin_screen.dart';
import 'package:fcb_donate/features/auth/screens/login.dart';
import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:fcb_donate/features/auth/services/auth_services.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:fcb_donate/routes.dart';
import 'package:fcb_donate/features/user/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          // brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => generateRoutes(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const BottomNavBar()
                : const AdminScreen()
            : const SignUp());
  }
}
