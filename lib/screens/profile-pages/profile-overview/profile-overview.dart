import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:holedo/screens/profile-pages/profile-edit/profile-edit.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        // Profile Overview Rows
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ProfileOverviewSec1(),
            ProfileOverviewSec2(),
            ProfileOverviewSec3(),
          ],
        ),
      ),
    );
  }
}
