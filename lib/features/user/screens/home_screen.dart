import 'package:fcb_donate/constants/colors.dart';
import 'package:fcb_donate/features/user/screens/notification_screen.dart';
import 'package:fcb_donate/features/user/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

import '../../../utils/container_image.dart';
import '../../../utils/donate.dart';
import '../../../utils/donors.dart';
import '../../ngo/screen/ngo_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isBright = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController;
  }

  List<Map<String, dynamic>> icons = [
    {
      "icon": "assets/book-stack.png",
    },
    {"icon": "assets/clean-clothes.png"},
    {"icon": "assets/food-delivery.png"},
    {"icon": "assets/food-delivery.png"}
  ];

  List<Map<String, dynamic>> list = [
    {
      "text": "Books",
      "image": "assets/nb.png",
    },
    {
      "text": "Clothes",
      "image": "assets/nc.png",
    },
    {
      "text": "Food",
      "image": "assets/nf.png",
    },
    {
      "text": "Money",
      "image": "assets/nm.png",
    },
  ];

  List<Map<String, dynamic>> list2 = [
    {
      "text": "Mr.Ram",
      "image": "assets/ram.jpg",
      "desc": "Till today he donated 30+ books"
    },
    {
      "text": "Mr.Jethva",
      "image": "assets/jethva.jpeg",
      "desc": "He served seva to 5+ NGOs"
    },
    {
      "text": "Mr.Unadakat",
      "image": "assets/undadkat.jpeg",
      "desc": "Clothes donated to different NGOs by him."
    },
    {
      "text": "Mr.Pandya",
      "image": "assets/pandya.jpeg",
      "desc": "Every weekend food donated by him."
    }
  ];

  void dark() {
    if (isBright) {
      setState(() {
        isBright = false;
      });
    } else {
      setState(() {
        isBright = true;
      });
    }
  }

  void navigateToNGO(String name, String type) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => MyNGOScreen(
              type: type,
              imgUrl: name,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyNotificationScreen.routeName);
                      },
                      child: MyContainerImage(
                          widget: Icon(
                        Icons.notifications,
                        color: themeColor,
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      },
                      child: const MyContainerImage(
                        widget: Icon(
                          Icons.person,
                          color: themeColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(
                    "assets/logo.png",
                  ),
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(135, 222, 222, 222),
                            blurRadius: 0.01)
                      ]),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.black87),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        iconColor: themeColor,
                        border: InputBorder.none,
                        hintText: "Search NGO's...",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              const Gap(25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Donate",
                  style: TextStyle(
                      color: themeColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(1),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => navigateToNGO(list[index]["image"],
                            list[index]['text'].toString().toLowerCase()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset(
                            list[index]['image'],
                            height: 70,
                            width: 85,
                          ),
                        ),
                      );
                    }),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Donors",
                      style: TextStyle(
                          color: themeColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: themeColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Gap(15),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list2.length,
                    itemBuilder: (context, index) {
                      return MyDonors(
                        text: list2[index]["text"],
                        image: list2[index]["image"],
                        desc: list2[index]["desc"],
                      );
                    }),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
