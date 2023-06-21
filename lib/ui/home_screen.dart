import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/app_routs.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  Future<void> _init() async {
    _nameController.text = StorageRepository.getString("name");
    _lastNameController.text = StorageRepository.getString("last_name");
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: Colors.white),
              child: TextField(
                controller: _nameController,
                cursorHeight: 20,
                cursorWidth: 1.4,
                cursorColor: Colors.black.withOpacity(0.2),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  border: InputBorder.none,
                  hintText: "Name",
                  hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontFamily: "Poppins",
                      letterSpacing: 0.2),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: Colors.white),
              child: TextField(
                controller: _lastNameController,
                cursorHeight: 20,
                cursorWidth: 1.4,
                cursorColor: Colors.black.withOpacity(0.2),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  border: InputBorder.none,
                  hintText: "Surname",
                  hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontFamily: "Poppins",
                      letterSpacing: 0.2),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ZoomTapAnimation(
              child: Text(
                "Go Second Page",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                setState(() {
                  _saveString("name", _nameController.text);
                  _saveString("last_name", _lastNameController.text);
                  _init();
                });
                if (_nameController.text.isEmpty ||
                    _lastNameController.text.isEmpty) {
                  ScaffoldMessenger
                      .of(context)
                      .showSnackBar(SnackBar(
                    backgroundColor: Colors.blueAccent,
                      content: Text("Fill empty field",
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black))));
                      }else {
                      Navigator.pushNamed(context, RoutNames.secondScreen,
                      arguments: <String, String>{
                      "name_text": _nameController.text,
                      "last_name_text": _lastNameController.text
                      });
                      }
                  },
            )
          ],
        ),
      ),
    );
  }

  _saveString(String key, String value) async {
    await StorageRepository.putString(key, value);
  }
}
