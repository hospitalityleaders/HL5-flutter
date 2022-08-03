import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/fontStyle/font_style.dart';

import 'package:holedo/news_section/colorPicker/color_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AddExperienceWidget extends StatelessWidget {
  const AddExperienceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              color: ColorPicker.kShadow1.withOpacity(0.15),
              blurRadius: 30),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: ColorPicker.kPrimaryLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonWidget.text(
                    '25%',
                    style: FontTextStyle.kWhite83W600PR.copyWith(fontSize: 45),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LinearPercentIndicator(
                    lineHeight: 8.0,
                    percent: 0.25,
                    backgroundColor: Colors.black,
                    progressColor: ColorPicker.kRed,
                    barRadius: Radius.circular(20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CommonWidget.text(
                    'Your Profile is only\n25% complete',
                    style: FontTextStyle.kWhite18W600PR
                        .copyWith(fontSize: 14, height: 1.2),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidget.text(
                        'Where did you work before your current job?',
                        style: FontTextStyle.kBlueDark20W600PR,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CommonWidget.text(
                        'your work history shows your career path and experience in the industry.',
                        style: FontTextStyle.kGreyDark18W600PR
                            .copyWith(height: 1.2, wordSpacing: 1.3),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 45),
                        height: 33,
                        width: 180,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                        decoration: BoxDecoration(
                          color: ColorPicker.kBlueLight,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: CommonWidget.text(
                            'Add work experience',
                            style: FontTextStyle.kWhite18W600PR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  // width: Get.width * 0.25,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundColor: index == 0
                                    ? ColorPicker.kBlueLight
                                    : ColorPicker.kBlueLight.withOpacity(0.3),
                                radius: 4,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_back_ios,
                                size: 22,
                                color: ColorPicker.kBlueLight.withOpacity(0.5)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorPicker.kBlueLight,
                              size: 22,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
