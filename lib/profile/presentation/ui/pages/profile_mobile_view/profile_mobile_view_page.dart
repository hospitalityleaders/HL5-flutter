import 'package:flutter/material.dart';

import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/data/presentation_data.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';
import 'package:holedo/profile/presentation/ui/components/appbar_notification.dart';
import 'package:holedo/profile/presentation/ui/components/person_avatar.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_tabbar.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_desktop_comman_components/mobile_desktop_comman_components.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_view_section/mobile_profile_article_section.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_view_section/mobile_profile_overview_section.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_view_section/mobile_profile_reference_section.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_view_section/mobile_profile_timeline_section.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_view_section/mobile_profile_video_section.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/responsive.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class ProfileMobileViewPage extends StatefulWidget {
  const ProfileMobileViewPage({
    Key? key,
    required this.currentTabIndex,
    required this.changeCurrentIndex,
    required this.tabController,
  }) : super(key: key);
  final void Function(int newIndex) changeCurrentIndex;
  final int currentTabIndex;
  final TabController tabController;
  @override
  State<ProfileMobileViewPage> createState() => _ProfileMobileViewPageState();
}

class _ProfileMobileViewPageState extends State<ProfileMobileViewPage> {
  bool showMenu = false;
  bool showCardSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobilePhn = isMobilePhone(context);
    final bool isTablt = isTablet(context);
    final profileProvider = Provider.of<ProfileProvider>(context);
    final User userProfileData = profileProvider.userProfileData!;
    final appState = Provider.of<AppProvider>(context);
    final bool isMine = appState.isLoginnedAndEditable(userProfileData);

