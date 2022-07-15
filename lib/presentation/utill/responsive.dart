import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

bool isMobilePhone(BuildContext context) {
  return ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
}

bool isTablet(BuildContext context) {
  return ResponsiveWrapper.of(context).isSmallerThan(TABLET) &&
      ResponsiveWrapper.of(context).isLargerThan("Mobile");
}

// bool isTableOrMobile(BuildContext context) {
//   return Di.getScreenSize(context).width < 1000;
// }

bool isTableOrMobile(BuildContext context) {
  return isMobilePhone(context) ||
      ResponsiveWrapper.of(context).isSmallerThan(TABLET);
}

// import 'package:flutter/material.dart';
// import 'package:holedo/presentation/utill/dimensions.dart';

// bool isMobilePhone(BuildContext context) {
//   return Di.getScreenSize(context).width < 750;
// }

// bool isTablet(BuildContext context) {
//   return Di.getScreenSize(context).width < 1000 &&
//       Di.getScreenSize(context).width > 470;
// }
