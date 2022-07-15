import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:holedo/common/textfield_fieldname.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/achievement.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/presentation/ui/components/profile_reference_single_compoenet.dart';
import 'package:holedo/presentation/ui/components/svg_with_background.dart';
import 'package:holedo/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/profile_eduction_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_workexperience.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_achievement_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_featured_video_dialog.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_web/video_player_web.dart';

class ProfileOverviewSecondColumn extends StatefulWidget {
  const ProfileOverviewSecondColumn({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);
  final User userProfileData;

  @override
  State<ProfileOverviewSecondColumn> createState() =>
      _ProfileOverviewSecondColumnState();
}

class _ProfileOverviewSecondColumnState
    extends State<ProfileOverviewSecondColumn> {
  late VideoPlayerPlugin videoPlayerPlugin;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeaturedVideoComponent(
            userProfileData: widget.userProfileData,
          ),
          Di.SBHL,
          ProfileWorkExperienceComponent(
            userProfileData: widget.userProfileData,
          ),
          Di.SBHL,
          EducationComponent(
            userProfileData: widget.userProfileData,
          ),
          Di.SBHL,
          const AchievementComponent(),
          Di.SBHEL,
          // LanguagesComponent(
          //   onEditPressed: () => buildLanguagePopUp(langIndex),
          //   userProfileData: widget.userProfileData,
          // ),
          Di.SBHEL,
        ],
      ),
    );
  }

  /// Education pop up edit functionality start

  bool isVisibleEducation = false;
  bool isEducationEditable = false;
  bool isEducationShowCard = false;
  int indexEdu = 1;

  Widget buildEduInnerCard(
    bool isEducationEditable,
    bool isEducationShowCard,
    int indexEdu,
  ) {
    return StatefulBuilder(
      builder: (context, setState) {
        final List<Widget> eduTextFieldGenerate = List.generate(
          indexEdu,
          (int i) => TextFieldAndFieldName.buildTextField('Course name'),
        );
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Container(
            width: Responsive.isDesktop(context)
                ? SS.sW(context) * .50
                : Responsive.isMobile(context)
                    ? SS.sW(context) * .90
                    : SS.sW(context) * .60,
            color: ColorPicker.kWhite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      color: ColorPicker.kBlueLight1,
                      child: const Icon(
                        Icons.school_rounded,
                        color: ColorPicker.kWhite,
                        size: 18,
                      ),
                    ),
                    title: const Text(''),
                    subtitle: const Text(''),
                    trailing: isEducationEditable
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isEducationShowCard = !isEducationShowCard;
                              });
                            },
                            icon: const Icon(Icons.edit),
                          )
                        : null,
                  ),
                  if (isEducationShowCard)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Divider(
                            height: SS.sH(context) * 0.01,
                            color: ColorPicker.kGreyLight3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFieldAndFieldName.buildFieldName(
                                  'Educational institution',
                                  '*',
                                ),
                                TextFieldAndFieldName.buildTextField(),
                                TextFieldAndFieldName.buildFieldName(
                                  'Course duration',
                                ),
                                TextFieldAndFieldName.buildFieldName(
                                  'Qualification title',
                                ),
                                TextFieldAndFieldName.buildTextField(),
                                TextFieldAndFieldName.buildFieldName(
                                  'Description',
                                ),
                                const TextField(
                                  minLines: 4,
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SS.sB(18),
                                TextFieldAndFieldName.buildFieldName(
                                  'Course outline',
                                ),
                                Column(children: eduTextFieldGenerate),
                                TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      indexEdu++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add another'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: const Text('Cancel'),
                                    ),
                                    SS.sB(0, 10),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Save'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class LanguagesComponent extends StatelessWidget {
//   const LanguagesComponent({
//     Key? key,
//     this.onEditPressed,
//     required this.userProfileData,
//   }) : super(key: key);
//   final User userProfileData;

//   final void Function()? onEditPressed;

//   @override
//   Widget build(BuildContext context) {
//     final List<Language>? languages = DbData.getUserProfileData.languages;
//     final bool hasData = languages != null ? languages.isNotEmpty : false;

//     return Container(
//       decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Di.SBHETS,
//           ListTile(
//             title: Text(
//               "Languages",
//               style: h2Regular,
//             ),
//           ),
//           IntrinsicHeight(
//             child: Stack(
//               children: [
//                 if (hasData)
//                   Column(
//                     children: languages
//                         .map(
//                           (singleLanguage) => Column(
//                             children: [
//                               Di.DWZH,
//                               Di.SBHS,
//                               Container(
//                                 width: 360,
//                                 decoration: Styles.boxDecoration
//                                     .copyWith(color: Cr.whiteColor),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ListTile(
//                                       leading: SvgPicture.asset(Svgs.earth),
//                                       trailing: SizedBox(),
//                                       title: Text(
//                                         singleLanguage.title ?? "",
//                                         // "English",
//                                         style: h4Bold.copyWith(
//                                           fontSize: Di.FSD,
//                                         ),
//                                       ),
//                                       subtitle: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           vertical: Di.PSETS + 1,
//                                         ),
//                                         child: Text(
//                                           "Native and bilingual profiency",
//                                           style: bodySmallRegular.copyWith(
//                                             color: Cr.accentBlue1,
//                                             fontSize: Di.FSS,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Di.SBHD,
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 EditBlueCardSheet(
//                   context,
//                   dataIsNull: !hasData,
//                   greenCardText:
//                       "Show which languages you are fluent and professionally capable of.",
//                 ),
//                 if (hasData)
//                   EditAddButtonOfSheet(
//                     context,
//                     onEditPressed: () {
//                       showCustomDialog(
//                         context,
//                         ProfileLanguagesDialogWidget(
//                             userProfileData: userProfileData),
//                       );
//                     },
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
  @override
  Widget build(BuildContext context) {
    final List<Achievement>? achievement =
        DbData.getUserProfileData.achievements;
    final bool hasData = achievement != null ? achievement.isNotEmpty : false;
    bool showSubMenu = false;

    return Container(
      decoration: Styles.boxDecoration,
      child: Stack(
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
                                decoration: Styles.boxDecoration
                                    .copyWith(color: Cr.whiteColor),
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
                                        description: singleAchievement
                                            .description as String,
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
      ),
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
  late VideoPlayerController _controller;
  bool showMore = false;
  bool showSubMenu = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.userProfileData.profileVideoUrl ?? '',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.position == _controller.value.duration) {
          setState(() {
            _controller.pause();
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                onIconPressed: () {
                  setState(() {
                    showSubMenu = !showSubMenu;
                  });
                },
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
                          Stack(
                            children: [
                              if (_controller.value.isInitialized)
                                SizedBox(
                                  height: widget.isMobile ? null : 180,
                                  width: widget.isMobile ? null : 325,
                                  child: AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  ),
                                )
                              else
                                Di.ESB,
                              Positioned.fill(
                                child: Center(
                                  child: FloatingActionButton(
                                    backgroundColor: Cr.accentBlue1,
                                    onPressed: () {
                                      setState(() {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    },
                                    child: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          if (widget.userProfileData.profileVideoTitle !=
                              null) ...[
                            Di.SBHL,
                            Text(
                              widget.userProfileData.profileVideoTitle!,
                              style: h4Bold,
                            ),
                          ],
                          if (widget.userProfileData.profileVideoDescription !=
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
                                        ? widget.userProfileData
                                            .profileVideoDescription!
                                        : (showMore
                                            ? widget.userProfileData
                                                .profileVideoDescription
                                            : "${widget.userProfileData.profileVideoDescription!.substring(0, 120)}..."),
                                    // "Noberto's career has revolved around causing corporate transformation projects designed to optimize the use of resources enha...",
                                  ),
                                  if (widget.userProfileData
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
                            userProfileData: widget.userProfileData,
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
    required this.onIconPressed,
    required this.title,
  }) : super(key: key);
  final bool isMobile;
  final void Function() onIconPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: EdgeInsets.only(left: isMobile ? Di.PSD : Di.PSL, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: h2Regular,
          ),
          CustomComponentDropdown(
            size: 32,
            iconSize: 13,
            onTappedInside: onIconPressed,
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
