import 'package:fcb_donate/constants/all_constant.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 145, 25, 61),
            Color.fromARGB(255, 33, 13, 119)
          ])),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 182, 170, 66),
                            Color.fromARGB(255, 233, 146, 197)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: const Text("Sindha")),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 172, 192, 192),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: const [
                                    Text(
                                      "Total Donations",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 172, 192, 192),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: const [
                                    Text(
                                      "Accepted",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 172, 192, 192),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Declined",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "5",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Donations",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              itemCount: images.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return Image.network(images[index]['image']);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: constraints.maxWidth * 0.62,
                top: constraints.maxHeight / 6,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
