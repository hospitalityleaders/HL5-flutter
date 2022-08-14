import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../common/common_widget.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/fontStyle/font_style.dart';

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
          BoxShadow(offset: Offset(0, 4), color: ColorPicker.kShadow1.withOpacity(0.15), blurRadius: 30),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.ROW,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResponsiveRowColumnItem(
            child: Container(
              width: 180,
              color: ColorPicker.kPrimaryLight,
              child: ResponsiveRowColumn(
                layout: ResponsiveRowColumnType.COLUMN,
                columnMainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveRowColumnItem(
                      child: CommonWidget.text(
                    '1234%',
                    style: FontTextStyle.kWhite45W600PR,
                  )),
                  ResponsiveRowColumnItem(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: LinearPercentIndicator(
                      lineHeight: 8.0,
                      percent: 0.25,
                      backgroundColor: Colors.black,
                      progressColor: ColorPicker.kRed,
                      barRadius: Radius.circular(20),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: CommonWidget.text(
                      'Your Profile is only\n25% complete',
                      style: FontTextStyle.kWhite18W600PR.copyWith(fontSize: 14, height: 1.2),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              columnMainAxisAlignment: MainAxisAlignment.end,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      'Where did you work before your current job?',
                      style: FontTextStyle.kBlueDark20W600PR,
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'your work history shows your career path and experience in the industry.',
                      style: FontTextStyle.kGreyDark14W600PR.copyWith(height: 1.2, wordSpacing: 1.3),
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: Container(
                    margin: EdgeInsets.only(right: 45),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: ColorPicker.kBlueLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Add work experience',
                        style: FontTextStyle.kWhite18W600PR,
                      ),
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout: ResponsiveRowColumnType.ROW,
                    rowMainAxisAlignment: MainAxisAlignment.start,
                    rowSpacing: 155,

                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      ResponsiveRowColumnItem(
                        child: ResponsiveRowColumn(
                          layout: ResponsiveRowColumnType.ROW,
                          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => ResponsiveRowColumnItem(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  backgroundColor: index == 0 ? ColorPicker.kBlueLight : ColorPicker.kBlueLight.withOpacity(0.3),
                                  radius: 4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios, size: 22, color: ColorPicker.kBlueLight.withOpacity(0.5)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorPicker.kBlueLight,
                              size: 22,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    height: 25,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
