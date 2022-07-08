import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/models/holedoapi/achievement.dart';
import 'package:holedo/presentation/data/presentation_data.dart';

import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/custom_expanded_tile.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

Map<String, String> achievementTypeMap = {
  "Award": Svgs.clipboardCheck,
  "Project": Svgs.flag,
  "Presentation": Svgs.clipboardCheck,
};

class ProfileAchievementDialogWidget extends StatefulWidget {
  const ProfileAchievementDialogWidget({
    Key? key,
    required this.achievements,
  }) : super(key: key);

  final List<Achievement> achievements;

  @override
  State<ProfileAchievementDialogWidget> createState() =>
      _ProfileAchievementDialogWidgetState();
}

class _ProfileAchievementDialogWidgetState
    extends State<ProfileAchievementDialogWidget> {
  late List<Achievement> achievements;
  bool addingToAchievement = false;

  @override
  void initState() {
    achievements = widget.achievements;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Cr.darkGrey4,
        width: 655,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogTitleWidget(
              title: "Achievement",
            ),
            Di.SBHL,
            addingToAchievement
                ? Container(
                    padding: EdgeInsets.only(bottom: Di.PSS),
                    margin: EdgeInsets.symmetric(horizontal: Di.PSL),
                    child: _SingleAchievement(
                      isExpanded: true,
                    ),
                  )
                : Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        setState(() {
                          addingToAchievement = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Cr.green1,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            Svgs.plus,
                            color: Cr.whiteColor,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
            Di.SBHL,
            ListView.builder(
              shrinkWrap: true,
              itemCount: achievements.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(bottom: Di.PSS),
                  margin: EdgeInsets.symmetric(horizontal: Di.PSL),
                  width: 615,
                  child: _SingleAchievement(
                    achievement: achievements[index],
                  ),
                );
              },
            ),
            Di.SBHD,
          ],
        ),
      ),
    );
  }
}

class AchievementType {
  final String title;
  final String icon;

  AchievementType(this.title, this.icon);
}

class _SingleAchievement extends StatefulWidget {
  const _SingleAchievement({
    Key? key,
    this.achievement,
    this.isExpanded = false,
  }) : super(key: key);
  final Achievement? achievement;
  final bool isExpanded;

  @override
  State<_SingleAchievement> createState() => __SingleAchievementState();
}

class __SingleAchievementState extends State<_SingleAchievement> {
  late final TextEditingController _achievementTitleController;
  late final TextEditingController _issuingEntityController;
  late final TextEditingController _awardWebsiteController;
  // issuingEntity
  final _formKey = GlobalKey<FormState>();
  late Achievement achievement;
  String? selectedValue;
  bool currentlyWorkHere = false;
  late bool isExpanded;
  String currentAchivement = achievementTypeMap.keys.first;
  String? currentYear;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    achievement = widget.achievement ?? Achievement();
    _achievementTitleController = TextEditingController(text: achievement.title)
      ..addListener(() {
        setState(() {});
      });
    _issuingEntityController =
        TextEditingController(text: achievement.issuingEntity)
          ..addListener(() {
            setState(() {});
          });

    _awardWebsiteController = TextEditingController(text: achievement.website);
    super.initState();

    currentYear = achievement.dateReceived?.year.toString();
  }

  @override
  void dispose() {
    _achievementTitleController.dispose();
    _awardWebsiteController.dispose();
    _issuingEntityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomExpandedTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _achievementTitleController.text,
            style: h4Bold,
          ),
          Text(
            _issuingEntityController.text,
            style: bodySmallRegular.copyWith(
              color: Cr.accentBlue1,
            ),
          ),
          Text(
            currentYear ?? "",
            style: bodySmallRegular.copyWith(
              color: Cr.darkGrey1,
            ),
          )
        ],
      ),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      leading: Container(
        width: 50,
        height: 50,
        color: Cr.accentBlue1,
        child: Center(
          child: SvgPicture.asset(
            achievementTypeMap[currentAchivement]!,
            color: Cr.whiteColor,
            width: 20,
          ),
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      theme: CustomExpandedTileThemeData(
        contentPadding: EdgeInsets.zero,
        headerPadding: EdgeInsets.all(17),
        headerRadius: 0,
        contentRadius: 0,
      ),
      controller: CustomExpandedTileController(isExpanded: isExpanded),
      content: Container(
        color: Cr.whiteColor,
        padding: EdgeInsets.all(Di.PSL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DialogLabelTextFormField(customLabel: "Achievement type"),
                Di.SBHES,
                DialogDropDownTextField(
                  width: double.infinity,
                  initialValue: currentAchivement,
                  alignHintTextStart: true,
                  onChanged: (value) {
                    setState(() {
                      currentAchivement = value ?? currentAchivement;
                    });
                  },
                  // iconsList: achievementTypeList
                  //     .map(
                  //         (achievementT) => SvgPicture.asset(achievementT.icon))
                  //     .toList(),
                  hintText: 'Choose',
                  dataList: achievementTypeMap.keys.toList(),
                ),
                Di.SBCH(18),
                DialogLabelTextFormField(
                  customLabel: "Achievement title",
                ),
                Di.SBHES,
                DialogTextFieldForm(
                  textEditingController: _achievementTitleController,
                ),
                Di.SBCH(18),
                DialogLabelTextFormField(
                  isImportant: false,
                  customLabel: "Issuing entity",
                ),
                Di.SBHES,
                DialogTextFieldForm(
                  textEditingController: _issuingEntityController,
                ),
                Di.SBCH(18),
                DialogLabelTextFormField(
                  isImportant: false,
                  customLabel: "Award/Website link",
                ),
                Di.SBHES,
                DialogTextFieldForm(
                  hintText: "www.website.com",
                  textEditingController: _awardWebsiteController,
                ),
                Di.SBCH(18),
                DialogLabelTextFormField(customLabel: "Date received"),
                Di.SBHES,
                DialogDropDownTextField(
                  width: 72,
                  alignHintTextStart: true,
                  onChanged: (value) {
                    setState(() {
                      currentYear = value;
                    });
                  },
                  // iconsList: achievementTypeList
                  //     .map(
                  //         (achievementT) => SvgPicture.asset(achievementT.icon))
                  //     .toList(),
                  hintText: 'Year',
                  dataList: PresentationData.yearsList,
                ),
                Di.SBCH(18),
              ],
            ),
            Di.SBCH(28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   qualificationList.add('');
                    // });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Svgs.delete,
                        color: Cr.red1,
                        width: 14,
                      ),
                      Di.SBWETS,
                      Text(
                        "Delete",
                        style: bodySmallRegular.copyWith(
                          color: Cr.red1,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      borderColor: Cr.accentBlue2,
                      makeWidthNull: true,
                      onPressed: () => Nav.pop(context),
                      child: Text(
                        "Cancel",
                        style: bodySmallRegular.copyWith(
                          color: Cr.accentBlue1,
                        ),
                      ),
                      height: 36,
                      donotShowIcon: true,
                      backgroundColor: Cr.accentBlue3,
                    ),
                    Di.SBWES,
                    CustomElevatedButton(
                      borderColor: Cr.accentBlue2,
                      makeWidthNull: true,
                      onPressed: () async {
                        // Nav.pop(context);
                        // await new User(
                        //   profileSummary:
                        //       _profileSummaryController.text,
                        // ).save(widget.userProfileData);
                      },
                      child: Text(
                        "Save",
                        style: bodySmallRegular.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                      height: 36,
                      donotShowIcon: true,
                      backgroundColor: Cr.accentBlue1,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}