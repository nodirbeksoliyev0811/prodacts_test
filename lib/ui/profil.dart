import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/home_screen.dart';
import 'package:n8_default_project/ui/tab_box.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Profil",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 29,),
            Text(
              "User: ${StorageRepository.getString("name")}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
            Text(
              "Password: ${StorageRepository.getString("last_name")}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 200,),
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
                        return TabBox();
                      }));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.blueAccent,
                      child: Center(
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
    );
  }

  _saveBool(String key) async {
    await StorageRepository.putBool(key, false);
  }

  _deleteString(String key)async{
    await StorageRepository.deleteString(key);
  }
}
