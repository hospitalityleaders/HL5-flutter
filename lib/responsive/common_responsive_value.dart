import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../constant/fontStyle/font_style.dart';

class CommonResponsiveValue {
  static TextStyle blueHeaderResponsiveValue(BuildContext context) {
    return ResponsiveValue<TextStyle>(context,
        defaultValue: FontTextStyle.kBlueLight33W600PR,
        valueWhen: [Condition.smallerThan(name: MOBILE, value: FontTextStyle.kBlueLight20W600PR)]).value!;
  }

  static TextStyle blueHeaderSubtitleRValue(BuildContext context) {
    return ResponsiveValue<TextStyle>(context,
        defaultValue: FontTextStyle.kGreyDark16W600PR.copyWith(letterSpacing: 2.5),
        valueWhen: [Condition.smallerThan(name: MOBILE, value: FontTextStyle.kGreyDark10W600PR.copyWith(letterSpacing: 2.5))]).value!;
  }

  static TextStyle selectedTabBarTextValue(BuildContext context) {
    return ResponsiveValue<TextStyle>(context,
            valueWhen: [
              Condition.smallerThan(
                name: MOBILE,
                value: FontTextStyle.kBlueLight14W600PR,
              )
            ],
            defaultValue: FontTextStyle.kBlueLight20W600PR)
        .value!;
  }

  static TextStyle unselectedTabBarTextValue(BuildContext context) {
    return ResponsiveValue<TextStyle>(context,
            valueWhen: [
              Condition.smallerThan(
                name: MOBILE,
                value: FontTextStyle.kGreyDark14W600PR,
              )
            ],
            defaultValue: FontTextStyle.kGreyDark20W600PR)
        .value!;
  }

  static TextStyle weatherPrimaryLight(BuildContext context) {
    return ResponsiveValue<TextStyle>(context,
            valueWhen: [
              Condition.smallerThan(
                name: DESKTOP,
                value: FontTextStyle.kPrimaryLight28W600PR,
              )
            ],
            defaultValue: FontTextStyle.kPrimaryLight32W600PR)
        .value!;
  }

  static TextStyle genericTextStyleResponsive(BuildContext context, TextStyle defaultTextStyle, TextStyle conditionalTextStyle,
      [List<Condition<TextStyle>>? additionalCondition]) {
    return ResponsiveValue<TextStyle>(context,
            valueWhen: [
              Condition.smallerThan(
                name: DESKTOP,
                value: conditionalTextStyle,
              ),
              ...additionalCondition ?? []
            ],
            defaultValue: defaultTextStyle)
        .value!;
  }

  static double publicPictureDoubleRValue(BuildContext context, double defaultValue, conditionalValue) {
    return ResponsiveValue<double>(context,
            defaultValue: defaultValue,
            valueWhen: [Condition.smallerThan(name: TABLET, value: double.infinity), Condition.smallerThan(name: DESKTOP, value: conditionalValue)])
        .value!;
  }

  static TextStyle headingTextStyle(BuildContext context) {
    return ResponsiveValue<TextStyle>(context,
            valueWhen: [
              Condition.smallerThan(
                name: DESKTOP,
                value: FontTextStyle.kBlueDark28W600PR,
              ),
            ],
            defaultValue: FontTextStyle.kBlueDark32W600PR)
        .value!;
  }

  static double tabBarPaddingRValue(BuildContext context) {
    return ResponsiveValue<double>(context,
            valueWhen: [
              Condition.smallerThan(
                name: MOBILE,
                value: 40.0,
              ),
              Condition.equals(
                name: 'Mobile',
                value: 5.0,
              )
            ],
            defaultValue: 20)
        .value!;
  }

  static bool isDesktop(BuildContext context) {
    return ResponsiveWrapper.of(context).isDesktop;
  }

  static genericDouble(BuildContext context, defaultValue, conditionalValue, [List<Condition<double>>? additionalCondition]) {
    return ResponsiveValue<double>(context,
            valueWhen: [
              Condition.smallerThan(
                name: DESKTOP,
                value: conditionalValue,
              ),
              ...additionalCondition ?? []
            ],
            defaultValue: defaultValue)
        .value!;
  }
}
