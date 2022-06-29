import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/layouts/pages/profile-pages/profile/user_profile_page.dart';
import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_appbar.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_workexperience.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/mobile_desktop_comman_components/mobile_desktop_comman_components.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/profile_overview_first_column.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import 'package:holedo/presentation/utill/styles.dart';

import 'package:holedo/presentation/utill/images.dart';

class ProfileMobileViewPage extends StatefulWidget {
  const ProfileMobileViewPage({Key? key, required this.userProfileData})
      : super(key: key);
  final User userProfileData;

  @override
  State<ProfileMobileViewPage> createState() => _ProfileMobileViewPageState();
}

class _ProfileMobileViewPageState extends State<ProfileMobileViewPage> {
  @override
  Widget build(BuildContext context) {
    final bool isMobilePhn = isMobilePhone(context);
    final bool isTablt = isTablet(context);
    final User getUserProfileData = DbData.getUserProfileData;

    return Scaffold(
      body: ListView(
        children: [
          if (isTablt)
            Di.getScreenSize(context).width > 800
                ? AppbarNotification()
                : Container(
                    height: 100,
                    width: Di.getScreenSize(context).width,
                    color: Cr.red3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Di.SBWS,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 380,
                              child: Text(
                                "Your profile is only 25% complete. Complete it now to earn your first Hospitality Leaders grade.   ",
                                textAlign: TextAlign.center,
                                style: bodySmallRegular.copyWith(
                                  color: Cr.red1,
                                ),
                              ),
                            ),
                            CustomElevatedButton(
                              width: 97,
                              height: 32,
                              backgroundColor: Cr.redTextColor,
                              donotShowIcon: true,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Di.SBHS,
                            Icon(
                              Icons.close,
                              color: Cr.redTextColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          if (isTablt)
            ProfileImageBanner(
              userProfileData: widget.userProfileData,
              onEditButtonPressed: () {},
            ),
          Container(
            margin: EdgeInsets.only(
              left: isTablt ? 30 : 0,
              right: isTablt ? 30 : 0,
            ),
            child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                if (isMobilePhn)
                  SizedBox(
                    height: 600,
                    child: Stack(
                      children: [
                        Container(
                          height: 76,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/t6.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 55,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: Di.getScreenSize(context).width * .96,
                              decoration: BoxDecoration(
                                color: Cr.whiteColor,
                              ),
                              child: Column(
                                children: [
                                  Di.SBHOTL,
                                  Text(
                                    getUserProfileData.fullName ?? "",
                                    style: display3,
                                  ),
                                  Di.SBHETS,
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
                                  Di.SBHS,
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
                                  Di.SBHS,
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Cr.darkGrey1,
                                        ),
                                        Text(
                                          widget.userProfileData.area ?? "",
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
                                    isMobile: true,
                                  ),
                                  Di.SBHOL,
                                  SendConnectionRequestComman(),
                                  Di.SBHES,
                                  WriteReferenceRecommandButtonComman(
                                    userProfileData: widget.userProfileData,
                                  ),
                                  Di.SBHD,
                                  SizedBox(
                                    child: Image.asset(
                                      "assets/images/badge.png",
                                      width: 50,
                                    ),
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
                                    padding: EdgeInsets.only(
                                      bottom: Di.PSS,
                                      // left: Di.PSD,
                                      // right: Di.PSD,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Cr.whiteColor,
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 2,
                                          color: Cr.grey1,
                                        ),
                                      ),
                                    ),
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                PersonAvatar(),
                                                Di.SBWD,
                                                Text(
                                                  widget.userProfileData
                                                          .fullName ??
                                                      '',
                                                  style: h4Bold,
                                                  // de
                                                ),
                                                Di.SBWS,
                                                Text(
                                                  "MHL",
                                                  style: dividerTextSmall,
                                                  // de
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.menu,
                                                  color: Cr.accentBlue1,
                                                ),
                                                Text(
                                                  "Menu",
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Cr.accentBlue1,
                                                    fontFamily: 'SourceSansPro',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Di.SBHES,
                                        CustomElevatedButton(
                                          width: 280,
                                        ),
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
                                image: DecorationImage(
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Di.PSS,
                  ),
                  child: Column(
                    children: [
                      if (isMobilePhn) ProfileCompletionComponent(),
                      Di.SBHS,
                      ProfileSummaryComponent(
                        isMobile: true,
                      ),

                      ProfileWorkExperienceComponent(
                        userProfileData: widget.userProfileData,
                        isMobile: isMobilePhn,
                        isTablet: isTablt,
                      ),
                      Di.SBHS,
                      FeaturedVideoComponent(
                        isMobile: true,
                        userProfileData: widget.userProfileData,
                      ),
                      Di.SBHS,
                      AreasOfExpertiseComponents(),
                      Di.SBHS,
                      ProfileReferenceComponent(),
                      Di.SBHS,
                      EducationComponent(
                        isMobile: true,
                        userProfileData: widget.userProfileData,
                      ),
                      Di.SBHS,
                      AchievementComponent(
                        isMobile: true,
                        userProfileData: widget.userProfileData,
                      ),
                      //TODO:
                      // LanguagesComponent(
                      //   userProfileData: widget.userProfileData,
                      // ),
                      ConnectionsComponent(),
                      TimelineComponent(),
                      RightsComponent(
                        isMobile: true,
                      ),
                      Di.SBHOTL,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMobileAppbar extends StatefulWidget {
  final TextEditingController searchController;
  final void Function(String? searchText) onSearch;
  final void Function()? onTap;

  const ProfileMobileAppbar({
    Key? key,
    required this.searchController,
    required this.onSearch,
    this.onTap,
  }) : super(key: key);

  @override
  State<ProfileMobileAppbar> createState() => _ProfileMobileAppbarState();
}

class _ProfileMobileAppbarState extends State<ProfileMobileAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.colorPrimary,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: Di.PSS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.logo1,
            width: Di.FSOTL + 10,
          ),
          Di.SBWD,
          AppbarTextField(
            onSearchChange: widget.onSearch,
            searchController: widget.searchController,
            width: isTablet(context) ? 250 : 300,
            showPeopleButton: false,
          ),
          isTablet(context)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VerticalDivider(
                      thickness: 1.3,
                      color: Cr.darkBlue5,
                    ),
                    CustomIconButton(
                      icon: SvgPicture.asset(
                        Svgs.emailOpen,
                        color: Cr.darkBlue9,
                      ),
                      // iconData: Icons.mail_rounded,
                      showNotification: true,
                    ),
                    VerticalDivider(
                      thickness: 1.3,
                      color: Cr.darkBlue5,
                    ),
                    CustomIconButton(
                      icon: SvgPicture.asset(
                        Svgs.flag,
                        color: Cr.darkBlue9,
                      ),
                      showNotification: true,
                    ),
                    VerticalDivider(
                      thickness: 1.3,
                      color: Cr.darkBlue5,
                    ),
                    AppbarConnectionRequestButton(),
                    VerticalDivider(
                      thickness: 1.3,
                      color: Cr.darkBlue5,
                    ),
                    PersonAvatar(),
                    VerticalDivider(
                      thickness: 1.3,
                      color: Cr.darkBlue5,
                    ),
                  ],
                )
              : Di.ESB,
          Di.SBWD,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: CustomIconButton(
                  showNotification: true,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.menu,
                        color: Cr.darkBlue9,
                      ),
                      Text(
                        "MENU",
                        style: TextStyle(
                          fontSize: 9,
                          fontFamily: "SourceSansPro",
                          fontWeight: FontWeight.bold,
                          color: Cr.darkBlue9,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // iconData: Icons.mail_rounded,
            ],
          ),
        ],
      ),
    );
  }
}
