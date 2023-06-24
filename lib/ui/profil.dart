import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/tab_box.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          "Profil",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 29,),
              Text(
                "User: ${StorageRepository.getString("name")}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(isVisible?
                    "Password: ${StorageRepository.getString("last_name")}":"Password: ******",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      isVisible=!isVisible;
                    });
                  }, icon: Icon(isVisible?Icons.visibility_off:Icons.visibility))
                ],
              ),
              const SizedBox(height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          _deleteString("name");
                          _deleteString("last_name");
                          _saveBool("is_login");
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const TabBox();
                        }));
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        color: Colors.blueAccent,
                        child: const Center(
                          child: Text(
                            "Log out",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _saveBool(String key) async {
    await StorageRepository.putBool(key, false);
  }

  _deleteString(String key)async{
    await StorageRepository.deleteString(key);
  }
}
