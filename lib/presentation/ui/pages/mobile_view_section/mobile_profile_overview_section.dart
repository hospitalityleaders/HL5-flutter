import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_appbar.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_eduction_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_workexperience.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/components/timeline_component.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/profile_overview_first_column.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import 'package:holedo/presentation/utill/styles.dart';

class MobileProfileOverviewSection extends StatelessWidget {
  const MobileProfileOverviewSection({
    Key? key,
    required this.isMobilePhn,
    required this.isTablt,
  }) : super(key: key);

  final bool isMobilePhn;
  final bool isTablt;

  @override
  Widget build(BuildContext context) {
    final userProfileData = DbData.getUserProfileData;
    return Container(
      color: Cr.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: Di.PSS,
      ),
      child: Column(
        children: [
          if (isMobilePhn) const ProfileCompletionComponent(),
          Di.SBHS,
          const ProfileSummaryComponent(
            isMobile: true,
          ),

          ProfileWorkExperienceComponent(
            userProfileData: userProfileData,
            isMobile: isMobilePhn,
            isTablet: isTablt,
          ),
          Di.SBHS,
          FeaturedVideoComponent(
            isMobile: true,
            userProfileData: userProfileData,
          ),
          Di.SBHS,
          const AreasOfExpertiseComponents(),
          Di.SBHS,
          const ProfileReferenceComponent(),
          Di.SBHS,
          EducationComponent(
            isMobile: true,
            userProfileData: userProfileData,
          ),
          Di.SBHS,
          const AchievementComponent(isMobile: true),
          //TODO:
          // LanguagesComponent(
          //   userProfileData: userProfileData,
          // ),
          Di.SBHS,
          const ConnectionsComponent(
            isMobile: true,
          ),
          Di.SBHS,
          const TimelineComponent(),
          Di.SBHS,

          const RightsComponent(
            isMobile: true,
          ),
          Di.SBHOTL,
        ],
      ),
    );
  }
}

class ProfileMobileAppbar extends StatefulWidget {
  final TextEditingController? searchController;
  final void Function(String? searchText) onSearch;
  final void Function()? onMenuTap;

  const ProfileMobileAppbar({
    Key? key,
    this.searchController,
    required this.onSearch,
    this.onMenuTap,
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
      padding: const EdgeInsets.symmetric(horizontal: Di.PSS),
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
          if (isTablet(context))
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalDivider(
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
                const VerticalDivider(
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
                const VerticalDivider(
                  thickness: 1.3,
                  color: Cr.darkBlue5,
                ),
                const AppbarConnectionRequestButton(),
                const VerticalDivider(
                  thickness: 1.3,
                  color: Cr.darkBlue5,
                ),
                const PersonAvatar(),
                const VerticalDivider(
                  thickness: 1.3,
                  color: Cr.darkBlue5,
                ),
              ],
            )
          else
            Di.ESB,
          Di.SBWD,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.onMenuTap,
                child: CustomIconButton(
                  showNotification: true,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
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

class TabButtonProfileMobile extends StatelessWidget {
  const TabButtonProfileMobile({
    Key? key,
    required this.title,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          color: isActive ? Cr.accentBlue3 : Cr.whiteColor,
          padding: const EdgeInsets.symmetric(
            horizontal: Di.PSL,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: isActive
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: bodySmallRegular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              if (isActive) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Cr.accentBlue1,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Di.SBCW(18),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
