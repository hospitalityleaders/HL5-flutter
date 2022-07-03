import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'SourceSansPro',
  primaryColor: Cr.colorPrimary,
  brightness: Brightness.light,
  cardColor: Colors.white,
  // focusColor: Cr.focusColor,
  // hintColor: Cr.hintColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Cr.backgroundColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.black,
      textStyle: const TextStyle(color: Colors.black),
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.white),
    headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: Di.FSD),
    headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: Di.FSD),
    headline3: TextStyle(fontWeight: FontWeight.w500, fontSize: Di.FSD),
    headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: Di.FSD),
    headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: Di.FSD),
    headline6: TextStyle(fontWeight: FontWeight.w800, fontSize: Di.FSD),
    caption: TextStyle(fontWeight: FontWeight.w900, fontSize: Di.FSD),
    subtitle1: TextStyle(fontSize: Di.FSD, fontWeight: FontWeight.w500),
    bodyText2: TextStyle(fontSize: Di.FSS),
    bodyText1: TextStyle(fontSize: Di.FSD, fontWeight: FontWeight.w600),
  ),
);
