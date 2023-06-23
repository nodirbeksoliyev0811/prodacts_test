import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/login_screen.dart';
import 'package:n8_default_project/ui/products/airpods.dart';
import 'package:n8_default_project/ui/products/iphone.dart';
import 'package:n8_default_project/ui/products/keyboard.dart';
import 'package:n8_default_project/ui/products/komp.dart';
import 'package:n8_default_project/ui/products/mac.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../local/storage_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggined = false;
  List<dynamic> screens = [
    AirpodsScreen(),
    IphoneScreen(),
    Keyboard(),
    Mac(),
    Komp(),
    Spacer()
  ];

  Future<void> _init() async {
    isLoggined = StorageRepository.getBool("is_login");
  }

  List<String> images = [
    "assets/images/airpods.png",
    "assets/images/iphone.png",
    "assets/images/keyboard_mouse.png",
    "assets/images/mac.png",
    "assets/images/pc.png",
    "assets/images/speaker.png",
  ];

  List<String> titles = [
    "Airpods",
    "Iphone",
    "Klaviatura va sichqoncha",
    "Mac",
    "Kompyuter",
    "Speaker",
  ];

  List<String> price = [
    "340000.0",
    "12340000.0",
    "200000.0",
    "13000000.0",
    "100000.0",
    "50000.0",
  ];

  List<String> skidka = [
    "339000.0",
    "12290000.0",
    "199999.0",
    "12999999.0",
    "99999.0",
    "49000.0",
  ];

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Products",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      if (!isLoggined) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return screens[index];
                        }));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.deepPurple),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              images[index],
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Nomi - ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: titles[index],
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Narxi - ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: skidka[index],
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "so'm",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(price[index],
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
