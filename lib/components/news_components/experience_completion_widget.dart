import 'package:flutter/material.dart';
import 'package:holedo/responsive/common_responsive_value.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../common/common_widget.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/fontStyle/font_style.dart';
import '../../../../constant/sizedbox.dart';
import '../../../../data/data.dart';

class ExperienceCompletionWidget extends StatelessWidget {
  const ExperienceCompletionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CommonResponsiveValue.genericDouble(context, 520, 480, [Condition.smallerThan(name: TABLET, value: 520)]),
      width: CommonResponsiveValue.genericDouble(context, 250, 250, [Condition.smallerThan(name: TABLET, value: double.infinity)]),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: ColorPicker.kPrimaryLight, borderRadius: BorderRadius.circular(5)),
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        columnMainAxisAlignment: MainAxisAlignment.spaceEvenly,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            child: CommonWidget.text(
              '25%',
              style: CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kWhite60W600PR, FontTextStyle.kWhite40W600PR,
                  [Condition.smallerThan(name: TABLET, value: FontTextStyle.kWhite60W600PR)]),
            ),
          ),
          ResponsiveRowColumnItem(
            child: SB.SH20(),
          ),
          ResponsiveRowColumnItem(
            child: LinearPercentIndicator(
              width: CommonResponsiveValue.genericDouble(context, 200, 150, [Condition.smallerThan(name: TABLET, value: 280)]),
              lineHeight: 8.0,
              alignment: MainAxisAlignment.center,
              percent: 0.25,
              backgroundColor: Colors.black,
              progressColor: ColorPicker.kRed,
              barRadius: Radius.circular(20),
            ),
          ),
          ResponsiveRowColumnItem(
            child: SB.SH20(),
          ),
          ResponsiveRowColumnItem(
            child: SizedBox(
              width: CommonResponsiveValue.genericDouble(context, double.infinity, 150, [Condition.smallerThan(name: TABLET, value: 280)]),
              child: CommonWidget.text(
                "Your Profile is only 25% complete. Improve it now. Here's how",
                style: CommonResponsiveValue.genericTextStyleResponsive(
                    context, FontTextStyle.kWhite18W600PR.copyWith(height: 1.5), FontTextStyle.kWhite14W600PR.copyWith(height: 1.5)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: SB.SH20(),
          ),
          ResponsiveRowColumnItem(
              child: ResponsiveRowColumn(
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            layout: ResponsiveRowColumnType.COLUMN,
            children: List.generate(
                Data.specification.length,
                (index) => ResponsiveRowColumnItem(
                        child: ResponsiveRowColumn(
                      layout: ResponsiveRowColumnType.COLUMN,
                      children: [
                        ResponsiveRowColumnItem(
                            child: ResponsiveRowColumn(
                          layout: ResponsiveRowColumnType.ROW,
                          rowMainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ResponsiveRowColumnItem(
                              child: Container(
                                alignment: Alignment.center,
                                height: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 30 : 15,
                                width: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 30 : 15,
                                color: ColorPicker.kBlueLight,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 25 : 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              child: CommonWidget.text(
                                "Add your work experience",
                                style: CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kBlueLight10W600PR,
                                    FontTextStyle.kBlueLight8W600PR, [Condition.smallerThan(name: TABLET, value: FontTextStyle.kBlueLight16W600PR)]),
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              child: SizedBox(
                                width: 20,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              child: Container(
                                color: Colors.black.withOpacity(0.2),
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                child: Center(
                                    child: CommonWidget.text(
                                  '+20%',
                                  style: CommonResponsiveValue.genericTextStyleResponsive(
                                      context,
                                      FontTextStyle.kBlueLight12W600PR,
                                      FontTextStyle.kBlueLight8W600PR,
                                      [Condition.smallerThan(name: TABLET, value: FontTextStyle.kBlueLight16W600PR)]),
                                )),
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              child: SizedBox(
                                height: 8,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                          ],
                        )),
                        ResponsiveRowColumnItem(
                          child: SizedBox(
                            height: 25,
                          ),
                        ),
                      ],
                    ))),
          )),
          ResponsiveRowColumnItem(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: CommonResponsiveValue.genericDouble(context, 50, 35), vertical: CommonResponsiveValue.genericDouble(context, 12, 8)),
              decoration: BoxDecoration(color: ColorPicker.kBlueLight, borderRadius: BorderRadius.circular(4)),
              child: CommonWidget.text(
                "Edit my profile",
                style: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? FontTextStyle.kWhite20W600PR : FontTextStyle.kWhite16W600PR,
              ),
            ),
          ),
          ResponsiveRowColumnItem(
              child: Visibility(
                  visible: ResponsiveWrapper.of(context).isSmallerThan(TABLET),
                  child: SizedBox(
                    height: 20,
                  )))
        ],
      ),
    );
  }
}
