import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

bool isMobilePhone(BuildContext context) {
  return ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
}
