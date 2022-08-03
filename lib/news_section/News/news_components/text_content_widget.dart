import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/fontStyle/font_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TextContentWidget extends StatelessWidget {
  const TextContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      width: ResponsiveValue<double>(context, defaultValue: 200, valueWhen: [
        Condition.smallerThan(name: TABLET, value: double.infinity)
      ]).value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidget.text(
            "Winter Olympics/",
            // textAlign: TextAlign.justify,
            style: FontTextStyle.kRed18W600PR.copyWith(
                fontSize: ResponsiveValue<double>(context,
                    defaultValue: 14,
                    valueWhen: [
                  Condition.smallerThan(name: TABLET, value: 18)
                ]).value),
          ),
          CommonWidget.text(
            "snowboarder Su Yiming claims silver in slopestyle final",
            textAlign: TextAlign.start,
            style: FontTextStyle.kPrimaryLight16W600PR.copyWith(
                height: 1.5,
                fontSize: ResponsiveValue<double>(context,
                    defaultValue: 14,
                    valueWhen: [
                      Condition.smallerThan(name: TABLET, value: 18)
                    ]).value),
          ),
          SizedBox(height: 10),
          CommonWidget.text(
            "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
            textAlign: TextAlign.start,
            // maxLines: 2,
            style: FontTextStyle.kGreyLight10W600PR.copyWith(
                height: 1.5,
                fontSize: ResponsiveValue<double>(context,
                    defaultValue: 10,
                    valueWhen: [
                      Condition.smallerThan(name: TABLET, value: 14)
                    ]).value),
          ),
        ],
      ),
    );
  }
}
