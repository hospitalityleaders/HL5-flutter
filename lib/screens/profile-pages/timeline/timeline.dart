import 'package:flutter/material.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../constant/colorPicker/color_picker.dart';
import '../profile-overview/profile-overview-sec3.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  bool isVisible = false;

  buildTimelineCard(IconData icon, String title, String subtitle, String date,
      String description, var _height, var _width, bool isVisible) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 23, bottom: 23, right: 14, left: 20),
                    height: 50,
                    width: 50,
                    color: ColorPicker.kBlueLight1,
                    child: Icon(
                      icon,
                      color: ColorPicker.kWhite,
                      size: 16.67,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: FontTextStyle.kBlueDark116W700SSP),
                      Text(subtitle, style: FontTextStyle.kBlueLight114W400SSP),
                      Text(date, style: FontTextStyle.kGreyLight514W400SSP),
                    ],
                  )
                ],
              ),
              Divider(
                height: 0.1,
                color: ColorPicker.kGreyLight3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: ColorPicker.kWhite,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                            height: isVisible ? 120 : 0,
                            color: ColorPicker.kWhite,
                            duration: Duration(seconds: 1),
                            alignment: isVisible
                                ? Alignment.topCenter
                                : Alignment.bottomCenter,
                            curve: Curves.fastOutSlowIn,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(description,
                                    style: FontTextStyle.kGreyLight516W400SSP),
                              ),
                            )),
                        TextButton.icon(
                          label: Text(
                            isVisible ? 'Close' : 'Show more',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                          icon: Icon(
                            isVisible ? Icons.remove : Icons.add,
                            color: ColorPicker.kBlueLight1,
                            size: 7,
                          ),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  buildTimelineWithCard(String year, var _height, var _width, bool isVisible) {
    return TimelineTile(
      hasIndicator: true,
      indicatorStyle: IndicatorStyle(
          // width: 30,
          iconStyle: IconStyle(
              iconData: Icons.circle_outlined,
              color: ColorPicker.kGreyLight8,
              fontSize: 13)),
      beforeLineStyle: LineStyle(color: ColorPicker.kGreyLight10),
      afterLineStyle: LineStyle(color: ColorPicker.kGreyLight10),
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      startChild: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(year, style: FontTextStyle.kGreyLight512W700SSP),
      ),
      endChild: buildTimelineCard(
          Icons.apartment,
          'Food and Beverage Manager',
          'Marriott Hotels · Cape Town',
          'February 2013 – present (1 year 6 months)',
          '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
          _height,
          _width,
          isVisible),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SS.sW(context) * 0.070, vertical: SS.sH(context) * .02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  buildTimelineWithCard(
                      '2013', SS.sH(context), SS.sW(context), isVisible),
                  buildTimelineWithCard(
                      '2012', SS.sH(context), SS.sW(context), isVisible),
                  buildTimelineWithCard(
                      '2012', SS.sH(context), SS.sW(context), isVisible),
                  buildTimelineWithCard(
                      '2010', SS.sH(context), SS.sW(context), isVisible),
                  buildTimelineWithCard(
                      '2010', SS.sH(context), SS.sW(context), isVisible),
                ],
              ),
            ),
            Expanded(flex: 2, child: ProfileOverviewSec3())
          ],
        ),
      ),
    );
  }
}
