import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/data/data.dart';
import 'package:holedo/news_section/colorPicker/color_picker.dart';
import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/fontStyle/font_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WeatherWidget extends StatelessWidget {
  final bool isBlueColorEnable;

  const WeatherWidget({required this.isBlueColorEnable});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: Get.width * 0.015,
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          CommonWidget.text(
            'Hamburg, DE',
            style: isBlueColorEnable
                ? FontTextStyle.kWhite24W600PR
                : FontTextStyle.kPrimaryLight32W600PR,
          ),
          SizedBox(
            height: 15,
          ),
          CommonWidget.text(
            '3 February 2022 15:13',
            style: isBlueColorEnable
                ? FontTextStyle.kWhite20W600PR
                : FontTextStyle.kPrimaryLight16W600PR,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/cloud.png',
                height: 30,
                color: isBlueColorEnable
                    ? Colors.white
                    : ColorPicker.kPrimaryLight,
              ),
              CommonWidget.text(
                '7',
                style: isBlueColorEnable
                    ? FontTextStyle.kWhite24W600PR
                    : FontTextStyle.kPrimaryLight40W600PR,
              ),
              CommonWidget.text(
                '°',
                style: TextStyle(
                  color: ColorPicker.kPrimaryLight,
                  fontSize: 35,
                  fontFamily: 'ProximaNova-Regular',
                ),
              ),
              CommonWidget.text(
                'C',
                style: isBlueColorEnable
                    ? FontTextStyle.kWhite24W600PR
                    : FontTextStyle.kPrimaryLight40W600PR,
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          CommonWidget.text(
            'Bedecket',
            style: isBlueColorEnable
                ? FontTextStyle.kWhite24W600PR
                : FontTextStyle.kPrimaryLight22W600PR,
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
            height: ResponsiveValue<double>(context,
                    defaultValue: 10,
                    valueWhen: [Condition.smallerThan(name: TABLET, value: 20)])
                .value,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: CommonWidget.text(
                        '${Data.bedecketItem[index]}:',
                        style: isBlueColorEnable
                            ? FontTextStyle.kWhite20W600PR
                            : FontTextStyle.kPrimaryLight18W600PR,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    Data.bedecketValue.length,
                    (index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: CommonWidget.text(
                        '${Data.bedecketValue[index]}',
                        style: isBlueColorEnable
                            ? FontTextStyle.kWhite20W600PR
                            : FontTextStyle.kPrimaryLight18W600PR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ResponsiveValue<double>(context,
                    defaultValue: 20,
                    valueWhen: [Condition.smallerThan(name: TABLET, value: 10)])
                .value,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveValue<double>(context,
                      defaultValue: 10,
                      valueWhen: [
                        Condition.smallerThan(name: TABLET, value: 14)
                      ]).value!,
                ),
                decoration: BoxDecoration(
                  color: ColorPicker.kBlueLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: CommonWidget.text(
                    'Wheather from OpenWeatherMap',
                    textAlign: TextAlign.center,
                    style: isBlueColorEnable
                        ? FontTextStyle.kWhite20W600PR.copyWith(
                            fontSize: ResponsiveValue<double>(context,
                                defaultValue: 12,
                                valueWhen: [
                                Condition.smallerThan(name: TABLET, value: 22)
                              ]).value)
                        : FontTextStyle.kWhite16W600PR.copyWith(
                            fontSize: ResponsiveValue<double>(context,
                                defaultValue: 14,
                                valueWhen: [
                                Condition.smallerThan(name: TABLET, value: 22)
                              ]).value),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: ResponsiveWrapper.of(context).isSmallerThan(TABLET),
            child: SizedBox(
              height: ResponsiveValue<double>(context,
                  defaultValue: 0,
                  valueWhen: [
                    Condition.smallerThan(name: TABLET, value: 10)
                  ]).value,
            ),
          ),
        ],
      ),
    );
  }
}
