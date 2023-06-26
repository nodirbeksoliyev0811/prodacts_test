import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:n8_default_project/ui/login_screen.dart';
import 'package:n8_default_project/ui/products/global_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../local/storage_repository.dart';
import '../models/list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggined = false;
  List<String> favorites=[];

  Future<void> _init() async {
    isLoggined = StorageRepository.getBool("is_login");
    favorites=StorageRepository.getList("favorites");
  }


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
                itemCount: productModels.length,
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
                          return GlobalScreen(index: index,);
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
                            Stack(
                              children: [
                                Image.asset(
                                  productModels[index].img,
                                  width: 150,
                                  height: 150,
                                ),
                                Positioned(
                                  right: 0,
                                  child: LikeButton(
                                    onTap: (isLiked) async {
                                      setState(() {

                                      });
                                      favorites.add(index.toString());
                                      _saveList("favorites", favorites);
                                      if(isLiked){
                                         productModels[index].isLike=false;
                                      }
                                      else{
                                        productModels[index].isLike=true;
                                      };
                                    },
                                    likeBuilder: (isLiked) {
                                      return Icon(
                                        Icons.favorite,
                                        color:
                                        productModels[index].isLike ? Colors.redAccent : Colors.grey,
                                      );
                                    },
                                  ),
                                ),
                              ],
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
                                    text: productModels[index].title,
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
                                    text: productModels[index].skidka,
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
                            Text(productModels[index].price,
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
  _saveList(String key,List<String> list)async{
    await StorageRepository.putList(key, list);
  }
}
