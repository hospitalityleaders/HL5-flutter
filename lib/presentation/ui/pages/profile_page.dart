import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/application/shared/providers.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:provider/provider.dart' as p;

import 'package:holedo/presentation/ui/components/appbar_notification_widget.dart';
import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/presentation/ui/pages/components/profile_tabbar.dart';
import 'package:holedo/presentation/ui/pages/profile_mobile_view/profile_mobile_view_page.dart';
import 'package:holedo/presentation/ui/pages/sections/activity_section/activity_section.dart';
import 'package:holedo/presentation/ui/pages/sections/articles_section/articles_section.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_section.dart';
import 'package:holedo/presentation/ui/pages/sections/reference_section/reference_section.dart';
import 'package:holedo/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
import 'package:tap_canvas/tap_canvas.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart' hide Provider;

import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

enum CarType { sedan, suv, truck }

class UserProfilePage extends ConsumerStatefulWidget {
  final User userProfileData;

  const UserProfilePage({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage>
    with TickerProviderStateMixin {
  bool isEditable = false;

  int tabBar = 0;
  late TabController _tabController;
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
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void didChangeDependencies() {
    // ref.watch(profileNotifierProvider.notifier).changeCurrentTabIndex(newTabIndex)
    ref.watch(profileNotifierProvider.notifier).changeUserProfilePercentage(
          p.Provider.of<AppState>(context).isLoggedIn,
        );

    setState(() {
      _tabController.index = ref.watch(profileNotifierProvider).currentTabIndex;
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileStateNotifierProvider = ref.watch(profileNotifierProvider);
    print("userProfileData: is  ${widget.userProfileData.toString()} ");
    print('app $isEditable');
    return TapCanvas(
      child: Container(
        color: Cr.backgroundColor,
        child:
            // if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
            Di.getScreenSize(context).width < 1000
                ? ProfileMobileViewPage(
                    currentTabIndex:
                        profileStateNotifierProvider.currentTabIndex,
                    changeCurrentIndex: changeCurrentIndex,
                    userProfileData: widget.userProfileData,
                    tabController: _tabController,
                  )
                : Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        profileStateNotifierProvider.appNotificationState.map(
                          showNothing: (_) => Di.ESB,
                          profileCompletion: (notification) =>
                              profileStateNotifierProvider
                                          .percentageProfileCompleted ==
                                      100
                                  ? Di.ESB
                                  : AppbarNotificationWidget(
                                      title:
                                          "Your profile is only ${profileStateNotifierProvider.percentageProfileCompleted}% complete. Complete it now to earn first Hospitality Leader grade.",
                                      onButtonPressed: () {
                                        ref
                                            .read(profileNotifierProvider
                                                .notifier)
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
                              ref.read(profileNotifierProvider.notifier)
                                ..changeIsProfieEditableState(false)
                                ..changeAppNotificationState(
                                  AppNotificationState.showNothing(),
                                );
                            },
                          ),
                        ),
                        ProfileImageBanner(
                          userProfileData: widget.userProfileData,
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
                              userProfileData: widget.userProfileData,
                            ),
                            TimelineSection(),
                            ArticlesSection(),
                            ActivitySection(),
                            ReferenceSection(),
                          ][profileStateNotifierProvider.currentTabIndex],
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
