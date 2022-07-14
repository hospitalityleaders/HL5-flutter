import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/data/presentation_data.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/presentation/ui/pages/components/profile_tabbar.dart';
import 'package:holedo/presentation/ui/pages/mobile_desktop_comman_components/mobile_desktop_comman_components.dart';
import 'package:holedo/presentation/ui/pages/mobile_view_section/mobile_profile_article_section.dart';
import 'package:holedo/presentation/ui/pages/mobile_view_section/mobile_profile_overview_section.dart';
import 'package:holedo/presentation/ui/pages/mobile_view_section/mobile_profile_reference_section.dart';
import 'package:holedo/presentation/ui/pages/mobile_view_section/mobile_profile_timeline_section.dart';
import 'package:holedo/presentation/ui/pages/mobile_view_section/mobile_profile_video_section.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileMobileViewPage extends StatefulWidget {
  const ProfileMobileViewPage({
    Key? key,
    required this.userProfileData,
    required this.currentTabIndex,
    required this.changeCurrentIndex,
    required this.tabController,
  }) : super(key: key);
  final User userProfileData;
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
    final User getUserProfileData = DbData.getUserProfileData;
    final isEditable = Provider.of<ProfileProvider>(context).isProfileEditable;
    final appState = Provider.of<AppState>(context);
    final bool isMine = appState.isLoginnedAndEditable(widget.userProfileData);

    return Scaffold(
      backgroundColor: Cr.backgroundColor,
      body: ListView(
        children: [
          //TODO:Need to work on app notification
          // if (notification != null)
          //   AppbarNotification(
          //     title: notification.text,
          //     buttonText: notification.buttonText,
          //   ),
          if (isTablt)
            ProfileImageBanner(
              userProfileData: widget.userProfileData,
              onEditButtonPressed: () {},
            ),
          if (isTablt)
            ProfileTabbar(
              onTap: widget.changeCurrentIndex,
              isMine: isMine,
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
                    // decoration: Styles.boxDecorationWithShadow.copyWith(),
                    height: showMenu
                        ? showCardSubMenu
                            ? 1070
                            : 950
                        : showCardSubMenu
                            ? 790
                            : 680,
                    child: Stack(
                      children: [
                        Container(
                          height: 76,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.userProfileData.banner ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 55,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: Di.PSL,
                                right: Di.PSL,
                              ),
                              width: Di.getScreenSize(context).width * .96,
                              decoration: Styles.boxDecorationWithShadow,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Di.SBCH(50),
                                  Text(
                                    getUserProfileData.fullName ?? "",
                                    style: display3,
                                  ),
                                  Di.SBHD,
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      getUserProfileData
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
                                      widget.userProfileData.professionalTitle
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
                                          widget.userProfileData.area ??
                                              "" +
                                                  (PresentationData.countries[
                                                          widget.userProfileData
                                                              .countryId] ??
                                                      ""),
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
                                  Di.SBHES,
                                  WriteReferenceRecommandButtonComman(
                                    isMobile: true,
                                    width:
                                        Di.getScreenSize(context).width * .43,
                                    userProfileData: widget.userProfileData,
                                  ),
                                  Di.SBHD,
                                  SizedBox(
                                    child: Image.asset(
                                      "assets/images/badge.png",
                                      width: 50,
                                    ),
                                  ),
                                  StatsComman(
                                    isMobile: true,
                                    userProfileData: DbData.getUserProfileData,
                                  ),
                                  Di.SBHS,
                                  // Container(
                                  //   padding: EdgeInsets.only(bottom: Di.PSS),
                                  //   decoration: BoxDecoration(
                                  //     color: Cr.whiteColor,
                                  //     border: Border(
                                  //       bottom: BorderSide(
                                  //         width: 0.5,
                                  //         color: Cr.darkGrey1,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   child: StatsComman(isMobile: true),
                                  // ),
                                  Di.SBHD,
                                  Container(
                                    padding: const EdgeInsets.only(
                                      bottom: Di.PSS,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Cr.whiteColor,
                                      // border: Border(
                                      //   bottom: BorderSide(
                                      //     width: 2,
                                      //     color: Cr.grey1,
                                      //   ),
                                      // ),
                                    ),
                                    height: showMenu ? 365 : 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const PersonAvatar(),
                                                Di.SBWD,
                                                Text(
                                                  widget.userProfileData
                                                          .fullName ??
                                                      '',
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
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: const [
                                                        Icon(
                                                          Icons.menu,
                                                          color: Cr.accentBlue1,
                                                        ),
                                                        Text(
                                                          "Menu",
                                                          style: TextStyle(
                                                            fontSize: 9,
                                                            color:
                                                                Cr.accentBlue1,
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
                                        if (showMenu)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TabButtonProfileMobile(
                                                title: "Provile overview",
                                                isActive:
                                                    widget.currentTabIndex == 0,
                                                onTap: () {
                                                  widget.changeCurrentIndex(0);
                                                },
                                              ),
                                              TabButtonProfileMobile(
                                                title: "Timeline",
                                                isActive:
                                                    widget.currentTabIndex == 1,
                                                onTap: () {
                                                  widget.changeCurrentIndex(1);
                                                },
                                              ),
                                              TabButtonProfileMobile(
                                                title: "Articles",
                                                isActive:
                                                    widget.currentTabIndex == 2,
                                                onTap: () {
                                                  widget.changeCurrentIndex(2);
                                                },
                                              ),
                                              TabButtonProfileMobile(
                                                title: "Activity",
                                                isActive:
                                                    widget.currentTabIndex == 3,
                                                onTap: () {
                                                  widget.changeCurrentIndex(3);
                                                },
                                              ),
                                              TabButtonProfileMobile(
                                                title: "References",
                                                isActive:
                                                    widget.currentTabIndex == 4,
                                                onTap: () {
                                                  widget.changeCurrentIndex(4);
                                                },
                                              ),
                                              TabButtonProfileMobile(
                                                title: "Video",
                                                isActive:
                                                    widget.currentTabIndex == 5,
                                                onTap: () {
                                                  widget.changeCurrentIndex(5);
                                                },
                                              ),
                                            ],
                                          ),
                                        Di.SBHES,
                                        isMine
                                            ? EditProfileButton(
                                                width: double.infinity)
                                            : Di.ESB,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 10,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 75,
                              height: 75,
                              decoration: Styles.boxDecorationRounded.copyWith(
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/avatar.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Di.SBHS,
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
