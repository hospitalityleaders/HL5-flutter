import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../common/common_widget.dart';
import '../../../../constant/fontStyle/font_style.dart';
import '../../../../responsive/common_responsive_value.dart';

class PublicContentWidget extends StatelessWidget {
  const PublicContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumnItem(
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        columnMainAxisAlignment: MainAxisAlignment.start,
        // rowPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        rowMainAxisAlignment: MainAxisAlignment.end,
        columnPadding: EdgeInsets.symmetric(vertical: 15),
        children: [
          ResponsiveRowColumnItem(
            columnOrder: 2,
            child: SizedBox(
                width: ResponsiveValue<double>(context,
                    defaultValue: 250,
                    valueWhen: [Condition.smallerThan(name: TABLET, value: double.infinity), Condition.smallerThan(name: DESKTOP, value: 200)]).value,
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
                            style: CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kRed20W600PR, FontTextStyle.kRed16W600PR),
                            text: "'We must stay at home':\n",
                            children: [
                              TextSpan(
                                  text: "Hong Kong expected to confirm 614 coronavirus cases",
                                  style: CommonResponsiveValue.genericTextStyleResponsive(
                                      context, FontTextStyle.kPrimaryLight18W600PR.copyWith(height: 1.5), FontTextStyle.kPrimaryLight14W600PR),
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
                          style: CommonResponsiveValue.genericTextStyleResponsive(
                              context,
                              FontTextStyle.kGreyLight12W600PR.copyWith(
                                height: 1.5,
                              ),
                              FontTextStyle.kGreyLight12W600PR.copyWith(
                                height: 1.5,
                              )),
                        ),
                      ],
                    ))
                  ],
                )),
          ),
          ResponsiveRowColumnItem(
            columnOrder: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 270,
              width: CommonResponsiveValue.publicPictureDoubleRValue(context, 280, 250),
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
