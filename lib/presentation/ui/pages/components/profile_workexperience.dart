import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/experience.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/scale_animation.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileWorkExperienceComponent extends StatefulWidget {
  const ProfileWorkExperienceComponent({
    Key? key,
    this.isMobile = false,
    this.isTablet = false,
    this.onEditPressed,
    required this.userProfileData,
  }) : super(key: key);

  final bool isMobile;
  final bool isTablet;
  final User userProfileData;

  final void Function()? onEditPressed;

  @override
  State<ProfileWorkExperienceComponent> createState() =>
      _ProfileWorkExperienceComponentState();
}

class _ProfileWorkExperienceComponentState
    extends State<ProfileWorkExperienceComponent> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    final List<Experience>? experience = DbData.getUserProfileData.experiences;
    final bool hasData = experience != null ? experience.isNotEmpty : false;
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.backgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          Container(
            color: Cr.whiteColor,
            padding: EdgeInsets.only(left: widget.isMobile ? Di.PSD : Di.PSS),
            child: ListTile(
              title: Text(
                "Work experience",
                style: h2Regular,
              ),
            ),
          ),
          Di.DWZH,
          SizedBox(
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  if (hasData)
                    Column(
                      children: experience
                          .map(
                            (singleExperience) => _SingleExperienceWidget(
                              singleExperience: singleExperience,
                              isTablet: widget.isTablet,
                              isMobile: widget.isMobile,
                            ),
                          )
                          .toList(),
                    ),
                  EditBlueCardSheet(
                    context,
                    dataIsNull: !hasData,
                    greenCardText:
                        "Add your current and previous work experiences to your profile. Add as many as you like to highlight your work experience and skills.",
                    greenCardTip:
                        "Work experience is often the number one factor for employers and recruiters when looking to hire new candidates.",
                  ),
                  if (hasData)
                    EditAddButtonOfSheet(
                      context,
                      onEditPressed: () {
                        // showCustomDialog(
                        //   context,
                        //   Profi(
                        //     userProfileData: userProfileData,
                        //   ),
                        // );
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleExperienceWidget extends StatefulWidget {
  const _SingleExperienceWidget({
    Key? key,
    required this.singleExperience,
    required this.isTablet,
    required this.isMobile,
  }) : super(key: key);

  final Experience singleExperience;
  final bool isTablet;
  final bool isMobile;

  @override
  State<_SingleExperienceWidget> createState() =>
      _SingleExperienceWidgetState();
}

class _SingleExperienceWidgetState extends State<_SingleExperienceWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Di.PSS),
      child: Container(
        width: (widget.isTablet || widget.isMobile) ? double.infinity : 360,
        decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Di.SBCH(18),
            ListTile(
              leading: ContainerWithIcon(
                iconData: FontAwesomeIcons.buildingColumns,
                size: 50,
              ),
              title: Text(
                widget.singleExperience.title ?? "",
                // "Food and Beverage Manager",
                style: h4Bold.copyWith(
                  fontSize: Di.FSD,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.singleExperience.companyName ?? "",
                    // "Marriott Hotels)",
                    style: bodySmallRegular.copyWith(
                      color: Cr.accentBlue1,
                      fontSize: Di.FSS,
                    ),
                  ),
                  Text(
                    widget.singleExperience.workDuration ?? "",
                    // "February 2013 – 2014 (1 year 6 months)",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                      fontSize: Di.FSS,
                    ),
                  ),
                ],
              ),
            ),
            Di.SBHD,
            Di.DWZH,
            Container(
              width: double.infinity,
              color: Cr.lightGrey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandedSection(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: Di.PSD,
                        right: Di.PSD,
                      ),
                      child: Text(
                        // singleExperience
                        //         .description ??
                        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: bodyLarge.copyWith(
                          color: Cr.darkGrey1,
                        ),
                      ),
                    ),
                    expand: showMore,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: Cr.lightGrey2,
                    padding: EdgeInsets.only(left: Di.PSL),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedCrossFade(
                        firstChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              showMore = !showMore;
                            });
                          },
                          child: Text(
                            r"  + Show more",
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
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                  ),
                  // Di.SBHS,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
