import 'package:fcb_donate/admin/screens/completed.dart';
import 'package:fcb_donate/admin/screens/home_ngo.dart';
import 'package:fcb_donate/admin/screens/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});
  static const routeName = '/bottom';
  @override
  State<MyBottomBar> createState() => _MyBottomBar();
}

class _MyBottomBar extends State<MyBottomBar> {
  int currentIndex = 0;
  List<Widget> list = const [
    MyHomeNgoAdmin(),
    MyRequestPage(),
    MyCompletedDonation(),
  ];

  void currentPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: list[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: currentPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), tooltip: "Home", label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.request_page),
                tooltip: "Requests",
                label: "Requests"),
            BottomNavigationBarItem(
                icon: Icon(Icons.face),
                tooltip: "Completed",
                label: "Completed"),
          ]),
    );
  }
}
