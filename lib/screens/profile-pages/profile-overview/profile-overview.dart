import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile-overview-sec1.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile-overview-sec2.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile-overview-sec3.dart';

class ProfileOverview extends StatefulWidget {
  const ProfileOverview({Key? key}) : super(key: key);

  @override
  _ProfileOverviewState createState() => _ProfileOverviewState();
}

class _ProfileOverviewState extends State<ProfileOverview> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: _width*0.03, vertical: _height*.01),
        // Profile Overview Rows
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ProfileOverviewSec1(),
            ProfileOverviewSec2(),
            Expanded(child: ProfileOverviewSec3()),
          ],
        ),
      ),
    );
  }
}
