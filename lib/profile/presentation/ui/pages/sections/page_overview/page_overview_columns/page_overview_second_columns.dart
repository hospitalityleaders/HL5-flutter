import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:holedo/models/holedoapi/achievement.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/models/holedoapi/language.dart';
import 'package:holedo/profile/presentation/data/presentation_data.dart';
import 'package:holedo/profile/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/profile/presentation/ui/components/profile_reference_single_compoenet.dart';
import 'package:holedo/profile/presentation/ui/components/svg_with_background.dart';
import 'package:holedo/profile/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/profile/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/profile/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_eduction_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_workexperience.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_achievement_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_featured_video_dialog.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_language_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/images.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_web/video_player_web.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileOverviewSecondColumn extends StatefulWidget {
  const ProfileOverviewSecondColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileOverviewSecondColumn> createState() =>
      _ProfileOverviewSecondColumnState();
}

class _ProfileOverviewSecondColumnState
    extends State<ProfileOverviewSecondColumn> {
  late VideoPlayerPlugin videoPlayerPlugin;

  @override
  Widget build(BuildContext context) {
    final userProfileData =
        Provider.of<ProfileProvider>(context).userProfileData!;
    final profileProvider = (Provider.of<ProfileProvider>(context));

    final bool editAbleOrMyProfile =
        profileProvider.isMyProfile && profileProvider.isProfileEditable;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (editAbleOrMyProfile ||
            (userProfileData.profileVideoUrl?.isNotEmpty ?? false)) ...[
          FeaturedVideoComponent(
            userProfileData: userProfileData,
          ),
          Di.SBHL,
        ],
        if (editAbleOrMyProfile ||
            (userProfileData.experiences?.isNotEmpty ?? false)) ...[
          ProfileWorkExperienceComponent(
            userProfileData: userProfileData,
          ),
          Di.SBHL,
        ],
        if (editAbleOrMyProfile ||
            (userProfileData.educations?.isNotEmpty ?? false)) ...[
          EducationComponent(
            userProfileData: userProfileData,
          ),
          Di.SBHL,
        ],
        if (editAbleOrMyProfile ||
            (userProfileData.achievements?.isNotEmpty ?? false)) ...[
          const AchievementComponent(),
          Di.SBHEL,
        ],
        // if (editAbleOrMyProfile ||
        //     (userProfileData.languages?.isNotEmpty ?? false)) ...[
        //   LanguagesComponent(
        //     // onEditPressed: () => buildLanguagePopUp(langIndex),
        //     userProfileData: userProfileData,
        //   ),
        //   Di.SBHEL,
        // ],
      ],
    );
  }
}

class LanguagesComponent extends StatefulWidget {
  const LanguagesComponent({
    Key? key,
    this.isMobile = false,
    this.onEditPressed,
    required this.userProfileData,
  }) : super(key: key);
  final User userProfileData;
  final void Function()? onEditPressed;
  final bool isMobile;

  @override
  State<LanguagesComponent> createState() => _LanguagesComponentState();
}

