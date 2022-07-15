import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/experience.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/presentation/ui/components/svg_with_background.dart';
import 'package:holedo/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_work_experience_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
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
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final List<Experience>? experience = DbData.getUserProfileData.experiences;
    final bool hasData = experience != null ? experience.isNotEmpty : false;
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Cr.whiteColor,
              ),
              child: ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed: () {
                  setState(() {
                    showSubMenu = !showSubMenu;
                  });
                },
                title: "Work experience",
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
                                isLast: experience.indexOf(singleExperience) ==
                                    (experience.length - 1),
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
                          showCustomDialog(
                            context,
                            ProfileWorkExperienceDialogWidget(
                              experience: experience,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (showSubMenu)
          Positioned(
            right: 8,
            top: 41,
            child: ViewTimeEditProfileSubmenu(
              hideSubMenuCallback: () {
                setState(() {
                  showSubMenu = false;
                });
              },
              editText: 'work experience',
            ),
          ),
      ],
    );
  }
}

class _SingleExperienceWidget extends StatefulWidget {
  const _SingleExperienceWidget({
    Key? key,
    required this.singleExperience,
    required this.isTablet,
    required this.isMobile,
    this.isLast = false,
  }) : super(key: key);

  final Experience singleExperience;
  final bool isTablet;
  final bool isMobile;
  final bool isLast;

  @override
  State<_SingleExperienceWidget> createState() =>
      _SingleExperienceWidgetState();
}

class _SingleExperienceWidgetState extends State<_SingleExperienceWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.isLast ? 0 : Di.PSS),
      child: Container(
        width: (widget.isTablet || widget.isMobile) ? double.infinity : 360,
        decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Di.SBCH(18),
            ListTile(
              leading: const SvgWithBackground(
                svg: Svgs.domain,
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
            if (widget.singleExperience.description != null)
              ExpandedCollapseWidget(
                description: widget.singleExperience.description!,
                isMobile: widget.isMobile,
                isTablet: widget.isTablet,
              )
            // ExpandedCollapseWidget(),
          ],
        ),
      ),
    );
  }
}

// class ExpandedCollapseWidget extends StatelessWidget {
//   const ExpandedCollapseWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Cr.lightGrey2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ExpandedSection(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 top: 12,
//                 left: Di.PSD,
//                 right: Di.PSD,
//               ),
//               child: Text(
//                 // singleExperience
//                 //         .description ??
//                 "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//                 maxLines: 5,
//                 overflow: TextOverflow.ellipsis,
//                 style: bodyLarge.copyWith(
//                   color: Cr.darkGrey1,
//                 ),
//               ),
//             ),
//             expand: showMore,
//           ),
//           Container(
//             height: 40,
//             width: double.infinity,
//             color: Cr.lightGrey2,
//             padding: EdgeInsets.only(left: Di.PSL),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: AnimatedCrossFade(
//                 firstChild: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showMore = !showMore;
//                     });
//                   },
//                   child: Text(
//                     r"  + Show more",
//                     style: (bodySmallRegular).copyWith(
//                       color: Cr.accentBlue1,
//                     ),
//                   ),
//                 ),
//                 secondChild: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showMore = !showMore;
//                     });
//                   },
//                   child: Text(
//                     r"  - Close",
//                     style: (bodySmallRegular).copyWith(
//                       color: Cr.accentBlue1,
//                     ),
//                   ),
//                 ),
//                 crossFadeState: showMore
//                     ? CrossFadeState.showSecond
//                     : CrossFadeState.showFirst,
//                 duration: Duration(milliseconds: 200),
//               ),
//             ),
//           ),
//           // Di.SBHS,
//         ],
//       ),
//     );
//   }
// }
