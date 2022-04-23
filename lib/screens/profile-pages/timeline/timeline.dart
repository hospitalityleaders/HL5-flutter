import 'package:flutter/material.dart';

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
      String description, var _height, var _width) {
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
                  color: Colors.blue,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff272E41)),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff32A3FD)),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7C8990)),
                    ),
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
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
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
                              padding:
                              const EdgeInsets.all(8.0),
                              child: Text(description,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ColorPicker
                                          .kGreyLight6)),
                            ),
                          )),
                      TextButton.icon(
                        label: Text(isVisible
                            ? 'Close'
                            : 'Show more'),
                        icon: Icon(isVisible
                            ? Icons.remove
                            : Icons.add),
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
  }

  buildTimelineWithCard(String year, var _height, var _width) {
    return TimelineTile(
        hasIndicator: true,
        indicatorStyle: IndicatorStyle(
            // width: 30,
            iconStyle: IconStyle(
                iconData: Icons.circle_outlined,
                color: const Color(0xFFBDC4C7))),
        beforeLineStyle: const LineStyle(color: Color(0xFFBDC4C7)),
        afterLineStyle: const LineStyle(color: Color(0xFFBDC4C7)),
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        startChild: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            year,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0xFF7C8990)),
          ),
        ),
        endChild: buildTimelineCard(
            Icons.apartment,
            'Food and Beverage Manager',
            'Marriott Hotels · Cape Town',
            'February 2013 – present (1 year 6 months)',
            '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
            _height,
            _width));
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _width * 0.070, vertical: _height * .02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 3,
              child: Column(children: [
                buildTimelineWithCard('2013', _height, _width),
                buildTimelineWithCard('2012', _height, _width),
                buildTimelineWithCard('2012', _height, _width),
                buildTimelineWithCard('2010', _height, _width),
                buildTimelineWithCard('2010', _height, _width),
              ]),
            ),
            Expanded(flex: 2, child: ProfileOverviewSec3())
          ],
        ),
      ),
    );
  }
}
