import 'package:flutter/material.dart';
import 'package:holedo/utils/strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../common/common_widget.dart';
import '../../../../../components/news_components/text_content_widget.dart';
import '../../../../../constant/colorPicker/color_picker.dart';
import '../../../../../constant/fontStyle/font_style.dart';
import '../../../../../responsive/common_responsive_value.dart';

class CommonNewsPortalWidget extends StatelessWidget {
  final String Heading;
  final ResponsiveRowColumnItem? centerWidget;
  final Widget? tralingWidget;
  final double? tralingDefaultWidth;
  final double? trailingDefaultHeight;
  final Color? tralingDefaultColor;
  final String? trailingOrLeadingWidgetAsLastWidget;
  final EdgeInsets? tralingPadding;
  final bool? isWhiteTile;
  final Widget? customLastWidgetWhenTabView;
  final Widget leadingWidget;
  final EdgeInsetsGeometry? trailingMargin;
  const CommonNewsPortalWidget(
      {required this.Heading,
      this.customLastWidgetWhenTabView,
      this.trailingDefaultHeight,
      this.trailingOrLeadingWidgetAsLastWidget,
      this.tralingPadding,
      this.tralingDefaultWidth,
      this.tralingDefaultColor,
      this.centerWidget,
      this.tralingWidget,
      this.trailingMargin,
      required this.leadingWidget,
      this.isWhiteTile});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowMainAxisAlignment: MainAxisAlignment.center,
      layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          child: Container(
            width: CommonResponsiveValue.genericDouble(context, 1090, 1000),
            // margin: ResponsiveValue<EdgeInsets>(context,
            //     defaultValue: EdgeInsets.symmetric(horizontal: 70), valueWhen: [Condition.smallerThan(name: TABLET, value: EdgeInsets.zero)]).value!,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              color: isWhiteTile != null
                  ? Colors.white
                  : ResponsiveValue<Color>(context,
                      defaultValue: ColorPicker.kYellowLight, valueWhen: [Condition.smallerThan(name: TABLET, value: Colors.transparent)]).value,
              border: Border.all(
                  color: ResponsiveValue<Color>(context,
                      defaultValue: ColorPicker.kBorder2, valueWhen: [Condition.smallerThan(name: TABLET, value: Colors.transparent)]).value!,
                  width: 1),
            ),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: ResponsiveRowColumn(
                  rowCrossAxisAlignment: CrossAxisAlignment.start,
                  rowMainAxisAlignment: MainAxisAlignment.start,
                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      child: ResponsiveRowColumn(
                        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
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
                                        style: CommonResponsiveValue.headingTextStyle(context),
                                      )),
                                ),
                                ResponsiveRowColumnItem(
                                    child: Visibility(
                                  visible: !ResponsiveWrapper.of(context).isSmallerThan(TABLET),
                                  child: SizedBox(
                                    width: 200,
                                    child: Divider(),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          ResponsiveRowColumnItem(
                              child: Visibility(visible: !ResponsiveWrapper.of(context).isSmallerThan(TABLET), child: leadingWidget))
                        ],
                      ),
                    ),
                    ResponsiveRowColumnItem(
                        child: Visibility(
                            visible: ResponsiveWrapper.of(context).isLargerThan(MOBILE), child: SizedBox(height: 540, child: VerticalDivider()))),
                    ResponsiveRowColumnItem(
                      child: ResponsiveRowColumn(
                        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
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
                                      width: ResponsiveValue<double>(context, defaultValue: 540, valueWhen: [
                                        Condition.smallerThan(name: TABLET, value: double.infinity),
                                        Condition.smallerThan(name: DESKTOP, value: 450)
                                      ]).value,
                                      height: 50,
                                      child: Divider()),
                                ),
                                ResponsiveRowColumnItem(
                                    child: ResponsiveRowColumn(
                                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                      ? ResponsiveRowColumnType.COLUMN
                                      : ResponsiveRowColumnType.ROW,
                                  rowCrossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ResponsiveRowColumnItem(
                                      child: TextContentWidget(),
                                    ),
                                    ResponsiveRowColumnItem(
                                      child: ResponsiveVisibility(
                                        child: SizedBox(height: 200, child: VerticalDivider()),
                                        visible: false,
                                        visibleWhen: [
                                          Condition.largerThan(name: TABLET, value: true),
                                        ],
                                        replacement: SizedBox(height: 50, child: Divider()),
                                      ),
                                    ),
                                    ResponsiveRowColumnItem(
                                      child: TextContentWidget(),
                                    ),
                                    ResponsiveRowColumnItem(
                                      child: ResponsiveVisibility(
                                        child: SizedBox(height: 200, child: VerticalDivider()),
                                        visible: false,
                                        visibleWhen: [
                                          Condition.largerThan(name: TABLET, value: true),
                                        ],
                                        replacement: SizedBox(height: 50, child: Divider()),
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
                            visible: ResponsiveWrapper.of(context).isSmallerThan(TABLET) && trailingOrLeadingWidgetAsLastWidget != null,
                            child: trailingOrLeadingWidgetAsLastWidget == Strings.trailingWidget
                                ? tralingWidget ?? SizedBox()
                                : trailingOrLeadingWidgetAsLastWidget == Strings.leadingWidget
                                    ? leadingWidget
                                    : SizedBox(),
                          )),
                          ResponsiveRowColumnItem(
                            child: ResponsiveVisibility(
                              visible: true,
                              replacement: customLastWidgetWhenTabView ?? SizedBox.shrink(),
                              hiddenWhen: [Condition.smallerThan(name: TABLET, value: false)],
                              child: tralingWidget ?? Text('Trailing widget Null'),

                              // Container(
                              //                               alignment: Alignment.topCenter,
                              //                               height: trailingDefaultHeight,
                              //                               width: ResponsiveValue<double>(context,
                              //                                   defaultValue: tralingDefaultWidth ?? 250,
                              //                                   valueWhen: [Condition.smallerThan(name: TABLET, value: double.infinity)]).value!,
                              //                               decoration: BoxDecoration(
                              //                                 color: tralingDefaultColor ?? ColorPicker.kPrimaryLight,
                              //                                 borderRadius: BorderRadius.circular(5),
                              //                               ),
                              //                               margin: trailingMargin,
                              //                               padding: tralingPadding ?? EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                              //                               child: tralingWidget),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  ResponsiveRowColumnItem CenterContentWidget(BuildContext context) {
    return ResponsiveRowColumnItem(
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        // rowPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        rowMainAxisAlignment: MainAxisAlignment.end,
        columnPadding: EdgeInsets.symmetric(vertical: 15),
        children: [
          ResponsiveRowColumnItem(
            columnOrder: 2,
            child: SizedBox(
                width: ResponsiveValue<double>(context, defaultValue: 250, valueWhen: [Condition.smallerThan(name: TABLET, value: double.infinity)])
                    .value,
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
                        text: TextSpan(style: FontTextStyle.kRed20W600PR, text: "'We must stay at home':\n", children: [
                          TextSpan(
                              text: "Hong Kong expected to confirm 614 coronavirus cases",
                              style: FontTextStyle.kPrimaryLight18W600PR.copyWith(height: 1.5),
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
              width:
                  ResponsiveValue<double>(context, defaultValue: 280, valueWhen: [Condition.smallerThan(name: TABLET, value: double.infinity)]).value,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/public.png')),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
