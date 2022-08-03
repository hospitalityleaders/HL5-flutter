import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/data/data.dart';
import 'package:holedo/news_section/News/news_components/text_content_widget.dart';
import 'package:holedo/news_section/News/news_components/weather_widget.dart';

import 'package:holedo/news_section/colorPicker/color_picker.dart';
import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/fontStyle/font_style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CommonNewsPortalWidget extends StatelessWidget {
  final String Heading;
  final ResponsiveRowColumnItem? centerWidget;
  final Widget? tralingWidget;
  final double? tralingDefaultWidth;
  final Color? tralingDefaultColor;
  final EdgeInsets? tralingPadding;
  final bool? isDarkBlue;
  final Widget? lastWidgetWhenMobileView;
  final Widget leadingWidget;
  const CommonNewsPortalWidget(
      {required this.Heading,
      this.tralingPadding,
      this.tralingDefaultWidth,
      this.tralingDefaultColor,
      this.centerWidget,
      this.tralingWidget,
      this.lastWidgetWhenMobileView,
      required this.leadingWidget,
      this.isDarkBlue});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ResponsiveValue<double>(context,
      //             defaultValue: 620,
      //             valueWhen: [Condition.smallerThan(name: TABLET, value: null)])
      //         .value ??
      //     620,
      margin: ResponsiveValue<EdgeInsets>(context,
          defaultValue: EdgeInsets.symmetric(horizontal: 20),
          valueWhen: [
            Condition.smallerThan(name: TABLET, value: EdgeInsets.zero)
          ]).value!,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: isDarkBlue != null
            ? Colors.white
            : ResponsiveValue<Color>(context,
                defaultValue: ColorPicker.kYellowLight,
                valueWhen: [
                    Condition.smallerThan(
                        name: TABLET, value: Colors.transparent)
                  ]).value,
        border: Border.all(
            color: ResponsiveValue<Color>(context,
                defaultValue: ColorPicker.kBorder2,
                valueWhen: [
                  Condition.smallerThan(name: TABLET, value: Colors.transparent)
                ]).value!,
            width: 1),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: ResponsiveRowColumn(
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            rowMainAxisAlignment: MainAxisAlignment.start,
            layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                child: ResponsiveRowColumn(
                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? ResponsiveRowColumnType.ROW
                      : ResponsiveRowColumnType.COLUMN,
                  children: [
                    ResponsiveRowColumnItem(
                      child: ResponsiveRowColumn(
                        columnCrossAxisAlignment: CrossAxisAlignment.start,
                        layout: ResponsiveRowColumnType.COLUMN,
                        columnMainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ResponsiveRowColumnItem(
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: CommonWidget.text(
                                  Heading,
                                  style: FontTextStyle.kBlueDark32W600PR,
                                )),
                          ),
                          ResponsiveRowColumnItem(
                              child: Visibility(
                            visible: !ResponsiveWrapper.of(context)
                                .isSmallerThan(TABLET),
                            child: SizedBox(
                              width: 200,
                              child: Divider(),
                            ),
                          )),
                        ],
                      ),
                    ),
                    ResponsiveRowColumnItem(
                        child: Visibility(
                            visible: !ResponsiveWrapper.of(context)
                                .isSmallerThan(TABLET),
                            child: leadingWidget))
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                  child: Visibility(
                      visible:
                          ResponsiveWrapper.of(context).isLargerThan(MOBILE),
                      child: SizedBox(height: 580, child: VerticalDivider()))),
              ResponsiveRowColumnItem(
                child: ResponsiveRowColumn(
                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ResponsiveRowColumnItem(
                        child: ResponsiveRowColumn(
                            layout: ResponsiveRowColumnType.COLUMN,
                            columnCrossAxisAlignment: CrossAxisAlignment.start,
                            columnMainAxisAlignment: MainAxisAlignment.start,
                            rowCrossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          centerWidget!,

                          ResponsiveRowColumnItem(
                            child: SizedBox(
                                width: ResponsiveValue<double>(context,
                                    defaultValue: 580,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: TABLET, value: double.infinity)
                                    ]).value,
                                height: 50,
                                child: Divider()),
                          ),
                          ResponsiveRowColumnItem(
                              child: ResponsiveRowColumn(
                            layout: ResponsiveWrapper.of(context)
                                    .isSmallerThan(TABLET)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            rowCrossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ResponsiveRowColumnItem(
                                child: TextContentWidget(),
                              ),
                              ResponsiveRowColumnItem(
                                child: ResponsiveVisibility(
                                  child: SizedBox(
                                      height: 200, child: VerticalDivider()),
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(
                                        name: TABLET, value: true),
                                  ],
                                  replacement:
                                      SizedBox(height: 50, child: Divider()),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                child: TextContentWidget(),
                              ),
                              ResponsiveRowColumnItem(
                                child: ResponsiveVisibility(
                                  child: SizedBox(
                                      height: 200, child: VerticalDivider()),
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(
                                        name: TABLET, value: true),
                                  ],
                                  replacement:
                                      SizedBox(height: 50, child: Divider()),
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                child: TextContentWidget(),
                              ),
                            ],
                          )),

                          // ResponsiveRowColumnItem(child: ,)
                        ])),
                    ResponsiveRowColumnItem(
                        child: Visibility(
                      visible:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET) &&
                              isDarkBlue == null,
                      child: WeatherWidget(
                        isBlueColorEnable: false,
                      ),
                    )),
                    ResponsiveRowColumnItem(
                      child: Container(
                          // height: 520,
                          width: ResponsiveValue<double>(context,
                              defaultValue: tralingDefaultWidth ?? 250,
                              valueWhen: [
                                Condition.smallerThan(
                                    name: TABLET, value: double.infinity)
                              ]).value!,
                          decoration: BoxDecoration(
                            color: tralingDefaultColor ??
                                ColorPicker.kPrimaryLight,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // margin: EdgeInsets.only(right: Get.width * 0.015),
                          padding: tralingPadding ??
                              EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                          child: ResponsiveValue<Widget>(context,
                              defaultValue: tralingWidget!,
                              valueWhen: [
                                Condition.smallerThan(
                                    name: TABLET,
                                    value: lastWidgetWhenMobileView)
                              ]).value),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ResponsiveRowColumnItem CenterContentWidget(BuildContext context) {
    return ResponsiveRowColumnItem(
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        // rowPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        rowMainAxisAlignment: MainAxisAlignment.end,
        columnPadding: EdgeInsets.symmetric(vertical: 15),
        children: [
          ResponsiveRowColumnItem(
            columnOrder: 2,
            child: SizedBox(
                width: ResponsiveValue<double>(context,
                    defaultValue: 250,
                    valueWhen: [
                      Condition.smallerThan(
                          name: TABLET, value: double.infinity)
                    ]).value,
                child: ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.COLUMN,
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  columnMainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            style: FontTextStyle.kRed20W600PR,
                            text: "'We must stay at home':\n",
                            children: [
                              TextSpan(
                                  text:
                                      "Hong Kong expected to confirm 614 coronavirus cases",
                                  style: FontTextStyle.kPrimaryLight18W600PR
                                      .copyWith(height: 1.5),
                                  spellOut: true)
                            ]),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        CommonWidget.text(
                          "The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.",
                          textAlign: TextAlign.justify,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 8,
                          style: FontTextStyle.kGreyLight12W600PR.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ],
                    ))
                  ],
                )),
          ),
          ResponsiveRowColumnItem(
            columnOrder: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 270,
              width: ResponsiveValue<double>(context,
                  defaultValue: 280,
                  valueWhen: [
                    Condition.smallerThan(name: TABLET, value: double.infinity)
                  ]).value,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/public.png')),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
