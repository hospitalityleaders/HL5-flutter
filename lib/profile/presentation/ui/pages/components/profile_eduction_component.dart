import 'package:flutter/material.dart';

import 'package:holedo/models/holedoapi/education.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/profile/presentation/ui/components/svg_with_background.dart';
import 'package:holedo/profile/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/profile/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/profile/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_education_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/images.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

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
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final List<Education>? education =
        // Provider.of<ProfileProvider>(context).
        Provider.of<ProfileProvider>(
      context,
    ).userProfileData!.educations;
    final bool hasData = education != null ? education.isNotEmpty : false;

    return Container(
      color: Cr.backgroundColor,
      child: Stack(
        children: [
          Column(
            children: [
              ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed: () {
                  setState(() {
                    showSubMenu = !showSubMenu;
                  });
                },
                title: "Education",
              ),
              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    if (hasData)
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: education.length,
                          itemBuilder: (BuildContext context, int index) {
                            final singleEductaion = education[index];
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: education.indexOf(singleEductaion) ==
                                        (education.length - 1)
                                    ? Di.PSS
                                    : Di.PSS,
                              ),
                              width: widget.isMobile ? null : 360,
                              decoration: boxDecoration.copyWith(
                                color: Cr.whiteColor,
                                boxShadow: defaultBoxShadow,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Di.SBCH(18),
                                  ListTile(
                                    leading: const SvgWithBackground(
                                      svg: Svgs.school,
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
                                        const SizedBox(height: Di.PSETS),
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
                                  if (singleEductaion.description != null)
                                    ExpandedCollapseWidget(
                                      showText: "Course online",
                                      description: singleEductaion.description!,
                                      isTablet: widget.isTablet,
                                      isMobile: widget.isMobile,
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    // if (hasData)
                    //   Column(
                    //     children: education
                    //         .map(
                    //           (singleEductaion) => Container(
                    //             margin: EdgeInsets.only(
                    //               bottom:
                    //                   education.indexOf(singleEductaion) ==
                    //                           (education.length - 1)
                    //                       ? 0
                    //                       : Di.PSS,
                    //             ),
                    //             width: widget.isMobile ? null : 360,
                    //             decoration: boxDecoration.copyWith(
                    //               color: Cr.whiteColor,
                    //               boxShadow: defaultBoxShadow,
                    //             ),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               children: [
                    //                 Di.SBCH(18),
                    //                 ListTile(
                    //                   leading: const SvgWithBackground(
                    //                     svg: Svgs.school,
                    //                   ),
                    //                   title: Text(
                    //                     singleEductaion.institution ?? "",
                    //                     style: h4Bold.copyWith(
                    //                       fontSize: Di.FSD,
                    //                     ),
                    //                   ),
                    //                   subtitle: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         singleEductaion.title ?? "",
                    //                         style: bodySmallRegular.copyWith(
                    //                           color: Cr.accentBlue1,
                    //                           fontSize: Di.FSS,
                    //                         ),
                    //                       ),
                    //                       const SizedBox(height: Di.PSETS),
                    //                       Text(
                    //                         singleEductaion.studyDuration ??
                    //                             "",
                    //                         // "2010 - 2013",
                    //                         style: bodySmallRegular.copyWith(
                    //                           color: Cr.darkGrey1,
                    //                           fontSize: Di.FSS,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 if (singleEductaion.description != null)
                    //                   ExpandedCollapseWidget(
                    //                     showText: "Course online",
                    //                     description:
                    //                         singleEductaion.description!,
                    //                     isTablet: widget.isTablet,
                    //                     isMobile: widget.isMobile,
                    //                   ),
                    //               ],
                    //             ),
                    //           ),
                    //         )
                    //         .toList(),
                    //   ),
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
                          showCustomDialog(
                            context,
                            ProfileEducationDialogWidget(
                              educations:
                                  //  ref
                                  //         .watch(profileNotifierProvider)
                                  Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .userProfileData!
                                          .educations ??
                                      <Education>[],
                            ),
                          );
                        },
                      ),
                  ],
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
                editText: 'education',
              ),
            ),
        ],
      ),
    );
  }
}
