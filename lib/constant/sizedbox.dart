import 'package:flutter/material.dart';

class SB {
  static SizedBox SH5() => SizedBox(height: 5);
  static SizedBox SH15() => SizedBox(height: 15);
  static SizedBox SH25() => SizedBox(height: 25);
  static SizedBox SH35() => SizedBox(height: 35);
  static SizedBox SH45() => SizedBox(height: 45);
  static SizedBox SH55() => SizedBox(height: 55);
  static SizedBox SH10() => SizedBox(height: 10);
  static SizedBox SH20() => SizedBox(height: 20);
  static SizedBox SH30() => SizedBox(height: 30);
  static SizedBox SH40() => SizedBox(height: 40);
  static SizedBox SH50() => SizedBox(height: 50);
  static SizedBox SH60() => SizedBox(height: 60);
  static SizedBox SW5() => SizedBox(width: 5);
  static SizedBox SW15() => SizedBox(width: 15);
  static SizedBox SW25() => SizedBox(width: 25);
  static SizedBox SW35() => SizedBox(width: 35);
  static SizedBox SW45() => SizedBox(width: 45);
  static SizedBox SW55() => SizedBox(width: 55);
  static SizedBox SW10() => SizedBox(width: 10);
  static SizedBox SW20() => SizedBox(width: 20);
  static SizedBox SW30() => SizedBox(width: 30);
  static SizedBox SW40() => SizedBox(width: 40);
  static SizedBox SW50() => SizedBox(width: 50);
  static SizedBox SW60() => SizedBox(width: 60);
}

class SS {
  static SizedBox sB(double h, double w) => SizedBox(height: h, width: w);

  static sH(BuildContext context) => MediaQuery.of(context).size.height;

  static sW(BuildContext context) => MediaQuery.of(context).size.width;
}
