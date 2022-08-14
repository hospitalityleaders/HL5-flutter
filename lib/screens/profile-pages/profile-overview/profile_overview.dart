import 'package:flutter/material.dart';
import 'package:holedo/constant/IconPicker/icon_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile_overview_sec1.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile_overview_sec2.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile_overview_sec3.dart';

import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/sizedbox.dart';
import '../../../../responsive/responsive.dart';

class ProfileOverview extends StatefulWidget {
  final isEditable;

  // profileoverviewsection1
  final profileOverviewSec1ProSummKey;
  final profileOverviewSec1ProSumm_H;
  final profileOverviewSec1ProSumm_W;
  final profileOverviewSec1AreaOfExpKey;
  final profileOverviewSec1AreaOfExp_H;
  final profileOverviewSec1AreaOfExp_W;
  final profileOverviewSec1ReferencesKey;
  final profileOverviewSec1References_H;
  final profileOverviewSec1References_W;

  // profileoverviewsection2
  final profileOverviewSec2WorkExpKey;
  final profileOverviewSec2WorkExp_H;
  final profileOverviewSec2WorkExp_W;
  final profileOverviewSec2EducationKey;
  final profileOverviewSec2Education_H;
  final profileOverviewSec2Education_W;
  final profileOverviewSec2AchievementKey;
  final profileOverviewSec2Achievement_H;
  final profileOverviewSec2Achievement_W;
  final profileOverviewSec2LanguagesKey;
  final profileOverviewSec2Languages_H;
  final profileOverviewSec2Languages_W;
  final pOApiData;
  final VoidCallback? editProfileBtn;

  const ProfileOverview({
    Key? key,
    required this.isEditable,

    // profileoverviewsection1
    this.profileOverviewSec1ProSummKey,
    this.profileOverviewSec1ProSumm_H,
    this.profileOverviewSec1ProSumm_W,
    this.profileOverviewSec1AreaOfExpKey,
    this.profileOverviewSec1AreaOfExp_H,
    this.profileOverviewSec1AreaOfExp_W,
    this.profileOverviewSec1ReferencesKey,
    this.profileOverviewSec1References_H,
    this.profileOverviewSec1References_W,

    // profileoverviewsection2
    this.profileOverviewSec2WorkExpKey,
    this.profileOverviewSec2WorkExp_H,
    this.profileOverviewSec2WorkExp_W,
    this.profileOverviewSec2EducationKey,
    this.profileOverviewSec2Education_H,
    this.profileOverviewSec2Education_W,
    this.profileOverviewSec2AchievementKey,
    this.profileOverviewSec2Achievement_H,
    this.profileOverviewSec2Achievement_W,
    this.profileOverviewSec2LanguagesKey,
    this.profileOverviewSec2Languages_H,
    this.profileOverviewSec2Languages_W,
    this.pOApiData,
    this.editProfileBtn,
  }) : super(key: key);

  @override
  _ProfileOverviewState createState() => _ProfileOverviewState();
}

