import 'package:flutter/material.dart';

import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/news_section/colorPicker/color_picker.dart';
import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/fontStyle/font_style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../data/data.dart';

class ExperienceCompletionWidget extends StatelessWidget {
  const ExperienceCompletionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CommonWidget.text(
          '25%',
          style: FontTextStyle.kWhite83W600PR.copyWith(fontSize: 60),
        ),
        SB.SH20(),
        LinearPercentIndicator(
          lineHeight: 8.0,
          alignment: MainAxisAlignment.center,
          percent: 0.25,
          backgroundColor: Colors.black,
          progressColor: ColorPicker.kRed,
          barRadius: Radius.circular(20),
        ),
        SB.SH20(),
        CommonWidget.text(
          "Your Profile is only 25% complete. Improve it now. Here's how",
          style: FontTextStyle.kWhite18W600PR.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        SB.SH20(),
        Column(
          children: List.generate(
            Data.specification.length,
            (index) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      color: ColorPicker.kBlueLight,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CommonWidget.text(
                        "Add your work experience",
                        style: FontTextStyle.kBlueLight14W600PR,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.2),
                      height: 25,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                          child: CommonWidget.text(
                        '+20%',
                        style: FontTextStyle.kBlueLight12W600PR,
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
        Container(
          height: 42,
          decoration: BoxDecoration(
              color: ColorPicker.kBlueLight,
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: CommonWidget.text(
              "Edit my profile",
              style: FontTextStyle.kWhite16W600PR,
            ),
          ),
        ),
      ],
    );
  }
}
