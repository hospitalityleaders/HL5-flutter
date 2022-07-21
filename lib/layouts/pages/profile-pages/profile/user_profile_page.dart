// import 'package:holedo/profile/presentation/ui/pages/components/profile_image_banner.dart';
// import 'package:holedo/profile/presentation/ui/pages/components/profile_tabbar.dart';
// import 'package:holedo/profile/presentation/ui/pages/profile_mobile_view/profile_mobile_view_page.dart';
// import 'package:holedo/profile/presentation/ui/pages/sections/activity_section/activity_section.dart';
// import 'package:holedo/profile/presentation/ui/pages/sections/articles_section/articles_section.dart';
// import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_section.dart';
// import 'package:holedo/profile/presentation/ui/pages/sections/reference_section/reference_section.dart';
// import 'package:holedo/profile/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
// import 'package:holedo/profile/presentation/utill/responsive.dart';
// import 'package:tap_canvas/tap_canvas.dart';

// import 'package:flutter/material.dart';
// import 'package:holedo/models/models.dart';
// import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
// import 'package:holedo/profile/presentation/utill/color_resources.dart';
// import 'package:holedo/profile/presentation/utill/dimensions.dart';
// import 'package:holedo/profile/presentation/utill/styles.dart';

// class UserProfilePage extends StatefulWidget {
//   final User userProfileData;

//   const UserProfilePage({
//     Key? key,
//     required this.userProfileData,
//   }) : super(key: key);

//   @override
//   State<UserProfilePage> createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage>
//     with TickerProviderStateMixin {
//   bool isEditable = false;

//   int tabBar = 0;
//   late TabController _tabController;
//   int currentTabIndex = 0;
//   bool showNotifications = true;

//   void changeCurrentIndex(int newIndex) {
//     newIndex == 5
//         ? _tabController.animateTo(0)
//         : _tabController.animateTo(newIndex);
//     setState(() {
//       currentTabIndex = newIndex;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void onTabBarTap(int value) {
//     setState(() {
//       currentTabIndex = _tabController.index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint("userProfileData: is  ${widget.userProfileData.toString()} ");
//     final appState = Provider\.of<AppProvider>\(context\)
//     final bool isMine = appState.isLoginnedAndEditable(widget.userProfileData);
//     debugPrint('app $isEditable');
//     return TapCanvas(
//       child: Container(
//         color: Cr.backgroundColor,
//         child:
//             // if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
//             isTableOrMobile(context)
//                 ? ProfileMobileViewPage(
//                     currentTabIndex: currentTabIndex,
//                     changeCurrentIndex: changeCurrentIndex,
//                     userProfileData: widget.userProfileData,
//                     tabController: _tabController,
//                     onTabBarTap: onTabBarTap,
//                   )
//                 : Center(
//                     child: ListView(
//                       shrinkWrap: true,
//                       children: [
//                         if (showNotifications)
//                           AppbarNotification(
//                             title:
//                                 "Your profile is only 25% complete. Complete it now to earn first Hospitality Leader grade.",
//                             onClosePressed: () {
//                               setState(
//                                 () {
//                                   showNotifications = false;
//                                 },
//                               );
//                             },
//                           ),
//                         ProfileImageBanner(
//                           userProfileData: widget.userProfileData,
//                           onEditButtonPressed: () {},
//                         ),
//                         ProfileTabbar(
//                           onTap: onTabBarTap,
//                           isMine: isMine,
//                           tabController: _tabController,
//                         ),
//                         Di.SBHEL,
//                         Center(
//                           child: [
//                             PageOverviewSection(
//                               isEditable: isEditable,
//                               userProfileData: widget.userProfileData,
//                             ),
//                             TimelineSection(),
//                             ArticlesSection(),
//                             ActivitySection(),
//                             ReferenceSection(),
//                           ][_tabController.index],
//                         ),
//                         Di.SBHOTL,
//                       ],
//                     ),
//                   ),

//         // Provider.of<ProfileProvider>(context).showProfileLoading
//         //     ? CustomLoading()
//         //     : Di.ESB,
//       ),
//     );
//   }
// }

// class AppbarNotification extends StatelessWidget {
//   const AppbarNotification({
//     Key? key,
//     this.onClosePressed,
//     required this.title,
//     this.bgcolor,
//     this.buttonText,
//   }) : super(key: key);

//   final void Function()? onClosePressed;
//   final String title;
//   final String? buttonText;
//   final Color? bgcolor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: Di.getScreenSize(context).width,
//       color: bgcolor ?? Cr.red3,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Di.ESB,
//           Row(
//             children: [
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: bodyLarge.copyWith(
//                   color: Cr.redTextColor,
//                 ),
//               ),
//               CustomElevatedButton(
//                 text: buttonText,
//                 width: 97,
//                 height: 32,
//                 backgroundColor: Cr.redTextColor,
//                 donotShowIcon: true,
//               ),
//             ],
//           ),
//           GestureDetector(
//             onTap: onClosePressed,
//             child: Icon(
//               Icons.close,
//               color: Cr.redTextColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