class _LanguagesComponentState extends State<LanguagesComponent> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final List<Language>? languages = Provider.of<ProfileProvider>(context)
        .userProfileData!
        .languages as List<Language>?;
    final bool hasData = languages != null ? languages.isNotEmpty : false;

    return Container(
      decoration: boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          ProfileComponentTitle(
            isMobile: widget.isMobile,
            onIconPressed: (Provider.of<ProfileProvider>(context).isMyProfile)
                ? () {
                    setState(() {
                      showSubMenu = !showSubMenu;
                    });
                  }
                : null,
            title: "Languages",
          ),
          IntrinsicHeight(
            child: Stack(
              children: [
                if (hasData)
                  Column(
                    children: languages
                        .map(
                          (singleLanguage) => Column(
                            children: [
                              Di.DWZH,
                              Di.SBHS,
                              Container(
                                width: 360,
                                decoration: boxDecoration.copyWith(
                                    color: Cr.whiteColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: SvgPicture.asset(Svgs.earth),
                                      trailing: SizedBox(),
                                      title: Text(
                                        languagesTypes["8"]!,
                                        // "English",
                                        style: h4Bold.copyWith(
                                          fontSize: Di.FSD,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Di.PSETS + 1,
                                        ),
                                        child: Text(
                                          languagesProficiencies["2"]!,
                                          style: bodySmallRegular.copyWith(
                                            color: Cr.accentBlue1,
                                            fontSize: Di.FSS,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Di.SBHD,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                EditBlueCardSheet(
                  context,
                  dataIsNull: !hasData,
                  greenCardText:
                      "Show which languages you are fluent and professionally capable of.",
                ),
                if (hasData)
                  EditAddButtonOfSheet(
                    context,
                    onEditPressed: () {
                      showCustomDialog(
                        context,
                        ProfileLanguagesDialogWidget(
                            userProfileData: widget.userProfileData),
                      );
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

class AchievementComponent extends StatefulWidget {
  const AchievementComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  State<AchievementComponent> createState() => _AchievementComponentState();
}

class _AchievementComponentState extends State<AchievementComponent> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final List<Achievement>? achievement =
        Provider.of<ProfileProvider>(context).userProfileData!.achievements;
    final bool hasData = achievement != null ? achievement.isNotEmpty : false;

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Di.SBHETS,
            ProfileComponentTitle(
              isMobile: widget.isMobile,
              onIconPressed: () {
                setState(() {
                  showSubMenu = !showSubMenu;
                });
              },
              title: "Achievements",
            ),
            Di.DWZH,
            IntrinsicHeight(
              child: Stack(
                children: [
                  if (hasData)
                    Column(
                      children: achievement
                          .map(
                            (singleAchievement) => Container(
                              width: widget.isMobile ? null : 360,
                              margin: EdgeInsets.only(
                                bottom:
                                    achievement.indexOf(singleAchievement) ==
                                            (achievement.length - 1)
                                        ? 0
                                        : Di.PSS,
                              ),
                              decoration:
                                  boxDecoration.copyWith(color: Cr.whiteColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: const SvgWithBackground(
                                      svg: Svgs.school,
                                    ),
                                    trailing: const SizedBox(),
                                    title: Text(
                                      singleAchievement.title ?? "",
                                      // "Marriott Hotel and Resorts employee of the year awards",
                                      style: h4Bold.copyWith(
                                        fontSize: Di.FSD,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Di.SBHES,
                                        Text(
                                          singleAchievement.website ??
                                              "No website added",
                                          style: bodySmallRegular.copyWith(
                                            color: Cr.accentBlue1,
                                            fontSize: Di.FSS,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Di.SBHD,
                                  Di.DWZH,
                                  if (singleAchievement.description != null)
                                    ExpandedCollapseWidget(
                                      showText: "More info",
                                      description: singleAchievement.description
                                          as String,
                                      isMobile: widget.isMobile,
                                    )
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
                        "Add the educational institutions you attended, the qualifications you achieved and the courses completed.",
                  ),
                  EditAddButtonOfSheet(
                    context,
                    onEditPressed: () {
                      showCustomDialog(
                        context,
                        ProfileAchievementDialogWidget(
                          achievements: achievement ?? <Achievement>[],
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
              editText: 'achievements',
            ),
          ),
      ],
    );
  }
}

class FeaturedVideoComponent extends StatefulWidget {
  const FeaturedVideoComponent({
    Key? key,
    required this.userProfileData,
    this.isMobile = false,
  }) : super(key: key);
  final User userProfileData;
  final bool isMobile;
  @override
  State<FeaturedVideoComponent> createState() => _FeaturedVideoComponentState();
}

class _FeaturedVideoComponentState extends State<FeaturedVideoComponent> {
  bool showMore = false;
  bool showSubMenu = false;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    if (widget.userProfileData.profileVideoUrl != null) {
      _videoPlayerController =
          VideoPlayerController.network(widget.userProfileData.profileVideoUrl!)
            ..addListener(() {
              if (_videoPlayerController!.value.position ==
                  _videoPlayerController!.value.duration) {
                setState(() {
                  _videoPlayerController!.pause();
                });
              }
            });
      _videoPlayerController!.initialize().then((value) {
        setState(() {});
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileData =
        Provider.of<ProfileProvider>(context).userProfileData!;

    return Stack(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Cr.whiteColor,
          ),
          child: Column(
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
                title: "Featured video",
              ),
              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Di.PSL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_videoPlayerController != null)
                            IntrinsicHeight(
                              child: Stack(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 325,
                                      height: 180,
                                      child:
                                          VideoPlayer(_videoPlayerController!),
                                    ),
                                  ),
                                  Center(
                                    child: FloatingActionButton(
                                      backgroundColor: Cr.accentBlue1,
                                      onPressed: () {
                                        setState(() {
                                          _videoPlayerController!
                                                  .value.isPlaying
                                              ? _videoPlayerController!.pause()
                                              : _videoPlayerController!.play();
                                        });
                                      },
                                      child: Icon(
                                        _videoPlayerController!.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            Di.ESB,
                          if (userProfileData.profileVideoTitle != null) ...[
                            Di.SBHL,
                            Text(
                              userProfileData.profileVideoTitle!,
                              style: h4Bold,
                            ),
                          ],
                          if (userProfileData.profileVideoDescription !=
                              null) ...[
                            Di.SBHL,
                            RichText(
                              text: TextSpan(
                                style: bodySmallRegular.copyWith(
                                  color: Cr.darkGrey1,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget
                                                .userProfileData
                                                .profileVideoDescription!
                                                .length <
                                            120
                                        ? userProfileData
                                            .profileVideoDescription!
                                        : (showMore
                                            ? userProfileData
                                                .profileVideoDescription
                                            : "${userProfileData.profileVideoDescription!.substring(0, 120)}..."),
                                    // "Noberto's career has revolved around causing corporate transformation projects designed to optimize the use of resources enha...",
                                  ),
                                  if (userProfileData
                                          .profileVideoDescription!.length >
                                      120)
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => setState(() {
                                              showMore = !showMore;
                                            }),
                                      text: showMore
                                          ? "show less   "
                                          : "show more   ",
                                      style: const TextStyle(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    EditBlueCardSheet(
                      context,
                      greenCardText: "Upload your featured video here",
                    ),
                    EditAddButtonOfSheet(
                      context,
                      onEditPressed: () {
                        // buildReferencesCard(img, title, userId, subTitle, description)
                        showCustomDialog(
                          context,
                          ProfileFeaturedVideoDialogWidget(
                            userProfileData: userProfileData,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
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
              editText: 'featured video',
            ),
          ),
      ],
    );
  }
}

class ProfileComponentTitle extends StatelessWidget {
  const ProfileComponentTitle({
    Key? key,
    required this.isMobile,
    this.onIconPressed,
    required this.title,
  }) : super(key: key);
  final bool isMobile;
  final void Function()? onIconPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 46,
      padding: EdgeInsets.only(left: isMobile ? Di.PSD : Di.PSL, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: h2Regular,
          ),
          if (onIconPressed != null)
            CustomComponentDropdown(
              size: 32,
              iconSize: 13,
              onTappedInside: onIconPressed!,
              onTappedOutside: () {
                // setState(() {
                //   showSubMenu = false;
                // });
              },
            ),
        ],
      ),
    );
  }
}