class _ProfileOverviewState extends State<ProfileOverview> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: SS.sW(context) * 0.070, vertical: SS.sH(context) * .02),
            // Profile Overview Rows
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ProfileOverviewSec1(
                    sec1IsEditable: widget.isEditable,
                    profileOverviewSec1ProSummKey: widget.profileOverviewSec1ProSummKey,
                    profileOverviewSec1ProSumm_H: widget.profileOverviewSec1ProSumm_H,
                    profileOverviewSec1ProSumm_W: widget.profileOverviewSec1ProSumm_W,
                    profileOverviewSec1AreaOfExpKey: widget.profileOverviewSec1AreaOfExpKey,
                    profileOverviewSec1AreaOfExp_H: widget.profileOverviewSec1AreaOfExp_H,
                    profileOverviewSec1AreaOfExp_W: widget.profileOverviewSec1AreaOfExp_W,
                    profileOverviewSec1ReferencesKey: widget.profileOverviewSec1ReferencesKey,
                    profileOverviewSec1References_H: widget.profileOverviewSec1References_H,
                    profileOverviewSec1References_W: widget.profileOverviewSec1References_W,
                    pOApiDataSec1: widget.pOApiData,
                  ),
                ),
                SS.sB(0, SS.sW(context) * 0.01),
                Expanded(
                  child: ProfileOverviewSec2(
                    sec2IsEditable: widget.isEditable,
                    profileOverviewSec2WorkExpKey: widget.profileOverviewSec2WorkExpKey,
                    profileOverviewSec2WorkExp_H: widget.profileOverviewSec2WorkExp_H,
                    profileOverviewSec2WorkExp_W: widget.profileOverviewSec2WorkExp_W,
                    profileOverviewSec2EducationKey: widget.profileOverviewSec2EducationKey,
                    profileOverviewSec2Education_H: widget.profileOverviewSec2Education_H,
                    profileOverviewSec2Education_W: widget.profileOverviewSec2Education_W,
                    profileOverviewSec2AchievementKey: widget.profileOverviewSec2AchievementKey,
                    profileOverviewSec2Achievement_H: widget.profileOverviewSec2Achievement_H,
                    profileOverviewSec2Achievement_W: widget.profileOverviewSec2Achievement_W,
                    profileOverviewSec2LanguagesKey: widget.profileOverviewSec2LanguagesKey,
                    profileOverviewSec2Languages_H: widget.profileOverviewSec2Languages_H,
                    profileOverviewSec2Languages_W: widget.profileOverviewSec2Languages_W,
                    pOApiDataSec2: widget.pOApiData,
                  ),
                ),
                SS.sB(0, SS.sW(context) * 0.01),
                StatefulBuilder(builder: (context, setState) {
                  return Expanded(
                    child: Column(
                      children: [
                        ProfileOverviewSec3(pOApiDataSec3: widget.pOApiData, editProfileBtn: widget.editProfileBtn),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: SS.sW(context),
                            color: ColorPicker.kBlueLight3,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TIMELINE',
                                    style: FontTextStyle.kBlueLight212W700SSP,
                                  ),
                                  Text(
                                    'New Noberto Holden’s career timeline.',
                                    style: FontTextStyle.kBlueLight236W400SSP,
                                  ),
                                  InkWell(
                                    onHover: (value) {
                                      setState(() {
                                        isHovering = value;
                                      });
                                    },
                                    onTap: () {},
                                    child: Container(
                                        alignment: Alignment.center,
                                        color: isHovering ? ColorPicker.kBlueLight2 : ColorPicker.kWhite,
                                        child: Row(
                                          children: [
                                            IconPicker.menu(ColorPicker.kBlueLight1),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ],
            ))
        : Column(
            children: [
              ProfileOverviewSec1(
                sec1IsEditable: widget.isEditable,
                profileOverviewSec1ProSummKey: widget.profileOverviewSec1ProSummKey,
                profileOverviewSec1ProSumm_H: widget.profileOverviewSec1ProSumm_H,
                profileOverviewSec1ProSumm_W: widget.profileOverviewSec1ProSumm_W,
                profileOverviewSec1AreaOfExpKey: widget.profileOverviewSec1AreaOfExpKey,
                profileOverviewSec1AreaOfExp_H: widget.profileOverviewSec1AreaOfExp_H,
                profileOverviewSec1AreaOfExp_W: widget.profileOverviewSec1AreaOfExp_W,
                profileOverviewSec1ReferencesKey: widget.profileOverviewSec1ReferencesKey,
                profileOverviewSec1References_H: widget.profileOverviewSec1References_H,
                profileOverviewSec1References_W: widget.profileOverviewSec1References_W,
                pOApiDataSec1: widget.pOApiData,
              ),
              ProfileOverviewSec2(
                sec2IsEditable: widget.isEditable,
                profileOverviewSec2WorkExpKey: widget.profileOverviewSec2WorkExpKey,
                profileOverviewSec2WorkExp_H: widget.profileOverviewSec2WorkExp_H,
                profileOverviewSec2WorkExp_W: widget.profileOverviewSec2WorkExp_W,
                profileOverviewSec2EducationKey: widget.profileOverviewSec2EducationKey,
                profileOverviewSec2Education_H: widget.profileOverviewSec2Education_H,
                profileOverviewSec2Education_W: widget.profileOverviewSec2Education_W,
                profileOverviewSec2AchievementKey: widget.profileOverviewSec2AchievementKey,
                profileOverviewSec2Achievement_H: widget.profileOverviewSec2Achievement_H,
                profileOverviewSec2Achievement_W: widget.profileOverviewSec2Achievement_W,
                profileOverviewSec2LanguagesKey: widget.profileOverviewSec2LanguagesKey,
                profileOverviewSec2Languages_H: widget.profileOverviewSec2Languages_H,
                profileOverviewSec2Languages_W: widget.profileOverviewSec2Languages_W,
                pOApiDataSec2: widget.pOApiData,
              ),
              ProfileOverviewSec3(pOApiDataSec3: widget.pOApiData, editProfileBtn: widget.editProfileBtn),
            ],
          );
  }
}
