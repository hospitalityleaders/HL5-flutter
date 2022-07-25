import 'package:flutter/material.dart';

import 'package:holedo/profile/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/profile/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/profile/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/profile/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/profile/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_expertise_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_summary_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/responsive.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileOverviewFirstColumn extends StatefulWidget {
  const ProfileOverviewFirstColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileOverviewFirstColumn> createState() =>
      _ProfileOverviewFirstColumnState();
}

class _ProfileOverviewFirstColumnState
    extends State<ProfileOverviewFirstColumn> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final userProfileData = profileProvider.userProfileData!;
    final bool editAbleOrMyProfile =
        profileProvider.isMyProfile && profileProvider.isProfileEditable;
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (editAbleOrMyProfile ||
              (userProfileData.profileSummary?.isNotEmpty ?? false)) ...[
            ProfileSummaryComponent(),
            Di.SBHETS,
          ],
          if (editAbleOrMyProfile ||
              (userProfileData.expertise?.isNotEmpty ?? false)) ...[
            AreasOfExpertiseComponents(),
            Di.SBHL,
          ],
          if (editAbleOrMyProfile ||
              (userProfileData.receivedReferences?.isNotEmpty ?? false))
            ProfileReferenceComponent(),
        ],
      ),
    );
  }
}

class ProfileSummaryComponent extends StatefulWidget {
  const ProfileSummaryComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;
  @override
  State<ProfileSummaryComponent> createState() =>
      _ProfileSummaryComponentState();
}

class _ProfileSummaryComponentState extends State<ProfileSummaryComponent> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final userProfileData =
        Provider.of<ProfileProvider>(context).userProfileData!;
    final isMobilePhn = isMobilePhone(context);

    return Container(
      margin: EdgeInsets.only(bottom: widget.isMobile ? Di.PSS : Di.PSD),
      decoration: boxDecoration.copyWith(
        color: Cr.whiteColor,
        boxShadow: defaultBoxShadow,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed:
                    (Provider.of<ProfileProvider>(context).isMyProfile)
                        ? () {
                            setState(() {
                              showSubMenu = !showSubMenu;
                            });
                          }
                        : null,
                title: "Profile summary",
              ),
              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    if (isMobilePhn)
                      ExpandedCollapseWidget(
                        description: userProfileData.profileSummary ?? "",
                        isMobile: widget.isMobile,
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Di.PSD,
                          right: Di.PSD,
                          top: Di.PSD,
                          bottom: Di.PSD,
                        ),
                        child: Text(
                          userProfileData.profileSummary ?? "",
                          maxLines: widget.isMobile ? 6 : null,
                          style: bodyLarge.copyWith(color: Cr.darkGrey1),
                        ),
                      ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: userProfileData.profileSummary == null,
                      greenCardText:
                          "Add a written profile summary about your professional career, skills, work experience and achievements. Promote yourself and get recognised by other people.",
                      greenCardTip:
                          "People with detailed profile summaries are 95% more likely to be viewed and connected with.",
                      onAddPressed: () {
                        showCustomDialog(
                          context,
                          ProfileSummaryDialogWidget(
                            userProfileData: userProfileData,
                          ),
                        );
                      },
                    ),
                    if (userProfileData.profileSummary != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          showCustomDialog(
                            context,
                            ProfileSummaryDialogWidget(
                              userProfileData: userProfileData,
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
              child: SizedBox(
                child: ViewTimeEditProfileSubmenu(
                  donotShowTimeline: true,
                  hideSubMenuCallback: () {
                    setState(() {
                      showSubMenu = false;
                    });
                  },
                  editText: 'profile summary',
                ),
              ),
            )
        ],
      ),
    );
  }
}

class AreasOfExpertiseComponents extends StatefulWidget {
  const AreasOfExpertiseComponents({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  State<AreasOfExpertiseComponents> createState() =>
      _AreasOfExpertiseComponentsState();
}

class _AreasOfExpertiseComponentsState
    extends State<AreasOfExpertiseComponents> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final expertise =
        Provider.of<ProfileProvider>(context).userProfileData!.expertise;

    return DecoratedBox(
      decoration: boxDecorationWithShadow.copyWith(color: Cr.whiteColor),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed:
                    (Provider.of<ProfileProvider>(context).isMyProfile)
                        ? () {
                            setState(() {
                              showSubMenu = !showSubMenu;
                            });
                          }
                        : null,
                title: "Areas of expertise",
              ),

              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Di.SBHD,
                          if (Provider.of<ProfileProvider>(context)
                                  .userProfileData!
                                  .expertise !=
                              null)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: List<Widget>.generate(
                                  expertise!.length,
                                  (int idx) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: CustomCheckboxWithTitle(
                                        title: (expertise[idx]).title ?? "",
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          Di.SBHD,
                        ],
                      ),
                    ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: expertise == null,
                      // dataIsNull: expertise == null,
                      greenCardText:
                          "List your skill set and areas of focus for other connections and potential employers to view.",
                      onAddPressed: () {
                        showCustomDialog(
                          context,
                          const ProfileExpertiseDialogWidget(),
                        );
                      },
                    ),
                    if (expertise != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          showCustomDialog(
                            context,
                            const ProfileExpertiseDialogWidget(),
                          );
                        },
                        onAddPressed: () {
                          showCustomDialog(
                            context,
                            const ProfileExpertiseDialogWidget(),
                          );
                          // buildAreaOfExpePopUp(context);
                        },
                      ),
                  ],
                ),
              ),

              // Training
            ],
          ),
          if (showSubMenu)
            Positioned(
              right: 8,
              top: 41,
              child: ViewTimeEditProfileSubmenu(
                donotShowTimeline: true,
                hideSubMenuCallback: () {
                  setState(() {
                    showSubMenu = false;
                  });
                },
                editText: 'area of expertise',
              ),
            ),
        ],
      ),
    );
  }
}
