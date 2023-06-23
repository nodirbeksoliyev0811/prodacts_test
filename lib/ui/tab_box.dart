import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/changed.dart';
import 'package:n8_default_project/ui/home_screen.dart';
import 'package:n8_default_project/ui/magazin.dart';
import 'package:n8_default_project/ui/profil.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {



  int currentScreenIndex=0;
  List<dynamic> screens=[
    HomeScreen(),
    MarketScreen(),
    ChangedScreen(),
    ProfilScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
        child: BottomNavigationBar(
          backgroundColor: Colors.blueAccent,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              currentScreenIndex=index;
            });
          },
          currentIndex: currentScreenIndex,
          selectedItemColor: Colors.yellowAccent,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.yellowAccent),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person,),label: ""),
          ],
        ),
      ),
    );
  }
}
