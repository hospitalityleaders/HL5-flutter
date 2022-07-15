import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/profile/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/profile/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/profile/presentation/ui/components/profile_reference_single_compoenet.dart';
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
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ProfileSummaryComponent(),
          Di.SBHETS,
          AreasOfExpertiseComponents(),
          Di.SBHL,
          ProfileReferenceComponent(),
        ],
      ),
    );
  }
}

class ProfileSummaryComponent extends ConsumerStatefulWidget {
  const ProfileSummaryComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;
  @override
  ConsumerState<ProfileSummaryComponent> createState() =>
      _ProfileSummaryComponentState();
}

class _ProfileSummaryComponentState
    extends ConsumerState<ProfileSummaryComponent> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final String? profileSummary =
        ref.watch(profileNotifierProvider).userProfileData!.profileSummary;
    final isMobilePhn = isMobilePhone(context);

    return Container(
      margin: const EdgeInsets.only(bottom: Di.PSD),
      decoration: boxDecoration.copyWith(
        color: Cr.whiteColor,
        boxShadow: defaultBoxShadow,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 46,
                padding: EdgeInsets.only(
                  left: widget.isMobile ? Di.PSD : Di.PSL,
                  right: 7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile summary",
                      style: h2Regular,
                    ),
                    CustomComponentDropdown(
                      size: 32,
                      iconSize: 13,
                      onTappedInside: () {
                        setState(() {
                          showSubMenu = !showSubMenu;
                        });
                      },
                      onTappedOutside: () {
                        // setState(() {
                        //   showSubMenu = false;
                        // });
                      },
                    ),
                  ],
                ),
              ),
              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    if (isMobilePhn)
                      ExpandedCollapseWidget(
                        description: profileSummary ?? "",
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
                          profileSummary ?? "",
                          maxLines: widget.isMobile ? 6 : null,
                          style: bodyLarge.copyWith(color: Cr.darkGrey1),
                        ),
                      ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: profileSummary == null,
                      greenCardText:
                          "Add a written profile summary about your professional career, skills, work experience and achievements. Promote yourself and get recognised by other people.",
                      greenCardTip:
                          "People with detailed profile summaries are 95% more likely to be viewed and connected with.",
                      onAddPressed: () {
                        showCustomDialog(
                          context,
                          ProfileSummaryDialogWidget(
                            userProfileData: ref
                                .watch(profileNotifierProvider)
                                .userProfileData!,
                          ),
                        );
                      },
                    ),
                    if (profileSummary != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          showCustomDialog(
                            context,
                            ProfileSummaryDialogWidget(
                              userProfileData: ref
                                  .watch(profileNotifierProvider)
                                  .userProfileData!,
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
                donotShowTimeline: true,
                hideSubMenuCallback: () {
                  setState(() {
                    showSubMenu = false;
                  });
                },
                editText: 'profile summary',
              ),
            ),
        ],
      ),
    );
  }
}

class AreasOfExpertiseComponents extends ConsumerStatefulWidget {
  const AreasOfExpertiseComponents({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  ConsumerState<AreasOfExpertiseComponents> createState() =>
      _AreasOfExpertiseComponentsState();
}

class _AreasOfExpertiseComponentsState
    extends ConsumerState<AreasOfExpertiseComponents> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final expertise =
        ref.watch(profileNotifierProvider).userProfileData!.expertise;
    return DecoratedBox(
      decoration: boxDecorationWithShadow.copyWith(color: Cr.whiteColor),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed: () {
                  setState(() {
                    showSubMenu = !showSubMenu;
                  });
                },
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
                          if (ref
                                  .watch(profileNotifierProvider)
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
