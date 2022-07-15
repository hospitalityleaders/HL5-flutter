import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/appbar_notification_widget.dart';
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

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage>
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
    ref.read(profileNotifierProvider.notifier).changeCurrentTabIndex(newIndex);
  }

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<ProfileProvider>(context, listen: false)
          .changeUserProfilePercentage(
              Provider.of<AppState>(context).isLoggedIn);
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
      _tabController.index = ref.watch(profileNotifierProvider).currentTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTabIndex = ref.watch(profileNotifierProvider).currentTabIndex;

    debugPrint('app $isEditable');
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
                    ref.watch(profileNotifierProvider).appNotificationState.map(
                          showNothing: (_) => Di.ESB,
                          profileCompletion: (notification) =>
                              Provider.of<ProfileProvider>(context)
                                          .percentageProfileCompleted ==
                                      100
                                  ? Di.ESB
                                  : AppbarNotificationWidget(
                                      title:
                                          "Your profile is only ${Provider.of<ProfileProvider>(context).percentageProfileCompleted}% complete. Complete it now to earn first Hospitality Leader grade.",
                                      onButtonPressed: () {
                                        ref
                                            .watch(
                                              profileNotifierProvider.notifier,
                                            )
                                            .changeIsProfieEditableState(
                                              true,
                                            );
                                      },
                                    ),
                          sucess: (notification) => AppbarNotificationWidget(
                            appbarNotificationColor:
                                AppbarNotificationColor.green,
                            buttonText: "View profile",
                            title:
                                "Your profile has been successfully updated.",
                            onButtonPressed: () {
                              ref.watch(profileNotifierProvider.notifier)
                                ..changeIsProfieEditableState(false)
                                ..changeAppNotificationState(
                                  const AppNotificationState.showNothing(),
                                );
                            },
                          ),
                        ),
                    ProfileImageBanner(
                      // userProfileData: DbData.getUserProfileData,
                      userProfileData:
                          ref.watch(profileNotifierProvider).userProfileData!,
                    ),
                    ProfileTabbar(
                      onTap: changeCurrentIndex,
                      // isMine: appState.isLoggedIn,
                      isMine: true,
                      tabController: _tabController,
                    ),
                    Di.SBHEL,
                    Center(
                      child: [
                        PageOverviewSection(
                          isEditable: isEditable,
                          // userProfileData: widget.userProfileData,
                        ),
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

        // userProfileProvider.showProfileLoading
        //     ? CustomLoading()
        //     : Di.ESB,
      ),
    );
  }
}
