import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/models/holedoapi/achievement.dart';
import 'package:holedo/models/holedoapi/education.dart';
import 'package:holedo/models/holedoapi/experience.dart';
import 'package:holedo/presentation/functions/helper_functions.dart';

import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/expanded_section.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/classes.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class TimelineSection extends StatefulWidget {
  const TimelineSection({
    Key? key,
  }) : super(key: key);

  @override
  State<TimelineSection> createState() => _TimelineSectionState();
}

class _TimelineSectionState extends State<TimelineSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Di.getScreenSize(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TimelineSectionComponent(),
          Di.SBCW(24),
          Flexible(
            child: SizedBox(
              width: 360,
              child: Column(
                children: [
                  const ProfileCompletionComponent(),
                  Di.SBHEL,
                  const ConnectionsComponent(),
                  const ProfileAdsComponent(),
                  const RightsComponent(),
                ],
              ),
            ),
          ),
          Di.SBWEL,
        ],
      ),
    );
  }
}

class TimelineSectionComponent extends StatefulWidget {
  const TimelineSectionComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<TimelineSectionComponent> createState() =>
      _TimelineSectionComponentState();
}

class _TimelineSectionComponentState extends State<TimelineSectionComponent> {
  late final List<TimelineClass> timelineClasslist;

  @override
  void initState() {
    timelineClasslist = HelperFunctions().listOfTimeline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            // width: 550,
            width: 620,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: timelineClasslist.length,
              itemBuilder: (context, index) {
                final TimelineClass timelineClass = timelineClasslist[index];
                if (timelineClass.timelineClassType ==
                    TimelineClassTypes.Education) {
                  return EducationTimeLineWidget(
                    education: timelineClass.timeline as Education,
                  );
                } else if (timelineClass.timelineClassType ==
                    TimelineClassTypes.Achievement) {
                  return AchievementTimeLineWidget(
                    achievement: timelineClass.timeline as Achievement,
                  );
                } else {
                  return ExperienceTimeLineWidget(
                    experience: timelineClass.timeline as Experience,
                  );
                }
              },
            )),
        Di.SBWEL,
      ],
    );
  }
}

class EducationTimeLineWidget extends StatefulWidget {
  const EducationTimeLineWidget({
    Key? key,
    this.showComments = false,
    required this.education,
  }) : super(key: key);
  final bool showComments;
  final Education education;

  @override
  State<EducationTimeLineWidget> createState() =>
      _EducationTimeLineWidgetState();
}

