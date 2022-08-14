import 'package:flutter/material.dart';
import 'package:holedo/responsive/common_responsive_value.dart';
import 'package:responsive_framework/responsive_framework.dart' as RF;
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class PictureAndCommentWidget extends StatelessWidget {
  final int firstWidgetRowOrder;
  final int secondWidgetROwOrder;
  const PictureAndCommentWidget({required this.firstWidgetRowOrder, required this.secondWidgetROwOrder});

  @override
  Widget build(BuildContext context) {
    return RF.ResponsiveRowColumnItem(
      child: RF.ResponsiveRowColumn(
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.start,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        layout: RF.ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? RF.ResponsiveRowColumnType.COLUMN : RF.ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Visibility(
                visible: RF.ResponsiveWrapper.of(context).isSmallerThan(RF.TABLET),
                child: SizedBox(
                  height: 20,
                )),
          ),
          RF.ResponsiveRowColumnItem(
              rowOrder: firstWidgetRowOrder,
              child: Container(
                alignment: Alignment.topCenter,
                height: 300,
                width: CommonResponsiveValue.genericDouble(context, 350, 270, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/news.png'),
                  ),
                ),
              )),
          RF.ResponsiveRowColumnItem(
            rowOrder: secondWidgetROwOrder,
            child: Container(
              height: 300,
              width: CommonResponsiveValue.genericDouble(context, 200, 150, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/twitter.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
