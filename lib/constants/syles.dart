import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColor {
  static const Color blue = Color(0xff0666EB);
  static const Color lightBlue = Color(0xffE2EFFD);
  static const Color lightGrey = Color(0xffE1E1E1);
  static const Color grey = Color(0xff8e8e8e);
  static const Color grey2 = Color.fromARGB(255, 66, 66, 66);
  static const Color black = Color(0xff000000);
  static const Color primaryColor_2 = Color(0xff5DB1DF);
  static const Color backgroundcolor = Color(0xffF8F9FD);
  static const Color primaryColor = Color(0xffe74c3c);
  static const Color secondColor = Color(0xffc0392b);
  static const Color fourthColor = Color(0xff0d3056);
  static const Color thirdColor = Color.fromARGB(255, 255, 179, 170);
  static Color homePageBackground = const Color(0xFFfbfcff);
  static Color gradientFirst = const Color(0xff0f17ad);
  static Color gradientSecond = const Color(0xFF6985e8);
  static Color homePageTitle = const Color(0xFF302f51);
  static Color homePageSubtitle = const Color(0xFF414160);
  static Color homePageDetail = const Color(0xFF6588f4);
  static Color homePageIcons = const Color(0xFF3b3c5c);
  static Color homePageContainerTextSmall = const Color(0xFFf4f5fd);
  static Color homePageContainerTextBig = const Color(0xFFffffff);
  static Color homePagePlanColor = const Color(0xFFa2a2b1);
  static Color secondPageTopIconColor = const Color(0xFFb7bce8);
  static Color secondPageTitleColor = const Color(0xFFfefeff);
  static Color secondPageContainerGradient1stColor = const Color(0xFF5564d8);
  static Color secondPageContainerGradient2ndColor = const Color(0xFF6279dc);
  static Color secondPageIconColor = const Color(0xFFfafafe);
  static Color loopColor = const Color(0xFF6d8dea);
  static Color setsColor = const Color(0xFF9999a9);
  static Color circuitsColor = const Color(0xFF2f2f51);
  static Color appBarColor = const Color(0xFF6D71F9);
  static Color appbarIconColor = const Color(0xFF6279dc);
  static const Color mainBlue = Color(0xFF247CFF);
  static const Color gray = Color(0xFF757575);
}

class AppDesign {
  static TextStyle cardName = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle cardDescription = TextStyle(
    color: Colors.white.withOpacity(0.7),
    height: 1.6,
    fontStyle: FontStyle.italic,
  );
  static TextStyle listCardInf = TextStyle(
      color: AppColor.gradientFirst.withOpacity(0.9),
      height: 1.6,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300);
  static TextStyle listCardInf2 = TextStyle(
    color: Colors.black.withOpacity(0.6),
    height: 1.6,
    fontStyle: FontStyle.italic,
  );
  static TextStyle listCardName = TextStyle(
      color: AppColor.gradientFirst.withOpacity(0.8),
      fontSize: 16,
      fontWeight: FontWeight.w800);
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.mainBlue,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.gray,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

class TextStyles {
  static TextStyle font24Black700Weight = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColor.mainBlue,
  );

  static TextStyle font13GrayRegular = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColor.gray,
  );

  static TextStyle font16WhiteSemiBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