    return Scaffold(
      backgroundColor: Cr.backgroundColor,
      body: ListView(
        children: [
          if (Provider.of<ProfileProvider>(context).isMyProfile) ...[
            AppbarNotifications(),
          ],
          if (isTablt)
            ProfileImageBanner(
              userProfileData: userProfileData,
              onEditButtonPressed: () {},
            ),
          if (isTablt)
            ProfileTabbar(
              onTap: widget.changeCurrentIndex,
              tabController: widget.tabController,
            ),
          Container(
            margin: EdgeInsets.only(
              left: isTablt ? 30 : 0,
              right: isTablt ? 30 : 0,
            ),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                if (isMobilePhn)
                  SizedBox(
                    // decoration: boxDecorationWithShadow.copyWith(),
                    height: showMenu
                        ? showCardSubMenu
                            ? 1020
                            : 900
                        : showCardSubMenu
                            ? 760
                            : 650,
                    child: Stack(
                      children: [
                        Container(
                          height: 76,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                userProfileData.banner ??
                                    "https://images.pexels.com/photos/269077/pexels-photo-269077.jpeg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 55,
                          child: Align(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: Di.PSL,
                                right: Di.PSL,
                              ),
                              width: Di.getScreenSize(context).width * .96,
                              decoration: boxDecorationWithShadow,
                              child: Column(
                                children: [
                                  Di.SBCH(50),
                                  Text(
                                    userProfileData.fullName ?? "",
                                    style: display3,
                                  ),
                                  Di.SBHD,
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      userProfileData
                                              .currentMembershipGrade!.title ??
                                          "",
                                      style: bodySmallRegular.copyWith(
                                        color: Cr.darkGrey1,
                                      ),
                                    ),
                                  ),
                                  Di.SBHD,
                                  SizedBox(
                                    width: 320,
                                    child: Text(
                                      userProfileData.professionalTitle
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: bodyLarge.copyWith(
                                        color: Cr.darkGrey1,
                                      ),
                                    ),
                                  ),
                                  Di.SBHD,
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Cr.darkGrey1,
                                        ),
                                        Text(
                                          userProfileData.area ??
                                              countries[
                                                  userProfileData.countryId] ??
                                              "",
                                          // " Cape Town, South Africa",
                                          textAlign: TextAlign.center,
                                          style: bodyLarge.copyWith(
                                            color: Cr.darkGrey1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Di.SBHD,
                                  ContactCardMenuCommon(
                                    onPressed: () {
                                      setState(() {
                                        showCardSubMenu = !showCardSubMenu;
                                      });
                                    },
                                    isMobile: true,
                                  ),
                                  if (showCardSubMenu) ...[
                                    Di.SBHS,
                                    const ProfileCardSubMenu(),
                                  ],
                                  Di.SBHOL,
                                  const SendConnectionRequestButton(
                                    width: double.infinity,
                                  ),

                                  if (!profileProvider.isMyProfile) ...[
                                    Di.SBHS,
                                    WriteReferenceRecommandButtonComman(
                                      isMobile: true,
                                      width:
                                          Di.getScreenSize(context).width * .43,
                                      userProfileData: userProfileData,
                                    ),
                                  ],

                                  Di.SBHD,
                                  SizedBox(
                                    child: Image.asset(
                                      "assets/images/badge.png",
                                      width: 50,
                                    ),
                                  ),
                                  StatsComman(
                                    isMobile: true,
                                    userProfileData:
                                        // ref
                                        //     .watch(profileNotifierProvider)
                                        Provider.of<ProfileProvider>(context)
                                            .userProfileData!,
                                  ),
                                  Di.SBHD,
                                  // height: showMenu ? 305 : 50,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const PersonAvatar(),
                                          Di.SBWD,
                                          Text(
                                            userProfileData.fullName ?? '',
                                            style: h4Bold,
                                            // de
                                          ),
                                          Di.SBWS,
                                          const Text(
                                            "MHL",
                                            style: dividerTextSmall,
                                            // de
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showMenu = !showMenu;
                                          });
                                        },
                                        child: showMenu
                                            ? const Icon(
                                                Icons.close,
                                                color: Cr.accentBlue1,
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: const [
                                                  Icon(
                                                    Icons.menu,
                                                    color: Cr.accentBlue1,
                                                  ),
                                                  Text(
                                                    "Menu",
                                                    style: TextStyle(
                                                      fontSize: 9,
                                                      color: Cr.accentBlue1,
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                      ),
                                    ],
                                  ),
                                  if (showMenu) ...[
                                    Di.SBHS,
                                    TabButtonProfileMobile(
                                      title: "Provile overview",
                                      isActive: widget.currentTabIndex == 0,
                                      onTap: () {
                                        widget.changeCurrentIndex(0);
                                      },
                                    ),
                                    TabButtonProfileMobile(
                                      title: "Timeline",
                                      isActive: widget.currentTabIndex == 1,
                                      onTap: () {
                                        widget.changeCurrentIndex(1);
                                      },
                                    ),
                                    TabButtonProfileMobile(
                                      title: "Articles",
                                      isActive: widget.currentTabIndex == 2,
                                      onTap: () {
                                        widget.changeCurrentIndex(2);
                                      },
                                    ),
                                    TabButtonProfileMobile(
                                      title: "Activity",
                                      isActive: widget.currentTabIndex == 3,
                                      onTap: () {
                                        widget.changeCurrentIndex(3);
                                      },
                                    ),
                                    TabButtonProfileMobile(
                                      title: "References",
                                      isActive: widget.currentTabIndex == 4,
                                      onTap: () {
                                        widget.changeCurrentIndex(4);
                                      },
                                    ),
                                    TabButtonProfileMobile(
                                      title: "Video",
                                      isActive: widget.currentTabIndex == 5,
                                      onTap: () {
                                        widget.changeCurrentIndex(5);
                                      },
                                    ),
                                  ],
                                  if (isMine) ...[
                                    Di.SBHES,
                                    const EditProfileButton(
                                      width: double.infinity,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 10,
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: PersonAvatar(avatarSize: 75)),
                        ),
                      ],
                    ),
                  ),
                Di.SBHES,
                [
                  MobileProfileOverviewSection(
                    isMobilePhn: isMobilePhn,
                    isTablt: isTablt,
                  ),
                  MobileProfileTimelineSection(
                    isMobilePhn: isMobilePhn,
                    isTablt: isTablt,
                    showComments: false,
                  ),
                  MobileProfileArticleSection(
                    isMobilePhn: isMobilePhn,
                    isTablt: isTablt,
                    showComments: false,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(Di.PSOTL),
                    child: Center(
                      child: Text(
                        "Activity",
                        style: display1,
                      ),
                    ),
                  ),
                  MobileProfileReferenceSection(
                    isMobilePhn: isMobilePhn,
                    isTablt: isTablt,
                  ),
                  MobileProfileVideoSection(
                    isMobilePhn: isMobilePhn,
                    isTablt: isTablt,
                  ),
                ][widget.currentTabIndex],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
