import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/achievement.dart';
import 'package:holedo/models/holedoapi/education.dart';
import 'package:holedo/models/holedoapi/experience.dart';
import 'package:holedo/presentation/classes.dart';
import 'package:holedo/presentation/functions/helper_functions.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/svg_with_background.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/expanded_section.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
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
                children: const [
                  ProfileCompletionComponent(),
                  Di.SBHEL,
                  ConnectionsComponent(),
                  ProfileAdsComponent(),
                  RightsComponent(),
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
    return SizedBox(
      width: 620,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: timelineClasslist.length,
        itemBuilder: (context, index) {
          final TimelineClass timelineClass = timelineClasslist[index];
          if (timelineClass.timelineClassType == TimelineClassTypes.Education) {
            // return Di.ESB;
            return EducationTimeLineWidget(
              showComments: index == timelineClasslist.length - 1,
              education: timelineClass.timeline as Education,
            );
          } else if (timelineClass.timelineClassType ==
              TimelineClassTypes.Achievement) {
            // return Di.ESB;

            return AchievementTimeLineWidget(
              showComments: index == timelineClasslist.length - 1,
              achievement: timelineClass.timeline as Achievement,
            );
          } else if (timelineClass.timelineClassType ==
              TimelineClassTypes.Experience) {
            return ExperienceTimeLineWidget(
              showComments: index == timelineClasslist.length - 1,
              experience: timelineClass.timeline as Experience,
            );
          }
          return Di.ESB;
        },
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
              const _TimelineFirstWidget(),
              const _TimelineSecondWidget(),
              _TimelineStartYearText(
                year: widget.achievement.created!.year.toString(),
              ),
            ],
          ),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                _TimelineTitleSubtitleDurationWidget(
                  duration: widget.achievement.dateIssued ?? "",
                  subtitle: "${widget.achievement.issuingEntity}",
                  title: widget.achievement.title ?? "",
                  svgName: Svgs.school,
                ),
                if (widget.achievement.description != null)
                  _TimelineExpandedSection(
                    showMore: showMore,
                    description: widget.achievement.description != null
                        ? widget.achievement.description.toString()
                        : "",
                  ),
                _TimelineButtons(
                  showMore: showMore,
                  collapsedButtonText: "  + Description",
                  expandedButtonText: "  - Close",
                  onCollpaseButtonPressed: () async {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  onExpandedButtonPressed: () async {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                ),
                if (widget.showComments)
                  const _TimelineCommentWidget()
                else
                  const SizedBox(),
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
              const _TimelineFirstWidget(),
              const _TimelineSecondWidget(),
              _TimelineStartYearText(
                year: widget.experience.fromDate!.year.toString(),
              ),
            ],
          ),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                _TimelineTitleSubtitleDurationWidget(
                  duration: widget.experience.workDuration ?? "",
                  subtitle:
                      "${widget.experience.companyName == null ? '' : '${widget.experience.companyName!} · '}${widget.experience.area}",
                  title: widget.experience.title ?? "",
                  svgName: Svgs.domain,
                ),
                if (widget.experience.description != null)
                  _TimelineExpandedSection(
                    showMore: showMore,
                    description: widget.experience.description != null
                        ? widget.experience.description.toString()
                        : "",
                  ),
                _TimelineButtons(
                  showMore: showMore,
                  collapsedButtonText: "  + Description",
                  expandedButtonText: "  - Close",
                  onCollpaseButtonPressed: () async {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  onExpandedButtonPressed: () async {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                ),
                if (widget.showComments)
                  const _TimelineCommentWidget()
                else
                  const SizedBox(),
              ],
            ),
          ),
        ],
      ),
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
              const _TimelineFirstWidget(),
              const _TimelineSecondWidget(),
              _TimelineStartYearText(
                year: widget.education.durationFromDate!.year.toString(),
              ),
            ],
          ),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                _TimelineTitleSubtitleDurationWidget(
                  duration: widget.education.studyDuration ?? "",
                  subtitle:
                      "${widget.education.institution} · ${widget.education.area}",
                  title: widget.education.title ?? "",
                  svgName: Svgs.school,
                ),
                if (widget.education.description != null)
                  _TimelineExpandedSection(
                    showMore: showMore,
                    description: widget.education.description!,
                  ),
                _TimelineButtons(
                  showMore: showMore,
                  collapsedButtonText: "  + Description",
                  expandedButtonText: "  - Close",
                  onCollpaseButtonPressed: () async {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  onExpandedButtonPressed: () async {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                ),
                if (widget.showComments)
                  const _TimelineCommentWidget()
                else
                  const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineButtons extends StatelessWidget {
  const _TimelineButtons({
    Key? key,
    required this.showMore,
    required this.collapsedButtonText,
    required this.onCollpaseButtonPressed,
    required this.expandedButtonText,
    required this.onExpandedButtonPressed,
  }) : super(key: key);

  final bool showMore;
  final String collapsedButtonText;
  final Future<void> Function() onCollpaseButtonPressed;
  final String expandedButtonText;
  final Future<void> Function() onExpandedButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              onTap: onCollpaseButtonPressed,
              child: Text(
                collapsedButtonText,
                style: bodySmallRegular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
            ),
            secondChild: GestureDetector(
              onTap: onExpandedButtonPressed,
              child: Text(
                expandedButtonText,
                style: bodySmallRegular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
            ),
            crossFadeState:
                showMore ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }
}

class _TimelineExpandedSection extends StatelessWidget {
  const _TimelineExpandedSection({
    Key? key,
    required this.showMore,
    required this.description,
  }) : super(key: key);

  final bool showMore;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: showMore,
      child: Container(
        width: 550,
        color: Cr.lightGrey2,
        padding: const EdgeInsets.only(
          left: Di.PSL,
          right: Di.PSL,
          top: 12,
        ),
        child: Text(
          description,
          style: bodyLarge.copyWith(color: Cr.darkGrey1),
        ),
        //  Html(
        //   data: description,
        //   style: {
        //     "h4": Style(
        //       color: Cr.darkGrey1,
        //     ),
        //     "p": Style(
        //       color: Cr.darkGrey1,
        //       backgroundColor: Cr.lightGrey2,
        //     ),
        //     "li": Style(
        //       color: Cr.darkGrey1,
        //       backgroundColor: Cr.lightGrey2,
        //     ),
        //   },
        // ),
      ),
    );
  }
}

