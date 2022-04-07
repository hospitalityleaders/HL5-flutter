import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home-pages/header-card.dart';
import '../profile-edit/profile-edit.dart';
import '../profile-overview/profile-overview.dart';
import '../references/references.dart';
import '../timeline/timeline.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditable = false;

  TabController? _tabController;

  final headerCardKey = GlobalKey();

  var headerCard_H;

  var headerCard_W;

  callBackHeader(headerCardKey) {
    setState(() {
      headerCard_H = headerCardKey.height;
      headerCard_W = headerCardKey.width;
    });
  }

  //section1 edit functionality
  final profileOverviewSec1ProSummKey = GlobalKey();

  var profileOverviewSec1ProSumm_H;

  var profileOverviewSec1ProSumm_W;

  final profileOverviewSec1AreaOfExpKey = GlobalKey();

  var profileOverviewSec1AreaOfExp_H;

  var profileOverviewSec1AreaOfExp_W;

  final profileOverviewSec1ReferencesKey = GlobalKey();

  var profileOverviewSec1References_H;

  var profileOverviewSec1References_W;

  callBackButtonSec1(profileOverviewSec1Key, profileOverviewSec1AreaOfExpKey,
      profileOverviewSec1ReferencesKey) {
    setState(() {
      profileOverviewSec1ProSumm_H = profileOverviewSec1Key.height;
      profileOverviewSec1ProSumm_W = profileOverviewSec1Key.width;

      profileOverviewSec1AreaOfExp_H = profileOverviewSec1AreaOfExpKey.height;
      profileOverviewSec1AreaOfExp_W = profileOverviewSec1AreaOfExpKey.width;

      profileOverviewSec1References_H = profileOverviewSec1ReferencesKey.height;
      profileOverviewSec1References_W = profileOverviewSec1ReferencesKey.width;
    });
  }

  //section2 edit functionality
  final profileOverviewSec2WorkExpKey = GlobalKey();

  var profileOverviewSec2WorkExp_H;

  var profileOverviewSec2WorkExp_W;

  final profileOverviewSec2EducationKey = GlobalKey();

  var profileOverviewSec2Education_H;

  var profileOverviewSec2Education_W;

  final profileOverviewSec2AchievementKey = GlobalKey();

  var profileOverviewSec2Achievement_H;

  var profileOverviewSec2Achievement_W;

  final profileOverviewSec2LanguagesKey = GlobalKey();

  var profileOverviewSec2Languages_H;

  var profileOverviewSec2Languages_W;

  callBackButtonSec2(
      profileOverviewSec2WorkExpKey,
      profileOverviewSec2EducationKey,
      profileOverviewSec2AchievementKey,
      profileOverviewSec2LanguagesKey) {
    setState(() {
      profileOverviewSec2WorkExp_H = profileOverviewSec2WorkExpKey.height;
      profileOverviewSec2WorkExp_W = profileOverviewSec2WorkExpKey.width;

      profileOverviewSec2Education_H = profileOverviewSec2EducationKey.height;
      profileOverviewSec2Education_W = profileOverviewSec2EducationKey.width;

      profileOverviewSec2Achievement_H =
          profileOverviewSec2AchievementKey.height;
      profileOverviewSec2Achievement_W =
          profileOverviewSec2AchievementKey.width;

      profileOverviewSec2Languages_H = profileOverviewSec2LanguagesKey.height;
      profileOverviewSec2Languages_W = profileOverviewSec2LanguagesKey.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          HeaderCard(
            isEditable: isEditable,
            headerCardKey: headerCardKey,
            headerCard_H: headerCard_H,
            headerCard_W: headerCard_W,
          ),
          Container(
            height: Get.height * 0.06,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Color(0xFFBDC4C7), width: 2))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .080),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 26,
                        width: 26,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'))),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Noberto Holden',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF272E41)),
                        ),
                      ),
                      const Text(
                        'MHL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF272E41),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TabBar(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        isScrollable: true,
                        automaticIndicatorColorAdjustment: true,
                        tabs: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Profile overview',
                              style: TextStyle(
                                  color: Color(0xFF879399),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Timeline',
                              style: TextStyle(
                                  color: Color(0xFF879399),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Articles',
                              style: TextStyle(
                                  color: Color(0xFF879399),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Activity',
                              style: TextStyle(
                                  color: Color(0xFF879399),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'References',
                              style: TextStyle(
                                  color: Color(0xFF879399),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  EditButton(
                    onChanged: (value) {
                      setState(() {
                        isEditable = !value;
                      });
                    },
                    isEditable: isEditable,
                    //header card edit functionality

                    callBackHeader: callBackHeader,
                    headerCardKey: headerCardKey,

                    //section1 edit functionality
                    callBackButtonSec1: callBackButtonSec1,
                    profileOverviewSec1ProSummKey:
                        profileOverviewSec1ProSummKey,
                    profileOverviewSec1AreaOfExpKey:
                        profileOverviewSec1AreaOfExpKey,
                    profileOverviewSec1ReferencesKey:
                        profileOverviewSec1ReferencesKey,
                    //section2 edit functionality
                    callBackButtonSec2: callBackButtonSec2,
                    profileOverviewSec2WorkExpKey:
                        profileOverviewSec2WorkExpKey,
                    profileOverviewSec2EducationKey:
                        profileOverviewSec2EducationKey,
                    profileOverviewSec2AchievementKey:
                        profileOverviewSec2AchievementKey,
                    profileOverviewSec2LanguagesKey:
                        profileOverviewSec2LanguagesKey,
                  ),
                ],
              ),
            ),
          ),
          IndexedStack(
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_tabController!.index), // add this line
            index: _tabController!.index,
            children: <Widget>[
              ProfileOverview(
                isEditable: isEditable,
                //section1 edit functionality
                profileOverviewSec1ProSummKey: profileOverviewSec1ProSummKey,
                profileOverviewSec1ProSumm_H: profileOverviewSec1ProSumm_H,
                profileOverviewSec1ProSumm_W: profileOverviewSec1ProSumm_W,
                profileOverviewSec1AreaOfExpKey:
                    profileOverviewSec1AreaOfExpKey,
                profileOverviewSec1AreaOfExp_H: profileOverviewSec1AreaOfExp_H,
                profileOverviewSec1AreaOfExp_W: profileOverviewSec1AreaOfExp_W,

                profileOverviewSec1ReferencesKey:
                    profileOverviewSec1ReferencesKey,
                profileOverviewSec1References_H:
                    profileOverviewSec1References_H,
                profileOverviewSec1References_W:
                    profileOverviewSec1References_W,

                //section2 edit functionality

                profileOverviewSec2WorkExpKey: profileOverviewSec2WorkExpKey,
                profileOverviewSec2WorkExp_H: profileOverviewSec2WorkExp_H,
                profileOverviewSec2WorkExp_W: profileOverviewSec2WorkExp_W,

                profileOverviewSec2EducationKey:
                    profileOverviewSec2EducationKey,
                profileOverviewSec2Education_H: profileOverviewSec2Education_H,
                profileOverviewSec2Education_W: profileOverviewSec2Education_W,

                profileOverviewSec2AchievementKey:
                    profileOverviewSec2AchievementKey,
                profileOverviewSec2Achievement_H:
                    profileOverviewSec2Achievement_H,
                profileOverviewSec2Achievement_W:
                    profileOverviewSec2Achievement_W,

                profileOverviewSec2LanguagesKey:
                    profileOverviewSec2LanguagesKey,
                profileOverviewSec2Languages_H: profileOverviewSec2Languages_H,
                profileOverviewSec2Languages_W: profileOverviewSec2Languages_W,
              ),
              Timeline(),
              References(),
              References(),
              References(),
            ],
          )
        ],
      ),
    );
  }
}
