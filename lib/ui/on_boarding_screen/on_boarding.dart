import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/on_boarding_screen/widgets/page_contents.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                PageContent(
                  AppImages.screen1,
                  "Spend & Save With Spare",
                  "With spare,you can for bills, food, entertainment, utilities and still save",
                  1,
                  imgHeight: height * (288 / 812),
                  imgWidth: width * (300 / 375),
                  blueDot: AppImages.blueDot,
                  greyDot: AppImages.greyDot,
                ),
                PageContent(
                  AppImages.screen2,
                  "Spare Is Easy & Secure",
                  "spare is easy to use and all your transactions are secured",
                  2,
                  imgHeight: height * (230 / 812),
                  imgWidth: width * (282 / 375),
                  blueDot: AppImages.blueDot,
                  greyDot: AppImages.greyDot,
                ),
                PageContent(
                  AppImages.screen3,
                  "Send Money With Spare",
                  "Transfer money easily to friends and families on your contact list using spare",
                  3,
                  imgHeight: height * (328 / 812),
                  imgWidth: width * (240 / 375),
                  blueDot: AppImages.blueDot,
                  greyDot: AppImages.greyDot,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * (124 / 812),
          ),
          Container(
            width: double.infinity,
            height: height*(46/812),
            margin: EdgeInsets.only(left: width*(24/375),right: width*(24/375),bottom: height*(68/812)),
            child: ElevatedButton(

                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.C_407AFF),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                )),
          )
        ],
      ),
    );
  }
}
