
import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home_screen.dart';
import 'package:n8_default_project/ui/login_screen.dart';
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
        return MaterialPageRoute(builder: (context) => LoginScreen());

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
