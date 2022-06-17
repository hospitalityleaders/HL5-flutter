import 'package:flutter/material.dart';

class Cr {
  // Theme Color
  static const Color colorPrimary = Color(0xff384677);
  static const Color darkBlue1 = Color(0xff272E41);

  static const Color darkBlue3 = Color(0xff1D2645);
  static const Color darkBlue5 = Color(0xff2B375E);
  static const Color darkBlue6 = Color(0xff384677);
  static const Color darkBlue8 = Color(0xff7A85A6);
  static const Color darkBlue9 = Color(0xff6C779E);
  static const Color underlineColor = Color(0xFFCCCCCC);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Color(0xff7D90AA);
  static const Color greyLightColor = Colors.white10;
  static const Color greyLightTwoColor = Color(0xffD1D8E1);
  static const Color greyDark = Color(0xff979797);
  static const Color backgroundColor = Color(0xffF7F8FA);

  static const Color accentBlue1 = Color(0xff32A3FD);
  static const Color accentBlue2 = Color(0xff98D1FE);
  static const Color accentBlue3 = Color(0xffCCE8FE);

  static const Color green1 = Color(0xff7DC81B);

// 7DC81B g.

  static const Color grey1 = Color(0xffB5BDC2);

  static const Color darkGrey1 = Color(0xff7C8990);
  static const Color darkGrey2 = Color(0xff879399);

  static const Color lightGrey2 = Color(0xffEDEFF1);

  static const Color redTextColor = Color(0xffFD3732);
  static const Color red1 = Color(0xffFD3732);
  static const Color red3 = Color(0xffFECDCC);

  static const Color transparent = Colors.transparent;

  //
  //

  static const LinearGradient primaryLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [
      Cr.colorPrimary,
      Cr.colorPrimary,
    ],
  );
}
