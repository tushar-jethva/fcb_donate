import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/super_admin/screens/request_screen.dart';
import 'package:fcb_donate/features/super_admin/screens/super_admin_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MySuperBottomBar extends StatefulWidget {
  static const routeName = "bottomSuper";
  const MySuperBottomBar({super.key});

  @override
  State<MySuperBottomBar> createState() => _MySuperBottomBarState();
}

class _MySuperBottomBarState extends State<MySuperBottomBar> {
  int _currentPage = 0;
  List<Widget> screen = [
    SuperAdminScreen(),
    RequestScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          selectedItemColor: themeColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.request_page), label: "Requests")
          ]),
    );
  }
}