class _TimelineTitleSubtitleDurationWidget extends StatelessWidget {
  const _TimelineTitleSubtitleDurationWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.svgName,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String duration;
  final String svgName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      color: Cr.whiteColor,
      padding: const EdgeInsets.symmetric(
        horizontal: Di.PSL,
        vertical: Di.PSD,
      ),
      child: Row(
        children: [
          SvgWithBackground(svg: svgName),
          Di.SBWD,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: h4Bold.copyWith(
                  color: Cr.darkBlue1,
                ),
              ),
              Text(
                subtitle,
                style: bodySmallRegular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                duration,
                style: bodySmallRegular.copyWith(
                  color: const Color.fromRGBO(124, 137, 144, 1),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineCommentWidget extends StatelessWidget {
  const _TimelineCommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 4),
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
                      padding: const EdgeInsets.symmetric(horizontal: 4),
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
                      padding: const EdgeInsets.symmetric(horizontal: 4),
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
    );
  }
}

class _TimelineFirstWidget extends StatelessWidget {
  const _TimelineFirstWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Di.PSOTL),
      child: Container(
        width: 3,
        color: Cr.darkGrey3,
      ),
    );
  }
}

class _TimelineSecondWidget extends StatelessWidget {
  const _TimelineSecondWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _TimelineStartYearText extends StatelessWidget {
  const _TimelineStartYearText({
    Key? key,
    required this.year,
  }) : super(key: key);
  final String year;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Di.PSOTL,
      ),
      child: SizedBox(
        width: 27,
        child: Text(
          year,
          maxLines: 1,
          style: dividerTextSmall.copyWith(
            // overflow: TextOverflow.fade,
            color: Cr.darkGrey1,
          ),
        ),
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
                      Text(
                        orderStatus,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        date,
                        style: TextStyle(color: Colors.grey[400], fontSize: 11),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        orderDescription,
                        style: const TextStyle(
                          color: Cr.darkBlue1,
                        ),
                      ),
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
