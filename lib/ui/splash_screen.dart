import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_routs.dart';
import 'package:n8_default_project/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToWelcomeScreen(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 0,
      ),
      body: Center(
        child: Text(
          "New Application",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutNames.homeScreen);
    });
  }
}
