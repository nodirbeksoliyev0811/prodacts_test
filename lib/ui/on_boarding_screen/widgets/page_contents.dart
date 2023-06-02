import 'package:flutter/material.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

class PageContent extends StatelessWidget {
  const PageContent(this.image, this.title, this.subtitle, this.pageNum,
      {super.key, required this.imgHeight, required this.imgWidth, required this.blueDot, required this.greyDot});

  final String image;
  final String title;
  final String subtitle;
  final int pageNum;
  final double imgHeight;
  final double imgWidth;
  final String blueDot;
  final String greyDot;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    double fontSizeTitle=0;
    double fontSizeSubtitle=0;
    if(height>400 && height<600){
      fontSizeTitle=18;
    }else if (height>600 && height<800){
      fontSizeTitle=24;
    }else{
      fontSizeTitle=40;
    }
    if(height>400 && height<600){
      fontSizeSubtitle=6;
    }else if (height>600 && height<800){
      fontSizeSubtitle=14;
    }else{
      fontSizeSubtitle=20;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          image,
          width: imgWidth,
          height: imgHeight,
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyle(
              fontFamily: "Inter",
              // fontSize: height>400?height<600?20:height<1200?24:28:18,
              fontSize: fontSizeTitle,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
        ),
        Container(
          margin: const EdgeInsets.only(top: 18),
          width: width*(192/375),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                // fontSize: height>400?height<600?12:height<1200?14:16:10,
                fontSize: fontSizeSubtitle,
                color: AppColors.C_87898E,
                fontFamily: "Inter"),
          )
          ),
        Container(
          margin: EdgeInsets.only(top:width*(20/812)),
          width: width*(48/375),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(pageNum==1?blueDot:greyDot),
              SvgPicture.asset(pageNum==2?blueDot:greyDot),
              SvgPicture.asset(pageNum==3?blueDot:greyDot),
            ],
          ),
        ),

      ],
    );
  }
}
