import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/education.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/scale_animation.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class EducationComponent extends StatefulWidget {
  const EducationComponent({
    Key? key,
    this.onEditPressed,
    required this.userProfileData,
    this.isMobile = false,
    this.isTablet = false,
  }) : super(key: key);
  final User userProfileData;
  final void Function()? onEditPressed;
  final bool isMobile;
  final bool isTablet;

  @override
  State<EducationComponent> createState() => _EducationComponentState();
}

class _EducationComponentState extends State<EducationComponent> {
  @override
  Widget build(BuildContext context) {
    final List<Education>? education = DbData.getUserProfileData.educations;
    final bool hasData = education != null ? education.isNotEmpty : false;
    bool showMore = false;

    return Container(
      decoration:
          Styles.boxDecorationWithShadow.copyWith(color: Cr.backgroundColor),
      child: Column(
        children: [
          Di.SBHETS,
          Container(
            color: Cr.whiteColor,
            child: ListTile(
              title: Text(
                "Education",
                style: h2Regular,
              ),
            ),
          ),
          Di.DWZH,
          IntrinsicHeight(
            child: Stack(
              children: [
                if (hasData)
                  Column(
                    children: education
                        .map(
                          (singleEductaion) => Container(
                            margin: EdgeInsets.only(bottom: Di.PSS),
                            width: widget.isMobile ? null : 360,
                            decoration: Styles.boxDecoration.copyWith(
                              color: Cr.whiteColor,
                              boxShadow: Styles.defaultBoxShadow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Di.SBCH(18),
                                ListTile(
                                  leading: ContainerWithIcon(
                                    iconData: FontAwesomeIcons.buildingColumns,
                                    size: 50,
                                  ),
                                  title: Text(
                                    singleEductaion.institution ?? "",
                                    style: h4Bold.copyWith(
                                      fontSize: Di.FSD,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        singleEductaion.title ?? "",
                                        style: bodySmallRegular.copyWith(
                                          color: Cr.accentBlue1,
                                          fontSize: Di.FSS,
                                        ),
                                      ),
                                      SizedBox(height: Di.PSETS),
                                      Text(
                                        singleEductaion.studyDuration ?? "",
                                        // "2010 - 2013",
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
                                _SingleEducationWidget(
                                  singleEducation: singleEductaion,
                                  isTablet: widget.isTablet,
                                  isMobile: widget.isMobile,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                EditBlueCardSheet(
                  context,
                  dataIsNull: !hasData,
                  greenCardText:
                      "Add the educational institutions you attended, the qualifications you achieved and the courses completed. ",
                ),
                if (hasData)
                  EditAddButtonOfSheet(
                    context,
                    onEditPressed: () {
                      // buildReferencesCard(img, title, userId, subTitle, description)
                      // showCustomDialog(
                      //   context,
                      //   ProfileMyReferenceDialogWidget(
                      //     userProfileData: DbData.getUserProfileData,
                      //   ),
                      // );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleEducationWidget extends StatefulWidget {
  const _SingleEducationWidget({
    Key? key,
    required this.singleEducation,
    required this.isTablet,
    required this.isMobile,
  }) : super(key: key);

  final Education singleEducation;
  final bool isTablet;
  final bool isMobile;

  @override
  State<_SingleEducationWidget> createState() => _SingleEducationWidgetState();
}

class _SingleEducationWidgetState extends State<_SingleEducationWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Cr.lightGrey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Di.SBCH(12),
          ExpandedSection(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: Di.PSD,
                right: Di.PSD,
              ),
              child: Text(
                // singleEducation
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
    );
  }
}
