import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/ui/components/appbar_notification.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/slider.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_tabbar.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_mobile_view/profile_mobile_view_page.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/activity_section/activity_section.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/articles_section/articles_section.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_section.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/reference_section/reference_section.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:tap_canvas/tap_canvas.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({
    required this.isMyProfile,
    required this.userData,
    Key? key,
  }) : super(key: key);
  final bool isMyProfile;
  final User userData;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  bool isEditable = false;

  int tabBar = 0;
  late TabController _tabController = TabController(length: 5, vsync: this);
  bool showNotifications = true;

  void changeCurrentIndex(int newIndex) {
    newIndex == 5
        ? _tabController.animateTo(0)
        : _tabController.animateTo(newIndex);
//todo
    Provider.of<ProfileProvider>(context, listen: false)
        .changeCurrentTabIndex(newIndex);
    // ref.read(profileNotifierProvider.notifier).changeCurrentTabIndex(newIndex);
  }

  @override
  void initState() {
    Future.microtask(() {
      _updateTabController();
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateTabController() {
    setState(() {
      _tabController.index =
          Provider.of<ProfileProvider>(context).currentTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final userProfileData = profileProvider.userProfileData;
    final currentTabIndex = profileProvider.currentTabIndex;

    return TapCanvas(
      child: Container(
        color: Cr.backgroundColor,
        child: Di.getScreenSize(context).width < 1000
            ? SliderDrawer(
                splashColor: Cr.colorPrimary,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Cr.backgroundColor,
                  ),
                  child: ProfileMobileViewPage(
                    currentTabIndex: currentTabIndex,
                    changeCurrentIndex: changeCurrentIndex,
                    tabController: _tabController,
                  ),
                ),
              )
            : Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (Provider.of<ProfileProvider>(context).isMyProfile) ...[
                      AppbarNotifications(),
                    ],
                    ProfileImageBanner(
                      userProfileData: userProfileData!,
                    ),
                    ProfileTabbar(
                      onTap: changeCurrentIndex,
                      tabController: _tabController,
                    ),
                    Di.SBHEL,
                    Center(
                      child: [
                        const PageOverviewSection(),
                        const TimelineSection(),
                        const ArticlesSection(),
                        const ActivitySection(),
                        const ReferenceSection(),
                      ][currentTabIndex],
                    ),
                    Di.SBHOTL,
                  ],
                ),
              ),
      ),
    );
  }
}
