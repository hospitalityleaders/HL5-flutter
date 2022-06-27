import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

bool isMobilePhone(BuildContext context) {
  return ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
}

bool isTablet(BuildContext context) {
  return ResponsiveWrapper.of(context).isSmallerThan(TABLET) &&
      ResponsiveWrapper.of(context).isLargerThan("Mobile");
}

bool isTableOrMobile(BuildContext context) {
  return isMobilePhone(context) ||
      ResponsiveWrapper.of(context).isSmallerThan(TABLET);
}
