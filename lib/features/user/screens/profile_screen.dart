import 'package:fcb_donate/constants/all_constant.dart';
import 'package:fcb_donate/features/auth/services/auth_services.dart';
import 'package:fcb_donate/models/user.dart';
import 'package:fcb_donate/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
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
            actions: [
              IconButton(
                  onPressed: () {
                    AuthServices().logOut(context);
                  },
                  icon: Icon(Icons.logout))
            ],
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
                                  child: Column(children: [
                                    const Text(
                                      "Total Donations",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      user.totalDonation.toString(),
                                      style: const TextStyle(
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
                                  child: Column(children: [
                                    const Text(
                                      "Accepted",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      user.accepted.toString(),
                                      style: const TextStyle(
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
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Declined",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        user.declined.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Donations",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              itemCount: images.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(user.profilePic)),
              ),
              Positioned(
                  right: constraints.maxWidth * 0.20,
                  top: constraints.maxHeight / 4.5,
                  child: Text(user.name)),
            ],
          );
        },
      ),
    );
  }
}
