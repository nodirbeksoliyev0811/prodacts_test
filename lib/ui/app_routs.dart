
import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/second_screen.dart';
import 'package:n8_default_project/ui/home_screen.dart';
import 'package:n8_default_project/ui/splash_screen.dart';

class RoutNames {
  static const String splash = "/";
  static const String homeScreen = "/home_screen";
  static const String secondScreen = "/second_screen";
}

class AppRouts {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutNames.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutNames.secondScreen:
        return MaterialPageRoute(builder: (context) {
          Map<String,String> map = settings.arguments as Map<String,String>;

          return SecondScreen(text1: map["name_text"] as String,text2: map["last_name_text"] as String,);
        });

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("Route mavjud emas"),
                  ),
                ));
    }
  }
}
