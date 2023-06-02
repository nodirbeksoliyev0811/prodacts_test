import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/splash/splash_screen2.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _navigateToWelcomeScreen(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.C_407AFF,
      appBar: AppBar(
        backgroundColor: AppColors.C_407AFF,
        toolbarHeight: 0,
      ),
      body: Center(
        child: Image.asset(AppImages.logo,width: width*(96/375),height: height*(132/812),),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return  const SplashScreen2();
          },
        ),
      );
    });
  }
}
