import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/appbar_notification_widget.dart';
import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/presentation/ui/pages/components/profile_tabbar.dart';
import 'package:holedo/presentation/ui/pages/profile_mobile_view/profile_mobile_view_page.dart';
import 'package:holedo/presentation/ui/pages/sections/activity_section/activity_section.dart';
import 'package:holedo/presentation/ui/pages/sections/articles_section/articles_section.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_section.dart';
import 'package:holedo/presentation/ui/pages/sections/reference_section/reference_section.dart';
import 'package:holedo/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

enum CarType { sedan, suv, truck }

class UserProfilePage extends StatefulWidget {
  final User userProfileData;

  const UserProfilePage({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  bool isEditable = false;

  int tabBar = 0;
  late TabController _tabController;
  int currentTabIndex = 0;
  bool showNotifications = true;

  void changeCurrentIndex(int newIndex) {
    newIndex == 5
        ? _tabController.animateTo(0)
        : _tabController.animateTo(newIndex);
    setState(() {
      currentTabIndex = newIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void didChangeDependencies() {
    Provider.of<ProfileProvider>(context, listen: false)
        .changeUserProfilePercentage(Provider.of<AppState>(context));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onTabBarTap(int value) {
    setState(() {
      currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("userProfileData: is  ${widget.userProfileData.toString()} ");
    final appState = Provider.of<AppState>(context);
    final userProfileProvider = Provider.of<ProfileProvider>(context);
    final userProfileProviderNotListener =
        Provider.of<ProfileProvider>(context, listen: false);
    print('app $isEditable');
    return TapCanvas(
      child: Container(
        color: Cr.backgroundColor,
        child:
            // if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
            isTableOrMobile(context)
                ? ProfileMobileViewPage(
                    currentTabIndex: currentTabIndex,
                    changeCurrentIndex: changeCurrentIndex,
                    userProfileData: widget.userProfileData,
                    tabController: _tabController,
                    onTabBarTap: onTabBarTap,
                  )
                : Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        userProfileProvider.appNotificationState.map(
                          showNothing: (_) => Di.ESB,
                          profileCompletion: (notification) =>
                              userProfileProvider.percentageProfileCompleted ==
                                      100
                                  ? Di.ESB
                                  : AppbarNotificationWidget(
                                      title:
                                          "Your profile is only ${userProfileProvider.percentageProfileCompleted}% complete. Complete it now to earn first Hospitality Leader grade.",
                                      onButtonPressed: () {
                                        userProfileProviderNotListener
                                            .changeIsProfieEditableState(true);
                                      },
                                    ),
                          sucess: (notification) => AppbarNotificationWidget(
                            appbarNotificationColor:
                                AppbarNotificationColor.green,
                            buttonText: "View profile",
                            title:
                                "Your profile has been successfully updated.",
                            onButtonPressed: () {
                              Nav().goToCurrentUserProfile(context);
                            },
                          ),
                        ),
                        ProfileImageBanner(
                          userProfileData: widget.userProfileData,
                          onEditButtonPressed: () {},
                        ),
                        ProfileTabbar(
                          onTap: onTabBarTap,
                          isMine: appState.isLoggedIn,
                          tabController: _tabController,
                        ),
                        Di.SBHEL,
                        Center(
                          child: [
                            PageOverviewSection(
                              isEditable: isEditable,
                              userProfileData: widget.userProfileData,
                            ),
                            TimelineSection(),
                            ArticlesSection(),
                            ActivitySection(),
                            ReferenceSection(),
                          ][_tabController.index],
                        ),
                        Di.SBHOTL,
                      ],
                    ),
                  ),

        // userProfileProvider.showProfileLoading
        //     ? CustomLoading()
        //     : Di.ESB,
      ),
    );
  }
}
