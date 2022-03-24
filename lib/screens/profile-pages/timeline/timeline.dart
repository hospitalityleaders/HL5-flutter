import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile-overview-sec3.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  bool isEditable = false;

  buildTimelineCard(IconData icon, String title, String subtitle, String date) {
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
            Container(
              color: Colors.grey.shade50,
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Show more')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildTimelineWithCard(String year) {
    return TimelineTile(
        hasIndicator: true,
        indicatorStyle: IndicatorStyle(
            // width: 30,
            iconStyle: IconStyle(
                iconData: Icons.circle_outlined, color: const Color(0xFFBDC4C7))),
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
            'February 2013 – present (1 year 6 months)'));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Expanded(flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  buildTimelineWithCard('2013'),
                  buildTimelineWithCard('2012'),
                  buildTimelineWithCard('2012'),
                  buildTimelineWithCard('2010'),
                  buildTimelineWithCard('2010'),
                ]),
              ),
            ),
            Expanded  (flex: 2,child: ProfileOverviewSec3())
          ],
        ),
      ),
    );
  }
}
