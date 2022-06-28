// import 'package:flutter/material.dart';
// import 'package:holedo/models/models.dart';
// import 'package:holedo/presentation/providers/profile_provider.dart';
// import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
// import 'package:holedo/presentation/ui/pages/components/profile_tabbar.dart';
// import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
// import 'package:holedo/presentation/ui/pages/sections/activity_section/activity_section.dart';
// import 'package:holedo/presentation/ui/pages/sections/articles_section/articles_section.dart';
// import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_section.dart';
// import 'package:holedo/presentation/ui/pages/sections/reference_section/reference_section.dart';
// import 'package:holedo/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
// import 'package:holedo/presentation/utill/color_resources.dart';
// import 'package:holedo/presentation/utill/dimensions.dart';
// import 'package:holedo/presentation/utill/styles.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => ProfileProvider(),
//         ),
//       ],
//       child: MaterialApp(
//         builder: (context, child) => ResponsiveWrapper.builder(
//           child,
//           breakpoints: [
//             ResponsiveBreakpoint.resize(650, name: MOBILE),
//             ResponsiveBreakpoint.autoScale(950, name: TABLET),
//             ResponsiveBreakpoint.resize(1200, name: DESKTOP),

//             // ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
//             // ResponsiveBreakpoint.autoScaleDown(1200, name: DESKTOP),
//           ],
//         ),
//         debugShowCheckedModeBanner: false,
//         home: ProfilePage(),
//       ),
//     );
//   }
// }

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage>
//     with TickerProviderStateMixin {
//   int tabBar = 0;
//   late TabController _tabController;
//   bool isEditable = false;

//   @override
//   void initState() {
//     _tabController = TabController(length: 5, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.lightBlue,
//       backgroundColor: Colors.white,
//       body:
//           // ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
//           //     ? ProfileMobileViewPage(
//           //       userProfileData: widget,
//           //     )
//           //     :
//           Center(
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             // CustomAppbar(),
//             Container(
//               height: 50,
//               width: Di.getScreenSize(context).width,
//               color: Cr.red3,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Di.ESB,
//                   Row(
//                     children: [
//                       Text(
//                         "Your profile is only 25% complete. Complete it now to earn your first Hospitality Leaders grade.   ",
//                         textAlign: TextAlign.center,
//                         style: bodyLarge.copyWith(
//                           color: Cr.redTextColor,
//                         ),
//                       ),
//                       CustomElevatedButton(
//                         width: 100,
//                         height: 32,
//                         backgroundColor: Cr.redTextColor,
//                         donotShowIcon: true,
//                       ),
//                     ],
//                   ),
//                   Icon(
//                     Icons.close,
//                     color: Cr.redTextColor,
//                   ),
//                 ],
//               ),
//             ),
//             ProfileImageBanner(
//               userProfileData: User(),
//               onEditButtonPressed: () {},
//             ),
//             ProfileTabbar(
//               tabController: _tabController,
//               onEditProfilePressed: () {
//                 setState(() {
//                   isEditable = !isEditable;
//                 });
//               },
//             ),
//             Di.SBHEL,
//             SizedBox(
//               // width: Di.getScreenSize(context).width,
//               height: 2000,
//               child: TabBarView(
//                 // physics: NeverScrollableScrollPhysics,
//                 controller: _tabController,
//                 children: <Widget>[
//                   PageOverviewSection(
//                     isEditable: false,
//                     userProfileData: User(),
//                   ),
//                   TimelineSection(),
//                   ArticlesSection(),
//                   ActivitySection(),
//                   ReferenceSection(),
//                 ],
//               ),
//             ),
//             Di.SBHOTL,
//           ],
//         ),
//       ),
//     );
//   }
// }
