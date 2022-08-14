import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../common/common_widget.dart';
import '../../constant/colorPicker/color_picker.dart';
import '../../constant/fontStyle/font_style.dart';
import '../../data/data.dart';
import '../../responsive/common_responsive_value.dart';

class WeatherWidget extends StatelessWidget {
  final bool isBlueColorEnable;
  final double height;
  final double width;
  const WeatherWidget({required this.isBlueColorEnable, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isBlueColorEnable ? ColorPicker.kPrimaryLight : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      // margin: EdgeInsets.only(right: Get.width * 0.015),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          CommonWidget.text(
            'Hamburg, DE',
            style: isBlueColorEnable
                ? CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite20W600PR, FontTextStyle.kWhite16W600PR)
                : CommonResponsiveValue.weatherPrimaryLight(context),
          ),
          SizedBox(
            height: 15,
          ),
          CommonWidget.text(
            '3 February 2022 15:13',
            style: isBlueColorEnable
                ? CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite16W600PR, FontTextStyle.kWhite14W600PR)
                : CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kPrimaryLight16W600PR, FontTextStyle.kPrimaryLight14W600PR),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/cloud.png',
                height: CommonResponsiveValue.genericDouble(context, 20, 20),
                color: isBlueColorEnable ? Colors.white : ColorPicker.kPrimaryLight,
              ),
              SizedBox(
                width: 5,
              ),
              CommonWidget.text(
                '7',
                style: isBlueColorEnable
                    ? CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite23W600PR, FontTextStyle.kWhite18W600PR)
                    : CommonResponsiveValue.genericTextStyleResponsive(
                        context, FontTextStyle.kPrimaryLight24W600PR, FontTextStyle.kPrimaryLight20W600PR),
              ),
              CommonWidget.text(
                '°',
                style: TextStyle(
                  color: isBlueColorEnable ? Colors.white : ColorPicker.kPrimaryLight,
                  fontSize: 35,
                  fontFamily: 'ProximaNova-Regular',
                ),
              ),
              CommonWidget.text(
                'C',
                style: isBlueColorEnable ? FontTextStyle.kWhite23W600PR : FontTextStyle.kPrimaryLight40W600PR,
              )
            ],
          ),
          // SizedBox(
          //   height: 25,
          // ),
          CommonWidget.text(
            'Bedecket',
            style: isBlueColorEnable
                ? CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite20W600PR, FontTextStyle.kWhite16W600PR)
                : CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kPrimaryLight20W600PR, FontTextStyle.kPrimaryLight16W600PR),
          ),
          Visibility(
              visible: isBlueColorEnable,
              child: SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              )),
          SizedBox(
            height: ResponsiveValue<double>(context, defaultValue: 10, valueWhen: [Condition.smallerThan(name: TABLET, value: 20)]).value,
          ),
          Visibility(
            visible: !ResponsiveWrapper.of(context).isSmallerThan(TABLET),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    Data.bedecketItem.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: CommonWidget.text(
                        '${Data.bedecketItem[index]}:',
                        style: isBlueColorEnable
                            ? CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite14W400PR, FontTextStyle.kWhite12W400PR)
                            : CommonResponsiveValue.genericTextStyleResponsive(
                                context, FontTextStyle.kPrimaryLight14W400PR, FontTextStyle.kPrimaryLight12W400PR),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    Data.bedecketValue.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: CommonWidget.text(
                        '${Data.bedecketValue[index]}',
                        style: isBlueColorEnable
                            ? CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite14W400PR, FontTextStyle.kWhite12W400PR)
                            : CommonResponsiveValue.genericTextStyleResponsive(
                                context, FontTextStyle.kPrimaryLight14W400PR, FontTextStyle.kPrimaryLight12W400PR),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ResponsiveValue<double>(context, defaultValue: 20, valueWhen: [Condition.smallerThan(name: TABLET, value: 10)]).value,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveValue<double>(context, defaultValue: 10, valueWhen: [Condition.smallerThan(name: TABLET, value: 14)]).value!,
                ),
                decoration: BoxDecoration(
                  color: ColorPicker.kBlueLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: CommonWidget.text('Weather from OpenWeatherMap',
                      textAlign: TextAlign.center,
                      style: CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite10W400PR, FontTextStyle.kWhite12W400PR)),
                ),
              ),
            ],
          ),
          // Visibility(
          //   visible: ResponsiveWrapper.of(context).isSmallerThan(TABLET),
          //   child: SizedBox(
          //     height: ResponsiveValue<double>(context, defaultValue: 0, valueWhen: [Condition.smallerThan(name: TABLET, value: 10)]).value,
          //   ),
          // ),
        ],
      ),
    );
    ;
  }
}
