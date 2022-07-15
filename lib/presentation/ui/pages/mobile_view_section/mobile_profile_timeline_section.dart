import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class MobileProfileTimelineSection extends StatefulWidget {
  const MobileProfileTimelineSection({
    Key? key,
    required this.isMobilePhn,
    required this.isTablt,
    required this.showComments,
    this.jobDescriptionInHtml,
  }) : super(key: key);
  final bool showComments;
  final String? jobDescriptionInHtml;
  final bool isMobilePhn;
  final bool isTablt;

  @override
  State<MobileProfileTimelineSection> createState() =>
      _MobileProfileTimelineSectionState();
}

class _MobileProfileTimelineSectionState
    extends State<MobileProfileTimelineSection> {
  @override
  Widget build(BuildContext context) {
    // final userProfileData = DbData.getUserProfileData;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Di.PSS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isMobilePhn) const ProfileCompletionComponent(),
          if (widget.isMobilePhn)
            _MobileTimelineSection(
              jobDescriptionInHtml: widget.jobDescriptionInHtml,
              showComments: widget.showComments,
            )
          else
            const TimelineSectionComponent(),
          Di.SBHD,
          if (widget.isTablt) const ProfileCompletionComponent(),
          const ConnectionsComponent(
            isMobile: true,
          ),
          Di.SBHS,
          const ProfileAdsComponent(),
          Di.SBHS,
          const RightsComponent(
            isMobile: true,
          ),
          Di.SBHOTL,
        ],
      ),
    );
  }
}

class _MobileTimelineSection extends StatefulWidget {
  const _MobileTimelineSection({
    Key? key,
    required this.jobDescriptionInHtml,
    required this.showComments,
  }) : super(key: key);

  final String? jobDescriptionInHtml;
  final bool showComments;

  @override
  State<_MobileTimelineSection> createState() => _MobileTimelineSectionState();
}

class _MobileTimelineSectionState extends State<_MobileTimelineSection> {
  @override
  Widget build(BuildContext context) {
    // return _ProfileMobileTimelineTile(
    //   jobDescriptionInHtml: jobDescriptionInHtml,
    //   showComments: showComments,
    // );

    return Column(
      children: [
        // _MobileTimelinePath(
        //   year: timelineClasslist.last.dateTime.year.toString(),
        // ),
        _ProfileMobileTimelineTile(
          jobDescriptionInHtml: widget.jobDescriptionInHtml,
          showComments: widget.showComments,
        ),
        _ProfileMobileTimelineTile(
          jobDescriptionInHtml: widget.jobDescriptionInHtml,
          showComments: widget.showComments,
        ),
        _ProfileMobileTimelineTile(
          jobDescriptionInHtml: widget.jobDescriptionInHtml,
          showComments: widget.showComments,
        ),
        // _MobileTimelinePath(
        //   year: timelineClasslist.last.dateTime.year.toString(),
        // ),
      ],
    );
  }
}

class _MobileTimelinePath extends StatelessWidget {
  const _MobileTimelinePath({
    Key? key,
    required this.year,
  }) : super(key: key);
  final String year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Di.PSS),
      child: SizedBox(
        height: 53,
        child: Stack(
          children: [
            Positioned(
              left: 30,
              child: Container(
                width: 3,
                height: 53,
                color: Cr.darkGrey3,
              ),
            ),
            Positioned(
              left: 48,
              top: 18.5,
              child: Text(
                year,
                style: dividerTextSmall.copyWith(
                  color: Cr.darkGrey1,
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 18,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Cr.darkGrey3,
                    width: 3.5,
                  ),
                  shape: BoxShape
                      .circle, // You can use like this way or like the below line
                  //borderRadius: new BorderRadius.circular(30.0),
                  color: Cr.darkGrey4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileMobileTimelineTile extends StatelessWidget {
  const _ProfileMobileTimelineTile({
    Key? key,
    required this.jobDescriptionInHtml,
    required this.showComments,
  }) : super(key: key);

  final String? jobDescriptionInHtml;
  final bool showComments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CreatePath(date: date, orderStatus: orderStatus, orderDescription: orderDescription)
        Di.SBHS,
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
                    "Food and Beverage Manager",
                    style: h4Bold.copyWith(
                      color: Cr.darkBlue1,
                    ),
                  ),
                  Text(
                    "Marriott Hotels · Cape Town",
                    style: bodySmallRegular.copyWith(
                      color: Cr.accentBlue1,
                    ),
                  ),
                  Text(
                    "February 2013 – present (1 year 6 months)",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        if (jobDescriptionInHtml != null)
          Container(
            // height: 123,
            width: 550,
            color: Cr.lightGrey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 518,
                  // height: 66,
                  child: Html(
                    data: jobDescriptionInHtml,
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
                  // child: Text(
                  //   jobDescriptionInHtml!,
                  //   style: bodyLarge.copyWith(
                  //     color: Cr.darkGrey1,
                  //   ),
                  // ),
                ),
                Di.SBHES,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    text: "  - Close",
                  ),
                ),
                const SizedBox(
                  height: Di.PSS,
                ),
              ],
            ),
          )
        else
          Container(
            width: double.infinity,
            height: 40,
            color: Cr.lightGrey2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Di.PSL,
                vertical: Di.PSS,
              ),
              child: Text(
                "  + Job Description",
                style: bodySmallRegular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
            ),
          ),
        if (showComments)
          Container(
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
          )
        else
          const SizedBox(),
      ],
    );
  }
}
