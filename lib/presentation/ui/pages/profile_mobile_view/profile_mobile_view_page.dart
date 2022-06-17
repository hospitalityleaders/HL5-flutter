import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_workexperience.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/mobile_desktop_comman_components/mobile_desktop_comman_components.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/profile_overview_first_column.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

import 'package:holedo/presentation/utill/images.dart';

class ProfileMobileViewPage extends StatelessWidget {
  const ProfileMobileViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          // shrinkWrap: true,
          children: [
            ProfileMobileAppbar(),
            Container(
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
            SingleChildScrollView(
              child: SizedBox(
                height: 680,
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
                      // left: Di.getScreenSize(context).width * .02,
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
                                "Noberto Holden",
                                style: display3,
                              ),
                              Di.SBHETS,
                              OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "AHL",
                                  style: bodySmallRegular.copyWith(
                                    color: Cr.darkGrey1,
                                  ),
                                ),
                              ),
                              Di.SBHS,
                              SizedBox(
                                width: 320,
                                child: Text(
                                  "Business development manager, recruiter and hotel specialist.",
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: Cr.darkGrey1,
                                    ),
                                    Text(
                                      " Cape Town, South Africa",
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
                              WriteReferenceRecommandButtonComman(),
                              Di.SBHD,
                              SizedBox(
                                child: Image.asset(
                                  "assets/images/badge.png",
                                  width: 50,
                                ),
                              ),
                              Di.SBHS,
                              Container(
                                padding: EdgeInsets.only(bottom: Di.PSS),
                                decoration: BoxDecoration(
                                  color: Cr.whiteColor,
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: Cr.darkGrey1,
                                    ),
                                  ),
                                ),
                                child: StatsComman(isMobile: true),
                              ),
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
                                              "Noberto Holden",
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
                                      ],
                                    ),
                                    Di.SBHD,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Di.PSES),
              child: ProfileCompletionComponent(),
            ),
            Di.SBHS,
            ProfileSummaryComponent(isMobile: true),
            Di.SBHD,
            ProfileWorkExperienceComponent(isMobile: true),
            Di.SBHD,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: FeaturedVideoComponent(),
            ),
            AreasOfExpertiseComponents(),
            ProfileReferenceComponent(),
            EducationComponent(),
            AchievementComponent(),
            LanguagesComponent(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConnectionsComponent(),
            ),
            TimelineComponent(),
            RightsComponent(),
            Di.SBHOTL,
          ],
        ),
      ),
    );
  }
}

class ProfileMobileAppbar extends StatelessWidget {
  const ProfileMobileAppbar({
    Key? key,
  }) : super(key: key);

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
            width: 300,
            showPeopleButton: false,
          ),
          // Container(
          //   width: 300,
          //   decoration: BoxDecoration(
          //     color: ColorPicker.kWhite,
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   margin: EdgeInsets.all(2),
          //   child: TextFormField(
          //     // controller: _searchController,
          //     // onChanged: (_) => _search(), // , onSubmitted: (_) => _search(),
          //     cursorColor: ColorPicker.kWhite,
          //     style: FontTextStyle.kWhite18W600PR,
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.all(4),
          //       hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
          //       filled: true,
          //       fillColor: ColorPicker.kPrimaryLight,
          //       hintText: "Search",
          //       border: OutlineInputBorder(
          //           borderSide: BorderSide(color: ColorPicker.kPrimary),
          //           borderRadius: BorderRadius.circular(5)),
          //       focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: ColorPicker.kPrimary),
          //           borderRadius: BorderRadius.circular(5)),
          //       enabledBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: ColorPicker.kPrimary),
          //           borderRadius: BorderRadius.circular(5)),
          //       prefixIcon: Icon(
          //         Icons.search,
          //         color: ColorPicker.kPrimaryLightBlue,
          //       ),
          //       suffixIcon: Container(
          //         margin: EdgeInsets.only(right: 5, bottom: 5, top: 5),
          //         height: 40,
          //         width: 87,
          //         decoration: BoxDecoration(
          //           color: ColorPicker.kPrimaryLight1,
          //           borderRadius: BorderRadius.circular(5),
          //         ),
          //         child: Center(
          //           child: CommonWidget.text(
          //             'People',
          //             style: FontTextStyle.kPrimaryLightBlue16W400SSP,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Di.SBWD,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
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
              // iconData: Icons.mail_rounded,
            ],
          ),
        ],
      ),
    );
  }
}
