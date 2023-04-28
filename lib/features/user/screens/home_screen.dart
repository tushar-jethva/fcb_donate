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
    {"icon": "assets/food-delivery.png"}
  ];

  List<Map<String, dynamic>> list = [
    {
      "text": "Books",
      "image": const AssetImage("assets/books.jpeg"),
    },
    {
      "text": "Clothes",
      "image": const AssetImage("assets/clothes.jpeg"),
    },
    {
      "text": "Food",
      "image": const AssetImage("assets/food.jpg"),
    }
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

  void navigateToNGO(String name) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => MyNGOScreen(
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
                      onTap: dark,
                      child: MyContainerImage(
                        widget: isBright
                            ? const Icon(
                                Icons.nights_stay_outlined,
                                color: Colors.teal,
                              )
                            : const Icon(
                                Icons.sunny,
                                color: Colors.teal,
                              ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      },
                      child: const MyContainerImage(
                        widget: Icon(
                          Icons.person,
                          color: Colors.teal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 200,
                  height: 160,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/building.png"),
                    ),
                  ),
                  child: const Text(""),
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
                        iconColor: Colors.teal,
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
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(1),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => navigateToNGO(icons[index]["icon"]),
                        child: MyDonate(
                          text: list[index]["text"],
                          image: list[index]['image'],
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
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: Colors.teal,
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