class _EducationTimeLineWidgetState extends State<EducationTimeLineWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: Di.PSOTL),
                child: Container(
                  width: 3,
                  color: Cr.darkGrey3,
                ),
              ),
              Container(
                width: 13,
                height: 13,
                margin: const EdgeInsets.only(
                  left: Di.PSOL,
                  top: Di.PSOTL,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Cr.darkGrey3),
                  color: Cr.darkGrey4,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Di.PSOTL,
                ),
                child: SizedBox(
                  width: 27,
                  child: Text(
                    widget.education.durationFromDate!.year.toString(),
                    maxLines: 1,
                    style: dividerTextSmall.copyWith(
                      // overflow: TextOverflow.fade,
                      color: Cr.darkGrey1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                Container(
                  height: 96,
                  color: Cr.whiteColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Di.PSL,
                    vertical: Di.PSD,
                  ),
                  child: Row(
                    children: [
                      const ContainerWithIcon(
                        size: 50,
                        iconData: FontAwesomeIcons.buildingColumns,
                      ),
                      Di.SBWD,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.education.title ?? "",
                            style: h4Bold.copyWith(
                              color: Cr.darkBlue1,
                            ),
                          ),
                          Text(
                            "${widget.education.institution} · ${widget.education.area}",
                            style: bodySmallRegular.copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                          Text(
                            widget.education.studyDuration ?? "",
                            style: bodySmallRegular.copyWith(
                              color: const Color.fromRGBO(124, 137, 144, 1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.education.description != null)
                  ExpandedSection(
                    expand: showMore,
                    child: Container(
                      width: 550,
                      color: Cr.lightGrey2,
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
                      child: Html(
                        data: widget.education.description != null
                            ? widget.education.description.toString()
                            : "",
                        style: {
                          "h4": Style(
                            color: Cr.darkGrey1,
                          ),
                          "p": Style(
                            color: Cr.darkGrey1,
                            backgroundColor: Cr.lightGrey2,
                          ),
                          "li": Style(
                            color: Cr.darkGrey1,
                            backgroundColor: Cr.lightGrey2,
                          ),
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Di.PSL),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    color: Cr.lightGrey2,
                    padding: const EdgeInsets.only(left: Di.PSL),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedCrossFade(
                        firstChild: GestureDetector(
                          onTap: () async {
                            setState(() {
                              showMore = !showMore;
                            });
                          },
                          child: Text(
                            r"  + Job Description",
                            style: (bodySmallRegular).copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                        ),
                        secondChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              showMore = !showMore;
                            });
                          },
                          child: Text(
                            r"  - Close",
                            style: (bodySmallRegular).copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                        ),
                        crossFadeState: showMore
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ),
                  ),
                ),
                widget.showComments
                    ? Container(
                        height: 120,
                        color: Cr.whiteColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Di.PSL,
                          vertical: Di.PSS,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.thumb_up,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Like",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Di.SBWOL,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.comment,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Comment",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Di.SBWOL,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.share,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Share",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(Di.PSL),
                              child: Row(
                                children: [
                                  const PersonAvatar(
                                    avatarSize: 40,
                                  ),
                                  Di.SBWL,
                                  SizedBox(
                                    width: 360,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Leave a comment",
                                        hintStyle: bodySmallRegular.copyWith(
                                          color: Cr.darkGrey1,
                                        ),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AchievementTimeLineWidget extends StatefulWidget {
  const AchievementTimeLineWidget({
    Key? key,
    this.showComments = false,
    required this.achievement,
  }) : super(key: key);
  final bool showComments;
  final Achievement achievement;

  @override
  State<AchievementTimeLineWidget> createState() =>
      _AchievementTimeLineWidgetState();
}

class _AchievementTimeLineWidgetState extends State<AchievementTimeLineWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: Di.PSOTL),
                child: Container(
                  width: 3,
                  color: Cr.darkGrey3,
                ),
              ),
              Container(
                width: 13,
                height: 13,
                margin: const EdgeInsets.only(
                  left: Di.PSOL,
                  top: Di.PSOTL,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Cr.darkGrey3),
                  color: Cr.darkGrey4,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Di.PSOTL,
                ),
                child: SizedBox(
                  width: 27,
                  child: Text(
                    widget.achievement.created!.year.toString(),
                    maxLines: 1,
                    style: dividerTextSmall.copyWith(
                      // overflow: TextOverflow.fade,
                      color: Cr.darkGrey1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                Container(
                  height: 96,
                  color: Cr.whiteColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Di.PSL,
                    vertical: Di.PSD,
                  ),
                  child: Row(
                    children: [
                      const ContainerWithIcon(
                        size: 50,
                        iconData: FontAwesomeIcons.buildingColumns,
                      ),
                      Di.SBWD,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.achievement.title ?? "",
                            style: h4Bold.copyWith(
                              color: Cr.darkBlue1,
                            ),
                          ),
                          Text(
                            "${widget.achievement.issuingEntity}",
                            style: bodySmallRegular.copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                          Text(
                            widget.achievement.dateIssued ?? "",
                            style: bodySmallRegular.copyWith(
                              color: const Color.fromRGBO(124, 137, 144, 1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.achievement.description != null)
                  ExpandedSection(
                    expand: showMore,
                    child: Container(
                      width: 550,
                      color: Cr.lightGrey2,
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
                      child: Html(
                        // data:
                        //     // """<h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4>when rendering a specific HTML tag. This means you can change the default behaviour or add support for HTML elements that aren't supported natively. You can also make up your own llows you to customize everything when rendering a specific HTML tag. This means you can change the default behaviour or add support for HTML elements that aren't supported natively. You can also make up your own cust custom tags in your HTML """,
                        data: widget.achievement.description != null
                            ? widget.achievement.description.toString()
                            : "",
                        style: {
                          "h4": Style(
                            color: Cr.darkGrey1,
                          ),
                          "p": Style(
                            color: Cr.darkGrey1,
                            backgroundColor: Cr.lightGrey2,
                          ),
                          "li": Style(
                            color: Cr.darkGrey1,
                            backgroundColor: Cr.lightGrey2,
                          ),
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Di.PSL),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    color: Cr.lightGrey2,
                    padding: const EdgeInsets.only(left: Di.PSL),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedCrossFade(
                        firstChild: GestureDetector(
                          onTap: () async {
                            setState(() {
                              showMore = !showMore;
                            });
                          },
                          child: Text(
                            r"  + Job Description",
                            style: (bodySmallRegular).copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                        ),
                        secondChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              showMore = !showMore;
                            });
                          },
                          child: Text(
                            r"  - Close",
                            style: (bodySmallRegular).copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                        ),
                        crossFadeState: showMore
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ),
                  ),
                ),
                widget.showComments
                    ? Container(
                        height: 120,
                        color: Cr.whiteColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Di.PSL,
                          vertical: Di.PSS,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.thumb_up,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Like",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Di.SBWOL,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.comment,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Comment",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Di.SBWOL,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.share,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Share",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(Di.PSL),
                              child: Row(
                                children: [
                                  const PersonAvatar(
                                    avatarSize: 40,
                                  ),
                                  Di.SBWL,
                                  SizedBox(
                                    width: 360,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Leave a comment",
                                        hintStyle: bodySmallRegular.copyWith(
                                          color: Cr.darkGrey1,
                                        ),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceTimeLineWidget extends StatefulWidget {
  const ExperienceTimeLineWidget({
    Key? key,
    this.showComments = false,
    required this.experience,
  }) : super(key: key);
  final bool showComments;
  final Experience experience;

  @override
  State<ExperienceTimeLineWidget> createState() =>
      _ExperienceTimeLineWidgetState();
}

class _ExperienceTimeLineWidgetState extends State<ExperienceTimeLineWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: Di.PSOTL),
                child: Container(
                  width: 3,
                  color: Cr.darkGrey3,
                ),
              ),
              Container(
                width: 13,
                height: 13,
                margin: const EdgeInsets.only(
                  left: Di.PSOL,
                  top: Di.PSOTL,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Cr.darkGrey3),
                  color: Cr.darkGrey4,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Di.PSOTL,
                ),
                child: SizedBox(
                  width: 27,
                  child: Text(
                    widget.experience.toDate!.year.toString(),
                    maxLines: 1,
                    style: dividerTextSmall.copyWith(
                      // overflow: TextOverflow.fade,
                      color: Cr.darkGrey1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                Container(
                  height: 96,
                  color: Cr.whiteColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Di.PSL,
                    vertical: Di.PSD,
                  ),
                  child: Row(
                    children: [
                      const ContainerWithIcon(
                        size: 50,
                        iconData: FontAwesomeIcons.buildingColumns,
                      ),
                      Di.SBWD,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.experience.title ?? "",
                            style: h4Bold.copyWith(
                              color: Cr.darkBlue1,
                            ),
                          ),
                          Text(
                            "${widget.experience.company} · ${widget.experience.area}",
                            style: bodySmallRegular.copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                          Text(
                            widget.experience.workDuration ?? "",
                            style: bodySmallRegular.copyWith(
                              color: const Color.fromRGBO(124, 137, 144, 1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.experience.description != null)
                  ExpandedSection(
                    expand: showMore,
                    child: Container(
                      width: 550,
                      color: Cr.lightGrey2,
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
                      child: Html(
                        // data:
                        //     // """<h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4><h4>A powerful API that allows you to customize everything </h4>when rendering a specific HTML tag. This means you can change the default behaviour or add support for HTML elements that aren't supported natively. You can also make up your own llows you to customize everything when rendering a specific HTML tag. This means you can change the default behaviour or add support for HTML elements that aren't supported natively. You can also make up your own cust custom tags in your HTML """,
                        data: widget.experience.description != null
                            ? widget.experience.description.toString()
                            : "",
                        style: {
                          "h4": Style(
                            color: Cr.darkGrey1,
                          ),
                          "p": Style(
                            color: Cr.darkGrey1,
                            backgroundColor: Cr.lightGrey2,
                          ),
                          "li": Style(
                            color: Cr.darkGrey1,
                            backgroundColor: Cr.lightGrey2,
                          ),
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Di.PSL),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    color: Cr.lightGrey2,
                    padding: const EdgeInsets.only(left: Di.PSL),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedCrossFade(
                        firstChild: GestureDetector(
                          onTap: () async {
                            setState(() {
                              showMore = !showMore;
                            });
                          },
                          child: Text(
                            r"  + Job Description",
                            style: (bodySmallRegular).copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                        ),
                        secondChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              showMore = !showMore;
                            });
                          },
                          child: Text(
                            r"  - Close",
                            style: (bodySmallRegular).copyWith(
                              color: Cr.accentBlue1,
                            ),
                          ),
                        ),
                        crossFadeState: showMore
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ),
                  ),
                ),
                widget.showComments
                    ? Container(
                        height: 120,
                        color: Cr.whiteColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Di.PSL,
                          vertical: Di.PSS,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.thumb_up,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Like",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Di.SBWOL,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.comment,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Comment",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Di.SBWOL,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.share,
                                      size: 12,
                                      color: Cr.accentBlue1,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "Share",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                    Di.SBWES,
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: Cr.accentBlue3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: dividerTextSmall.copyWith(
                                              color: Cr.accentBlue1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(Di.PSL),
                              child: Row(
                                children: [
                                  const PersonAvatar(
                                    avatarSize: 40,
                                  ),
                                  Di.SBWL,
                                  SizedBox(
                                    width: 360,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Leave a comment",
                                        hintStyle: bodySmallRegular.copyWith(
                                          color: Cr.darkGrey1,
                                        ),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Cr.darkGrey4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePath extends StatelessWidget {
  const CreatePath({
    Key? key,
    required this.date,
    required this.orderStatus,
    required this.orderDescription,
  }) : super(key: key);

  final String date;
  final String orderStatus;
  final String orderDescription;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape
                .circle, // You can use like this way or like the below line
            //borderRadius: new BorderRadius.circular(30.0),
            color: Colors.grey[400],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 7.5, right: 7.5),
                child: Container(
                  width: 1,
                  color: Colors.grey[400],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderStatus,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(date,
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 11)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(orderDescription,
                          style: const TextStyle(
                            color: Cr.darkBlue1,
                          )),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
