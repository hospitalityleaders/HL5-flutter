// previous Code

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:holedo/screens/news/update/widget/update_news_widget.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import '../../../common/common_widget.dart';
// import '../../../constant/colorPicker/color_picker.dart';
// import '../../../constant/fontStyle/font_style.dart';
// import '../../../constant/sizedbox.dart';
// import '../../../controller/menu_controller.dart';
// import '../../../data/data.dart';
// import '../../../responsive/responsive.dart';
// import '../../profile/profile/header.dart';
// import '../../profile/profile/home.dart';
// import '../categories/news_signal.dart';
//
// class UpdateNews extends StatefulWidget {
//   static const String route = '/first';
//   const UpdateNews({Key? key}) : super(key: key);
//
//   @override
//   _UpdateNewsState createState() => _UpdateNewsState();
// }
//
// class _UpdateNewsState extends State<UpdateNews>
//     with SingleTickerProviderStateMixin {
//   final bodyGlobalKey = GlobalKey();
//
//   TabController? _tabController;
//   ScrollController? _scrollController;
//   bool? fixedScroll;
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController!.addListener(_scrollListener);
//     _tabController = TabController(length: 5, vsync: this);
//     _tabController!.addListener(_smoothScrollToTop);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _tabController!.dispose();
//     _scrollController!.dispose();
//     super.dispose();
//   }
//
//   _scrollListener() {
//     if (fixedScroll!) {
//       _scrollController!.jumpTo(0);
//     }
//   }
//
//   _smoothScrollToTop() {
//     _scrollController!.animateTo(
//       0,
//       duration: Duration(microseconds: 300),
//       curve: Curves.ease,
//     );
//
//     setState(() {
//       fixedScroll = _tabController!.index == 2;
//     });
//   }
//
//   MenuController _menuController = Get.find();
//   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   List drawerItem = ['Home', 'Profile', 'News', 'Jobs', 'Recruitment', 'Help'];
//
//   _buildTabContext(int lineCount) => Container(
//           child: Center(
//         child: CommonWidget.text('No Data'),
//       ));
//
//   var nestedKey=GlobalKey();
//
//
//   Widget build(BuildContext context) {
//     return Responsive.isDesktop(context)
//         ? Scaffold(
//             body: NestedScrollView(
//               key: nestedKey,
//               controller: _scrollController,
//               headerSliverBuilder: (context, value) {
//                 return [
//                   SliverToBoxAdapter(
//                     child: Header(),
//                   ),
//                   Obx(() => _menuController.bottomIndex.value == 0
//                       ? SliverToBoxAdapter(
//                           child: Container(
//                             height: 147,
//                             color: ColorPicker.kPrimary,
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     color: ColorPicker.kPrimary,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: Get.height * 0.07),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: [
//                                             Image.asset(
//                                               'assets/icons/rightShield.png',
//                                               height: 33,
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             CommonWidget.text(
//                                               'AHL',
//                                               style:
//                                                   FontTextStyle.kWhite33W600PR,
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         CommonWidget.text(
//                                           'MY GRADE',
//                                           style: FontTextStyle.kWhite16W600PR
//                                               .copyWith(letterSpacing: 2.5),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 VerticalDivider(
//                                   width: 2,
//                                   color: Colors.black,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     color: ColorPicker.kPrimary,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: Get.height * 0.07),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             CommonWidget.text(
//                                               '33% ',
//                                               style: FontTextStyle
//                                                   .kBlueLight33W600PR,
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Image.asset(
//                                               'assets/icons/info.png',
//                                               height: 33,
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         CommonWidget.text(
//                                           'TO NEXT GRADE',
//                                           style: FontTextStyle.kGreyDark16W600PR
//                                               .copyWith(letterSpacing: 2.5),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 VerticalDivider(
//                                   width: 2,
//                                   color: Colors.black,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     color: ColorPicker.kPrimary,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: Get.height * 0.07),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Image.asset(
//                                               'assets/icons/shield.png',
//                                               height: 33,
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             CommonWidget.text(
//                                               'MHL',
//                                               style: FontTextStyle
//                                                   .kGreyDark33W600PR,
//                                             )
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         CommonWidget.text(
//                                           'NEXT GRADE',
//                                           style: FontTextStyle.kGreyDark16W600PR
//                                               .copyWith(letterSpacing: 2.5),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : SliverToBoxAdapter(
//                           child: SizedBox(),
//                         )),
//                   Obx(() => _menuController.bottomIndex.value == 0
//                       ? SliverToBoxAdapter(
//                           child: Container(
//                             height: 87,
//                             width: Get.width,
//                             color: Colors.white,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   width: 600,
//                                   color: Colors.white,
//                                   child: TabBar(
//                                     controller: _tabController,
//                                     labelPadding:
//                                         const EdgeInsets.only(bottom: 15),
//                                     tabs: List.generate(
//                                       Data.tabItem.length,
//                                       (index) => CommonWidget.text(
//                                         Data.tabItem[index],
//                                         style: FontTextStyle.kGreyDark16W600PR,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : SliverToBoxAdapter(child: SizedBox()))
//                 ];
//               },
//               body: Obx(() {
//                 return _menuController.bottomIndex.value == 0
//                     ? Container(
//                         child: TabBarView(
//                           controller: _tabController,
//                           children: [
//                             SingleChildScrollView(
//                               scrollDirection: Axis.vertical,
//                               child: Column(
//                                 children: [
//                                   Responsive.isDesktop(context)
//                                       ? SizedBox(height: Get.height * 0.05)
//                                       : SizedBox(),
//                                   webView(),
//                                 ],
//                               ),
//                             ),
//                             _buildTabContext(200),
//                             _buildTabContext(2),
//                             _buildTabContext(200),
//                             _buildTabContext(2)
//                           ],
//                         ),
//                       )
//                     : _menuController.bottomIndex.value == 1
//                         ? Home()
//                         : _menuController.bottomIndex.value == 2
//                             ? Center(child: Text('News'))
//                             : _menuController.bottomIndex.value == 3
//                                 ? Center(child: Text('Jobs'))
//                                 : _menuController.bottomIndex.value == 4
//                                     ? Center(child: Text('Recruitment'))
//                                     : Center(child: Text('Help'));
//               }),
//             ),
//           )
//         : Scaffold(
//             key: _scaffoldKey,
//             appBar: CommonWidget.tabletAppBar(onTap: () {
//               print('called');
//               _scaffoldKey.currentState!.openEndDrawer();
//             }),
//             endDrawer: Drawer(
//               child: Container(
//                 color: ColorPicker.kPrimaryLight,
//                 child: Column(
//                   children: [
//                     SB.SH20(),
//                     CircleAvatar(
//                       radius: Get.width * 0.12,
//                       backgroundImage:
//                           AssetImage('assets/images/alone_girl.png'),
//                     ),
//                     SB.SH10(),
//                     Text(
//                       'Hello Noberto',
//                       style: FontTextStyle.kWhite20W600PR,
//                     ),
//                     Divider(
//                       color: ColorPicker.kWhite,
//                     ),
//                     SizedBox(
//                       width: Get.width,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: List.generate(
//                           drawerItem.length,
//                           (index) => Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   _menuController.setIndex(index);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Text(
//                                     '${drawerItem[index]}',
//                                     style: FontTextStyle.kWhite16W400SSP,
//                                   ),
//                                 ),
//                               ),
//                               Divider(
//                                 color: ColorPicker.kPrimaryLight,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             body: Obx(() {
//               return _menuController.bottomIndex.value == 0
//                   ? Column(
//                       children: [
//                         Container(
//                           height: 65,
//                           width: Get.width,
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Container(
//                                 width: 600,
//                                 color: Colors.white,
//                                 child: TabBar(
//                                   controller: _tabController,
//                                   labelPadding:
//                                       const EdgeInsets.only(bottom: 15),
//                                   tabs: List.generate(
//                                     Data.tabItem.length,
//                                     (index) => CommonWidget.text(
//                                       Data.tabItem[index],
//                                       style: Responsive.isTablet(context)
//                                           ? FontTextStyle.kGreyDark14W600PR
//                                           : FontTextStyle.kGreyDark10W600PR,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: TabBarView(
//                             controller: _tabController,
//                             children: [
//                               SingleChildScrollView(child: mobileView()),
//                               Center(child: Text('Travel')),
//                               Center(child: Text('Developments')),
//                               Center(child: Text('International')),
//                               Center(child: Text('Investment')),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )
//                   : _menuController.bottomIndex.value == 1
//                       ? Center(child: Text('Profile'))
//                       : _menuController.bottomIndex.value == 2
//                           ? Column(
//                               children: [
//                                 Container(
//                                   height: 65,
//                                   width: Get.width,
//                                   color: Colors.white,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         width: 600,
//                                         color: Colors.white,
//                                         child: TabBar(
//                                           controller: _tabController,
//                                           labelPadding:
//                                               const EdgeInsets.only(bottom: 15),
//                                           tabs: List.generate(
//                                             Data.tabItem.length,
//                                             (index) => CommonWidget.text(
//                                               Data.tabItem[index],
//                                               style:
//                                                   Responsive.isTablet(context)
//                                                       ? FontTextStyle
//                                                           .kGreyDark14W600PR
//                                                       : FontTextStyle
//                                                           .kGreyDark10W600PR,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: TabBarView(
//                                     controller: _tabController,
//                                     children: [
//                                       SingleChildScrollView(
//                                           child: mobileView()),
//                                       Center(child: Text('Travel')),
//                                       Center(child: Text('Developments')),
//                                       Center(child: Text('International')),
//                                       Center(child: Text('Investment')),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             )
//                           : _menuController.bottomIndex.value == 3
//                               ? Center(child: Text('Jobs'))
//                               : _menuController.bottomIndex.value == 4
//                                   ? Center(child: Text('Recruitment'))
//                                   : Center(child: Text('Help'));
//             }),
//           );
//   }
//
//   Padding mobileView() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         ///FIRST ROW TWO CONTAINER MOBILE
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               Container(
//                 height: Get.width * 0.5,
//                 width: Get.width * 0.9,
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                       color: ColorPicker.kGreyDark.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 20)
//                 ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           'assets/images/share.png',
//                           height: Get.width * 0.2,
//                           width: Get.width * 0.25,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CommonWidget.text(
//                               'Hello Noberto',
//                               style: FontTextStyle.kPrimary16W600PR
//                                   .copyWith(fontSize: Get.width * 0.05),
//                             ),
//                             SizedBox(height: Get.width * 0.02),
//                             SizedBox(
//                               width: Get.width * 0.5,
//                               child: CommonWidget.text(
//                                 'What’s news today? Share an update, link or news article with your connections. Get out there!',
//                                 style: FontTextStyle.kGreyLight12W600PR
//                                     .copyWith(fontSize: Get.width * 0.03),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(height: Get.width * 0.02),
//                     Row(
//                       children: [
//                         Container(
//                           height: Get.width * 0.12,
//                           width: Get.width * 0.12,
//                           margin: EdgeInsets.symmetric(
//                               horizontal: Get.width * 0.04),
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image:
//                                       AssetImage('assets/images/profile.png')),
//                               borderRadius: BorderRadius.circular(5)),
//                         ),
//                         Expanded(
//                           child: Container(
//                             height: Get.width * 0.12,
//                             margin: EdgeInsets.only(right: 15),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 border: Border.all(
//                                     color: ColorPicker.kBorder, width: 1),
//                                 color: ColorPicker.kGreyLight2),
//                             child: TextField(
//                               decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintStyle: FontTextStyle.kGreyLight16W600PR,
//                                   contentPadding: EdgeInsets.only(
//                                       top: Get.width * 0.01, left: 10),
//                                   hintText: 'Share an update or link.....'),
//                               style: FontTextStyle.kGreyLight318W600PR,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     SB.SH10(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(right: 15),
//                           height: Get.width * 0.05,
//                           padding: EdgeInsets.symmetric(
//                               horizontal: Get.width * 0.04),
//                           decoration: BoxDecoration(
//                             color: ColorPicker.kBlueLight,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Center(
//                             child: CommonWidget.text(
//                               'Post Update',
//                               style: FontTextStyle.kWhite8W600PR.copyWith(
//                                 fontSize: Get.width * 0.02,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Container(
//                 height: Get.width * 0.5,
//                 width: Get.width * 0.9,
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                       color: ColorPicker.kGreyDark.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 20)
//                 ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Container(
//                         color: ColorPicker.kPrimary,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CommonWidget.text(
//                               '25%',
//                               style: FontTextStyle.kWhite22W600PR
//                                   .copyWith(fontSize: Get.width * 0.05),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             LinearPercentIndicator(
//                               lineHeight: 8.0,
//                               percent: 0.9,
//                               backgroundColor: Colors.black,
//                               progressColor: ColorPicker.kRed,
//                               barRadius: Radius.circular(20),
//                             ),
//                             SizedBox(
//                               height: 25,
//                             ),
//                             CommonWidget.text(
//                               'Your Profile is only\n25% complete',
//                               style: FontTextStyle.kWhite18W600PR,
//                               textAlign: TextAlign.center,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: Get.width * 0.08),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CommonWidget.text(
//                                   'Where did you work before your current job?',
//                                   style: FontTextStyle.kBlueDark20W600PR
//                                       .copyWith(fontSize: Get.width * 0.03),
//                                 ),
//                                 SizedBox(
//                                   height: 25,
//                                 ),
//                                 CommonWidget.text(
//                                   'your work history shows your career path and experience in the industry.',
//                                   style: FontTextStyle.kBlueDark20W600PR
//                                       .copyWith(fontSize: Get.width * 0.03),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(right: 25),
//                                   height: 35,
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: Get.width * 0.01),
//                                   decoration: BoxDecoration(
//                                     color: ColorPicker.kBlueLight,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(
//                                     child: CommonWidget.text(
//                                       'Add work experience',
//                                       style: FontTextStyle.kWhite16W600PR,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           SizedBox(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: Get.width * 0.02),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Row(
//                                     children: List.generate(
//                                       4,
//                                       (index) => Padding(
//                                         padding: const EdgeInsets.all(4.0),
//                                         child: CircleAvatar(
//                                           backgroundColor: index == 0
//                                               ? ColorPicker.kBlueLight
//                                               : ColorPicker.kBlueLight
//                                                   .withOpacity(0.3),
//                                           radius: 5,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.arrow_back_ios,
//                                           size: 20,
//                                           color: ColorPicker.kBlueLight
//                                               .withOpacity(0.5)),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Icon(
//                                         Icons.arrow_forward_ios,
//                                         color: ColorPicker.kBlueLight,
//                                         size: 20,
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 25,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 25,
//         ),
//         Divider(
//           color: ColorPicker.kBorder,
//           thickness: 1,
//         ),
//
//         ///Headline
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 25),
//                   child: CommonWidget.text(
//                     'Headline',
//                     style: FontTextStyle.kBlueDark24W600PR,
//                   ),
//                 ),
//                 Container(
//                   height: 220,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/public.png')),
//                       boxShadow: [
//                         BoxShadow(
//                             color: ColorPicker.kGreyDark.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 20)
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     text: "'We must stay at update': ",
//                     style: FontTextStyle.kRed20W600PR,
//                     children: <TextSpan>[
//                       TextSpan(
//                           text:
//                               'Hong Kong expected to confirm 614 coronavirus cases',
//                           style: FontTextStyle.kPrimaryLight20W600PR),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   child: CommonWidget.text(
//                     'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                     style: FontTextStyle.kGreyLight14W600PR,
//                   ),
//                 ),
//                 Divider(
//                   color: ColorPicker.kBorder,
//                   thickness: 2,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//
//                 ///double container
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image:
//                                         AssetImage('assets/images/public.png')),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: ColorPicker.kGreyDark
//                                           .withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 20)
//                                 ],
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: "Winter Olympics/ ",
//                               style: FontTextStyle.kRed20W600PR,
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text:
//                                         'snowboarder Su Yiming claims silver in slopestyle final',
//                                     style: FontTextStyle.kPrimaryLight20W600PR),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           CommonWidget.text(
//                             'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                             style: FontTextStyle.kGreyLight14W600PR,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: Get.width * 0.04,
//                     ),
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image:
//                                         AssetImage('assets/images/public.png')),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: ColorPicker.kGreyDark
//                                           .withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 20)
//                                 ],
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: "Winter Olympics/ ",
//                               style: FontTextStyle.kRed20W600PR,
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text:
//                                         'snowboarder Su Yiming claims silver in slopestyle final',
//                                     style: FontTextStyle.kPrimaryLight20W600PR),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           CommonWidget.text(
//                             'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                             style: FontTextStyle.kGreyLight14W600PR,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   color: ColorPicker.kBorder,
//                   thickness: 2,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     text: "Winter Olympics/ ",
//                     style: FontTextStyle.kRed20W600PR.copyWith(height: 1.4),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text:
//                               'snowboarder Su Yiming claims silver in slopestyle final',
//                           style: FontTextStyle.kPrimaryLight20W600PR
//                               .copyWith(height: 1.4)),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CommonWidget.text(
//                   'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                   style: FontTextStyle.kGreyLight14W600PR,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//         /// /// hamburg,DE
//         Container(
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Container(
//               width: Get.width,
//               margin: EdgeInsets.all(Get.width * 0.02),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CommonWidget.text(
//                     "Hamburg, DE",
//                     style: FontTextStyle.kPrimaryLight32W600PR,
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.02,
//                   ),
//                   CommonWidget.text(
//                     "3 February 2022 15:13",
//                     style: FontTextStyle.kPrimaryLight16W600PR,
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.02,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset('assets/icons/cloud.png'),
//                       CommonWidget.text(
//                         '7° C',
//                         style: FontTextStyle.kPrimaryLight40W600PR,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.015,
//                   ),
//                   CommonWidget.text(
//                     "Bedecket",
//                     style: FontTextStyle.kPrimaryLight22W600PR,
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.015,
//                   ),
//                   Container(
//                     height: Get.height * 0.067,
//                     width: Get.width * 0.65,
//                     decoration: BoxDecoration(
//                       color: ColorPicker.kBlueLight,
//                       borderRadius: BorderRadius.circular(
//                         4,
//                       ),
//                     ),
//                     child: Center(
//                       child: CommonWidget.text(
//                         'Wheather from OpenWeatherMap',
//                         style: FontTextStyle.kWhite16W600PR,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.015,
//                   ),
//                   Container(
//                     height: Get.height * 0.7,
//                     padding: EdgeInsets.symmetric(vertical: 34, horizontal: 25),
//                     decoration: BoxDecoration(
//                       color: ColorPicker.kPrimaryLight,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CommonWidget.text(
//                           '25%',
//                           style: FontTextStyle.kWhite83W600PR,
//                         ),
//                         LinearPercentIndicator(
//                           lineHeight: 10.0,
//                           width: Get.width * 0.7,
//                           alignment: MainAxisAlignment.center,
//                           percent: 0.25,
//                           backgroundColor: Colors.black,
//                           progressColor: ColorPicker.kRed,
//                           barRadius: Radius.circular(20),
//                         ),
//                         CommonWidget.text(
//                           "Your Profile is only 25% complete. Improve it now. Here's how",
//                           style: FontTextStyle.kWhite18W600PR,
//                           textAlign: TextAlign.center,
//                         ),
//                         ListView.builder(
//                           itemCount: Data.specification.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) => Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     height: 18,
//                                     width: 18,
//                                     color: Color(0xff33A3FE),
//                                     child: Center(
//                                       child: Icon(
//                                         Icons.add,
//                                         size: 16,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 15,
//                                   ),
//                                   Expanded(
//                                     child: CommonWidget.text(
//                                       "Add your work experience",
//                                       style: TextStyle(
//                                           color: Color(0xff33A3FE),
//                                           fontSize: Get.height * 0.018),
//                                     ),
//                                   ),
//                                   Container(
//                                     color: Colors.black.withOpacity(0.2),
//                                     height: 25,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: Get.width * 0.006),
//                                     child: Center(
//                                         child: CommonWidget.text(
//                                       '+20%',
//                                       style: TextStyle(
//                                         color: Color(0xff33A3FE),
//                                       ),
//                                     )),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: Get.width * 0.005,
//                               ),
//                               Divider(
//                                 thickness: 2,
//                               ),
//                               SizedBox(
//                                 height: Get.width * 0.002,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * 0.06,
//                           decoration: BoxDecoration(
//                               color: Color(0xFF33A3FE),
//                               borderRadius:
//                                   BorderRadius.circular(Get.height * 0.01)),
//                           child: Center(
//                             child: CommonWidget.text(
//                               "Edit my profile",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: Get.height * 0.02),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Divider(
//               color: ColorPicker.kBorder,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 15,
//             ),
//           ]),
//         ),
//
//         /// Videos
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               CommonWidget.text(
//                 'Video',
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Color(0xFF101E4A),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: Get.width * 0.03),
//               SizedBox(
//                 height: Get.width * 0.4,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Stack(
//                     overflow: Overflow.visible,
//                     children: [
//                       Image(
//                         image: AssetImage('assets/images/couple_bg.png'),
//                         // height: Get.height * 0.55,
//                         width: Get.width,
//                         fit: BoxFit.cover,
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         child: Container(
//                           height: Get.width * 0.15,
//                           width: Get.width,
//                           color: Colors.black54,
//                           child: Row(children: [
//                             Container(
//                               margin: EdgeInsets.only(left: Get.width * 0.03),
//                               padding: EdgeInsets.all(Get.width * 0.025),
//                               height: Get.width * 0.08,
//                               width: Get.width * 0.08,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(1)),
//                               // child: Icon(Icons.play_arrow_rounded,
//                               //     color: Colors.white, size: 50),
//                               child: SvgPicture.asset(
//                                 'assets/icons/play_arrow.svg',
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(width: Get.width * 0.01),
//                             CommonWidget.text(
//                               'Couple fight boy’s brain cancer with\nnatural remedies',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             )
//                           ]),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: Get.width * 0.03),
//               Divider(color: ColorPicker.kBorder),
//               Divider(color: ColorPicker.kBorder),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: ColorPicker.kBorder),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: ColorPicker.kBorder),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: Get.width * 0.03),
//             ]),
//           ),
//         ),
//
//         ///Widget block type X
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CommonWidget.text(
//                   'Widget block type X',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Color(0xFF101E4A),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: Get.width * 0.03),
//                 Container(
//                     width: Get.width,
//                     height: Get.width * 0.3,
//                     alignment: Alignment.center,
//                     // width: Get.width,
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(4)),
//                     child: CommonWidget.text(
//                       'Widget Area',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )),
//                 SizedBox(height: Get.width * 0.06),
//               ],
//             ),
//           ),
//         ),
//
//         ///Jobs you might be interested in
//         Container(
//           color: ColorPicker.kBg1,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               CommonWidget.text(
//                 'Jobs you might be\ninterested in',
//                 style: FontTextStyle.kBlueDark24W600PR.copyWith(height: 1.2),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 339,
//                 child: ListView.builder(
//                   itemCount: 10,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => Container(
//                     height: 281,
//                     margin: EdgeInsets.only(right: Get.width * 0.01),
//                     width: 251,
//                     decoration: BoxDecoration(
//                         border:
//                             Border.all(width: 2, color: ColorPicker.kBorder1),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Container(
//                             height: 30,
//                             width: 153,
//                             margin: EdgeInsets.only(top: 16, right: 16),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(3),
//                                 color: ColorPicker.kGreen),
//                             child: Center(
//                                 child: CommonWidget.text(
//                               'Premium Listing',
//                               style: FontTextStyle.kWhite116W600PR,
//                             )),
//                           ),
//                         ),
//                         index.isOdd
//                             ? SizedBox(
//                                 height: 32,
//                               )
//                             : SizedBox(),
//                         index.isOdd
//                             ? Image.asset('assets/images/fairmont_logo.png')
//                             : Image.asset('assets/images/hilton_logo.png'),
//                         SizedBox(
//                           height: 35,
//                         ),
//                         Divider(
//                           color: ColorPicker.kBorder,
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: CommonWidget.text(
//                               'Cluster Sales Manager - Leisure & MICE',
//                               style: FontTextStyle.kBlueDark22W600PR),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: CommonWidget.text('Hilton, Capetown',
//                                 style: FontTextStyle.kGreyDark16W600PR),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: Get.width * 0.06),
//             ],
//           ),
//         ),
//
//         ///Category Type B
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: Get.width * 0.05),
//                 CommonWidget.text(
//                   'Category Type B',
//                   style: FontTextStyle.kBlueDark24W600PR,
//                 ),
//                 SizedBox(height: Get.width * 0.05),
//                 Container(
//                   height: 220,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/public.png')),
//                       boxShadow: [
//                         BoxShadow(
//                             color: ColorPicker.kGreyDark.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 20)
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     text: "'We must stay at update': ",
//                     style: FontTextStyle.kRed20W600PR,
//                     children: <TextSpan>[
//                       TextSpan(
//                           text:
//                               'Hong Kong expected to confirm 614 coronavirus cases',
//                           style: FontTextStyle.kPrimaryLight20W600PR),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CommonWidget.text(
//                   'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                   style: FontTextStyle.kGreyLight14W600PR,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Divider(
//                   color: ColorPicker.kBorder,
//                   thickness: 2,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(children: [
//                     TextSpan(
//                       text: 'Winter Olympics/ ',
//                       style: TextStyle(
//                         color: Color(0xFFEF3534),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                     TextSpan(
//                       text:
//                           'snowboarder Su Yiming claims silver in slopestyle final ',
//                       style: TextStyle(
//                         color: Color(0xFF101E4A),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     )
//                   ]),
//                 ),
//                 SB.SH20(),
//                 CommonWidget.text(
//                   'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                   style: TextStyle(
//                     color: Color(0xFFA1A1A1),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SB.SH20(),
//                 Divider(
//                   color: ColorPicker.kBorder,
//                   thickness: 2,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//
//                 ///double container
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image:
//                                         AssetImage('assets/images/public.png')),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: ColorPicker.kGreyDark
//                                           .withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 20)
//                                 ],
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: "'We must stay at update': ",
//                               style: FontTextStyle.kRed20W600PR,
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text:
//                                         'Hong Kong expected to confirm 614 coronavirus cases',
//                                     style: FontTextStyle.kPrimaryLight20W600PR),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           CommonWidget.text(
//                             'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                             style: FontTextStyle.kGreyLight14W600PR,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: Get.width * 0.04,
//                     ),
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image:
//                                         AssetImage('assets/images/public.png')),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: ColorPicker.kGreyDark
//                                           .withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 20)
//                                 ],
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: "'We must stay at update': ",
//                               style: FontTextStyle.kRed20W600PR,
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text:
//                                         'Hong Kong expected to confirm 614 coronavirus cases',
//                                     style: FontTextStyle.kPrimaryLight20W600PR),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           CommonWidget.text(
//                             'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                             style: FontTextStyle.kGreyLight14W600PR,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 ///Hamburg, DE
//                 openWeatherMapMob(),
//
//                 SizedBox(
//                   height: Get.height * 0.015,
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//         ///Category Type A
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                 CommonWidget.text(
//                   'Category Type A',
//                   style: FontTextStyle.kBlueDark24W600PR.copyWith(height: 1.2),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: 300,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/alone_girl.png')),
//                       boxShadow: [
//                         BoxShadow(
//                             color: ColorPicker.kGreyDark.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 20)
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(children: [
//                     TextSpan(
//                       text: "‘I’ve had letters from klansmen’: ",
//                       style: FontTextStyle.kRed20W600PR,
//                     ),
//                     TextSpan(
//                       text: 'Jennifer Beals on Flashdance',
//                       style: FontTextStyle.kBlueDark20W600PR,
//                     )
//                   ]),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: CircleAvatar(
//                     radius: Get.width * 0.2,
//                     backgroundImage: AssetImage('assets/images/profile2.png'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: CommonWidget.text(
//                     'How buddhism has changed\nthe west for better',
//                     textAlign: TextAlign.center,
//                     style: FontTextStyle.kBlueDark20W600PR,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: CommonWidget.text(
//                     'Rebecca Sonlit',
//                     textAlign: TextAlign.center,
//                     style: FontTextStyle.kRed20W600PR,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Divider(
//                   color: ColorPicker.kBorder,
//                   thickness: 2,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image:
//                                         AssetImage('assets/images/public.png')),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: ColorPicker.kGreyDark
//                                           .withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 20)
//                                 ],
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: "'We must stay at update': ",
//                               style: FontTextStyle.kRed20W600PR,
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text:
//                                         'Hong Kong expected to confirm 614 coronavirus cases',
//                                     style: FontTextStyle.kPrimaryLight20W600PR),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           CommonWidget.text(
//                             'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                             style: FontTextStyle.kGreyLight14W600PR,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: Get.width * 0.04,
//                     ),
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image:
//                                         AssetImage('assets/images/public.png')),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: ColorPicker.kGreyDark
//                                           .withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 20)
//                                 ],
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: "'We must stay at update': ",
//                               style: FontTextStyle.kRed20W600PR,
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text:
//                                         'Hong Kong expected to confirm 614 coronavirus cases',
//                                     style: FontTextStyle.kPrimaryLight20W600PR),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           CommonWidget.text(
//                             'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                             style: FontTextStyle.kGreyLight14W600PR,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   color: ColorPicker.kBorder,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(children: [
//                     TextSpan(
//                       text: 'Winter Olympics/ ',
//                       style: TextStyle(
//                         color: Color(0xFFEF3534),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                     TextSpan(
//                       text:
//                           'snowboarder Su Yiming claims silver in slopestyle final ',
//                       style: TextStyle(
//                         color: Color(0xFF101E4A),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     )
//                   ]),
//                 ),
//                 SB.SH20(),
//                 CommonWidget.text(
//                   'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                   style: TextStyle(
//                     color: Color(0xFFA1A1A1),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SB.SH20(),
//                 Container(
//                     margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
//                     alignment: Alignment.center,
//                     height: 268,
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(4)),
//                     child: CommonWidget.text(
//                       'Widget Area',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )),
//                 SizedBox(height: 40)
//               ])),
//         ),
//
//         ///People in your area or industry
//         Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CommonWidget.text(
//                 'People in your area or industry',
//                 style: FontTextStyle.kBlueDark24W600PR.copyWith(height: 1.2),
//               ),
//               SB.SH20(),
//               Container(
//                 height: 325,
//                 child: ListView.builder(
//                   itemCount: 10,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => Container(
//                     height: 325,
//                     margin: EdgeInsets.only(right: Get.width * 0.02),
//                     width: 187,
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 2, color: Color(0XFFCACACA)),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           child: ClipRRect(
//                             borderRadius:
//                                 BorderRadius.vertical(top: Radius.circular(5)),
//                             child: Image(
//                               height: 150,
//                               width: Get.width,
//                               fit: BoxFit.fill,
//                               image: index.isEven
//                                   ? AssetImage('assets/images/nasa.png')
//                                   : AssetImage('assets/images/winter.png'),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 170,
//                           padding: EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               index.isEven
//                                   ? CommonWidget.text(
//                                       'Nasa concerned',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 19,
//                                         color: Color(0xFF101E4A),
//                                       ),
//                                     )
//                                   : CommonWidget.text(
//                                       'Winter Olympics',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 19,
//                                         color: Color(0xFF101E4A),
//                                       ),
//                                     ),
//                               index.isEven
//                                   ? CommonWidget.text(
//                                       'Nasa has expressed concern about SpaceX’s proposed second-generation',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 14,
//                                         wordSpacing: 2,
//                                         color: Color(0xFFA1A1A1),
//                                       ))
//                                   : CommonWidget.text(
//                                       'Fans of Chinese teen snowboard sensation Su Yiming expressed feelings',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 14,
//                                         wordSpacing: 2,
//                                         color: Color(0xFFA1A1A1),
//                                       ),
//                                     ),
//                               SB.SH20(),
//                               Container(
//                                 height: 31,
//                                 width: Get.width * 0.25,
//                                 decoration: BoxDecoration(
//                                     color: ColorPicker.kBlueLight),
//                                 child: Center(
//                                   child: CommonWidget.text('Connect',
//                                       style: FontTextStyle.kWhite14W600PR),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SB.SH20(),
//             ],
//           ),
//         ),
//
//         /// Widget block type D
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               CommonWidget.text(
//                 'Widget block type D',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 24,
//                   color: Color(0xFF101E4A),
//                 ),
//               ),
//               SB.SH20(),
//               Container(
//                   height: 270,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/images/news.png')),
//                   )),
//               SB.SH20(),
//               Container(
//                   height: 560,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage('assets/images/twitter.png')),
//                   )),
//               SB.SH20(),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: ColorPicker.kBorder),
//               SB.SH10(),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: ColorPicker.kBorder),
//               SB.SH10(),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SB.SH20(),
//               openWeatherMapMob(),
//               SB.SH20(),
//             ]),
//           ),
//         ),
//
//         ///Latest Topics
//         Container(
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             CommonWidget.text(
//               'Latest Topics',
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 24,
//                 color: Color(0xFF101E4A),
//               ),
//             ),
//             SB.SH20(),
//             Container(
//               height: 299,
//               child: ListView.builder(
//                 itemCount: 10,
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) => Container(
//                   height: 299,
//                   margin: EdgeInsets.only(right: Get.width * 0.02),
//                   width: 187,
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 2, color: Color(0XFFCACACA)),
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.white),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         child: ClipRRect(
//                           borderRadius:
//                               BorderRadius.vertical(top: Radius.circular(5)),
//                           child: Image(
//                             height: 150,
//                             width: Get.width,
//                             fit: BoxFit.fill,
//                             image: index.isEven
//                                 ? AssetImage('assets/images/nasa.png')
//                                 : AssetImage('assets/images/winter.png'),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 140,
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             index.isEven
//                                 ? CommonWidget.text(
//                                     'Nasa concerned',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 19,
//                                       color: Color(0xFF101E4A),
//                                     ),
//                                   )
//                                 : CommonWidget.text(
//                                     'Winter Olympics',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 19,
//                                       color: Color(0xFF101E4A),
//                                     ),
//                                   ),
//                             index.isEven
//                                 ? CommonWidget.text(
//                                     'Nasa has expressed concern about SpaceX’s proposed second-generation',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14,
//                                       wordSpacing: 2,
//                                       color: Color(0xFFA1A1A1),
//                                     ))
//                                 : CommonWidget.text(
//                                     'Fans of Chinese teen snowboard sensation Su Yiming expressed feelings',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14,
//                                       wordSpacing: 2,
//                                       color: Color(0xFFA1A1A1),
//                                     ),
//                                   )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 padding: EdgeInsets.symmetric(vertical: 1),
//                 alignment: Alignment.center,
//                 height: 15,
//                 width: Get.width,
//                 // color: Colors.red,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 5,
//                   itemBuilder: (context, index) {
//                     return CircleAvatar(
//                       // foregroundColor: Colors.red,
//                       backgroundColor: index == 0
//                           ? Color(0xFF33A3FE)
//                           : Color(0xFF33A3FE).withOpacity(0.19),
//                     );
//                   },
//                 )),
//             SB.SH30(),
//           ]),
//         ),
//
//         ///Widget block type E
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               CommonWidget.text(
//                 'Widget block type E',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 24,
//                   color: Color(0xFF101E4A),
//                 ),
//               ),
//               SB.SH20(),
//               Container(
//                 height: 225,
//                 // color: Colors.red,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(4),
//                         child: Image(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/E1.png'),
//                         ),
//                       ),
//                     ),
//                     SB.SW10(),
//                     Flexible(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(4),
//                         child: Image(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/E2.png'),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SB.SH20(),
//               Divider(
//                   color: Color(0xFFDADADA),
//                   indent: 10,
//                   endIndent: 10,
//                   thickness: 1),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Color(0xFFDADADA), thickness: 1),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Color(0xFFDADADA), thickness: 1),
//               Container(
//                 // color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //SB.SH20(),
//                       RichText(
//                         textAlign: TextAlign.start,
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Winter Olympics/ ',
//                             style: TextStyle(
//                               color: Color(0xFFEF3534),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 'snowboarder Su Yiming claims silver in slopestyle final ',
//                             style: TextStyle(
//                               color: Color(0xFF101E4A),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           )
//                         ]),
//                       ),
//                       SB.SH20(),
//                       CommonWidget.text(
//                         'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                         style: TextStyle(
//                           color: Color(0xFFA1A1A1),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SB.SH20(),
//               Container(
//                   width: Get.width,
//                   height: Get.width * 0.9,
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(4)),
//                   child: Center(
//                     child: CommonWidget.text(
//                       'Widget Area',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   )),
//               SB.SH30(),
//             ]),
//           ),
//         ),
//
//         ///Category
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(NewsSingleScreen.route);
//           },
//           child: Container(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                 CommonWidget.text(
//                   'Category',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 24,
//                     color: Color(0xFF101E4A),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(4),
//                   child: Image(
//                     width: Get.width,
//                     height: Get.width * 0.8,
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/images/E1.png'),
//                   ),
//                 ),
//                 Container(
//                   // color: Colors.blue,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //SB.SH20(),
//                         RichText(
//                           textAlign: TextAlign.start,
//                           text: TextSpan(children: [
//                             TextSpan(
//                               text: '‘We must stay at update’: ',
//                               style: TextStyle(
//                                 color: Color(0xFFEF3534),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             TextSpan(
//                               text:
//                                   'Hong Kong expected to confirm 614 coronavirus cases',
//                               style: TextStyle(
//                                 color: Color(0xFF101E4A),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 20,
//                               ),
//                             )
//                           ]),
//                         ),
//                         SB.SH20(),
//                         CommonWidget.text(
//                           'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                           style: TextStyle(
//                             color: Color(0xFFA1A1A1),
//                             fontWeight: FontWeight.w600,
//                             wordSpacing: 2,
//                             fontSize: 14,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(4),
//                   child: Image(
//                     width: Get.width,
//                     height: Get.width * 0.8,
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/images/E2.png'),
//                   ),
//                 ),
//                 Container(
//                   // color: Colors.blue,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //SB.SH20(),
//                         RichText(
//                           textAlign: TextAlign.start,
//                           text: TextSpan(children: [
//                             TextSpan(
//                               text: '‘We must stay at update’: ',
//                               style: TextStyle(
//                                 color: Color(0xFFEF3534),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             TextSpan(
//                               text:
//                                   'Hong Kong expected to confirm 614 coronavirus cases',
//                               style: TextStyle(
//                                 color: Color(0xFF101E4A),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 20,
//                               ),
//                             )
//                           ]),
//                         ),
//                         SB.SH20(),
//                         CommonWidget.text(
//                           'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
//                           style: TextStyle(
//                             color: Color(0xFFA1A1A1),
//                             fontWeight: FontWeight.w600,
//                             wordSpacing: 2,
//                             fontSize: 14,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Divider(color: Color(0xFFDADADA), thickness: 1),
//                 Container(
//                   // color: Colors.blue,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //SB.SH20(),
//                         RichText(
//                           textAlign: TextAlign.start,
//                           text: TextSpan(children: [
//                             TextSpan(
//                               text: 'Winter Olympics/ ',
//                               style: TextStyle(
//                                 color: Color(0xFFEF3534),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             TextSpan(
//                               text:
//                                   'snowboarder Su Yiming claims silver in slopestyle final ',
//                               style: TextStyle(
//                                 color: Color(0xFF101E4A),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             )
//                           ]),
//                         ),
//                         SB.SH20(),
//                         CommonWidget.text(
//                           'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                           style: TextStyle(
//                             color: Color(0xFFA1A1A1),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 14,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Divider(color: Color(0xFFDADADA), thickness: 1),
//                 Container(
//                   // color: Colors.blue,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //SB.SH20(),
//                         RichText(
//                           textAlign: TextAlign.start,
//                           text: TextSpan(children: [
//                             TextSpan(
//                               text: 'Winter Olympics/ ',
//                               style: TextStyle(
//                                 color: Color(0xFFEF3534),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             TextSpan(
//                               text:
//                                   'snowboarder Su Yiming claims silver in slopestyle final ',
//                               style: TextStyle(
//                                 color: Color(0xFF101E4A),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             )
//                           ]),
//                         ),
//                         SB.SH20(),
//                         CommonWidget.text(
//                           'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                           style: TextStyle(
//                             color: Color(0xFFA1A1A1),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 14,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Divider(color: Color(0xFFDADADA), thickness: 1),
//                 Container(
//                   // color: Colors.blue,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //SB.SH20(),
//                         RichText(
//                           textAlign: TextAlign.start,
//                           text: TextSpan(children: [
//                             TextSpan(
//                               text: 'Winter Olympics/ ',
//                               style: TextStyle(
//                                 color: Color(0xFFEF3534),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             TextSpan(
//                               text:
//                                   'snowboarder Su Yiming claims silver in slopestyle final ',
//                               style: TextStyle(
//                                 color: Color(0xFF101E4A),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             )
//                           ]),
//                         ),
//                         SB.SH20(),
//                         CommonWidget.text(
//                           'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
//                           style: TextStyle(
//                             color: Color(0xFFA1A1A1),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 14,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ])),
//         ),
//       ]),
//     );
//   }
//
//   Container openWeatherMapMob() {
//     return Container(
//       height: 325,
//       width: Get.width,
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       decoration: BoxDecoration(
//         color: ColorPicker.kPrimaryLight,
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CommonWidget.text(
//             "Hamburg, DE",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: Get.height * 0.02,
//           ),
//           CommonWidget.text(
//             "3 February 2022 15:13",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: Get.height * 0.02,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('assets/icons/cloud.png', height: 30),
//               CommonWidget.text(
//                 '7° C',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: Get.height * 0.015,
//           ),
//           CommonWidget.text(
//             "Bedecket",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: Get.height * 0.015,
//           ),
//           Container(
//             height: Get.height * 0.067,
//             width: Get.width * 0.75,
//             decoration: BoxDecoration(
//               color: Color(0xFF33A3FE),
//               borderRadius: BorderRadius.circular(
//                 4,
//               ),
//             ),
//             child: Center(
//               child: CommonWidget.text(
//                 'Wheather from OpenWeatherMap',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Container webView() {
//     return Container(
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         ///FIRST ROW TWO CONTAINER
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 413,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/images/share.png',
//                             height: 189,
//                             width: Get.width * 0.14,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CommonWidget.text(
//                                 'Hello Noberto',
//                                 style: FontTextStyle.kPrimary32W600PR,
//                               ),
//                               SB.SH25(),
//                               SizedBox(
//                                 width: Get.width * 0.21,
//                                 child: CommonWidget.text(
//                                   'What’s news today? Share an update, link or news article with your connections. Get out there!',
//                                   style: FontTextStyle.kGreyLight18W600PR,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       SB.SH25(),
//                       Row(
//                         children: [
//                           Container(
//                             height: 70,
//                             width: 70,
//                             margin: EdgeInsets.symmetric(horizontal: 30),
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage(
//                                         'assets/images/profile.png')),
//                                 borderRadius: BorderRadius.circular(5)),
//                           ),
//                           Expanded(
//                             child: Container(
//                               height: 70,
//                               margin: EdgeInsets.only(right: 45),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   border: Border.all(
//                                       color: ColorPicker.kBorder, width: 1),
//                                   color: ColorPicker.kGreyLight2),
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintStyle:
//                                         FontTextStyle.kGreyLight318W600PR,
//                                     contentPadding:
//                                         EdgeInsets.only(top: 18, left: 10),
//                                     hintText: 'Share an update or link.....'),
//                                 style: FontTextStyle.kGreyLight318W600PR,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SB.SH25(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 45),
//                             height: 47,
//                             width: Get.width * 0.08,
//                             decoration: BoxDecoration(
//                               color: ColorPicker.kBlueLight,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: CommonWidget.text('Post Update',
//                                   style: FontTextStyle.kWhite16W600PR),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 57,
//               ),
//               Expanded(
//                 child: Container(
//                   height: 413,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           color: ColorPicker.kPrimary,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CommonWidget.text(
//                                 '25%',
//                                 style: FontTextStyle.kWhite83W600PR
//                                     .copyWith(fontSize: Get.width * 0.05),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               LinearPercentIndicator(
//                                 lineHeight: 8.0,
//                                 percent: 0.9,
//                                 backgroundColor: Colors.black,
//                                 progressColor: ColorPicker.kRed,
//                                 barRadius: Radius.circular(20),
//                               ),
//                               SizedBox(
//                                 height: 25,
//                               ),
//                               CommonWidget.text(
//                                 'Your Profile is only\n25% complete',
//                                 style: FontTextStyle.kWhite18W600PR,
//                                 textAlign: TextAlign.center,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 3,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: Get.width * 0.02),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     width: Get.width * 0.21,
//                                     child: CommonWidget.text(
//                                       'Where did you work before your current job?',
//                                       style: FontTextStyle.kBlueDark20W600PR,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 25,
//                                   ),
//                                   SizedBox(
//                                     width: Get.width * 0.21,
//                                     child: CommonWidget.text(
//                                       'your work history shows your career path and experience in the industry.',
//                                       style: FontTextStyle.kBlueDark20W600PR,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 25,
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 45),
//                                     height: 47,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: Get.width * 0.01),
//                                     decoration: BoxDecoration(
//                                       color: ColorPicker.kBlueLight,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Center(
//                                       child: CommonWidget.text(
//                                         'Add work experience',
//                                         style: FontTextStyle.kWhite16W600PR,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 50,
//                             ),
//                             SizedBox(
//                               width: Get.width * 0.25,
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: Get.width * 0.02),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Row(
//                                       children: List.generate(
//                                         4,
//                                         (index) => Padding(
//                                           padding: const EdgeInsets.all(4.0),
//                                           child: CircleAvatar(
//                                             backgroundColor: index == 0
//                                                 ? ColorPicker.kBlueLight
//                                                 : ColorPicker.kBlueLight
//                                                     .withOpacity(0.3),
//                                             radius: 8,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(Icons.arrow_back_ios,
//                                             size: 35,
//                                             color: ColorPicker.kBlueLight
//                                                 .withOpacity(0.5)),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Icon(
//                                           Icons.arrow_forward_ios,
//                                           color: ColorPicker.kBlueLight,
//                                           size: 35,
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 25,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SB.SH50(),
//
//         ///Headline
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().headlineBlock()),
//         SB.SH50(),
//
//         ///WHITE BIG
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().videoBlock()),
//         SB.SH50(),
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().blockTitle('Jobs you might be interested in')),
//         SB.SH30(),
//
//         ///Jobs you might be interested in
//         HomeWidget().jobsBlock(),
//         SB.SH50(),
//         HomeWidget().widgetIndicator(),
//         SizedBox(
//           height: 30,
//         ),
//
//         ///Category Type B
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().categoryB()),
//         SB.SH50(),
//
//         ///Category Type A
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().categoryA()),
//         SB.SH50(),
//
//         ///People in your area or industry
//         HomeWidget().blockTitle('People in your area or industry'),
//         SB.SH30(),
//         HomeWidget().peopleBlock(),
//         SizedBox(
//           height: 50,
//         ),
//         HomeWidget().widgetIndicator(),
//         SizedBox(
//           height: 50,
//         ),
//
//         ///Category Type C
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().categoryC()),
//
//         ///Latest News
//         SB.SH50(),
//         HomeWidget().blockTitle('Latest News'),
//         SB.SH50(),
//         HomeWidget().latestNewsBlock(),
//         SB.SH50(),
//         HomeWidget().widgetIndicator(),
//         SB.SH50(),
//
//         ///Category Type D
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().categoryD()),
//         SB.SH50(),
//
//         ///Latest Topic
//         HomeWidget().blockTitle('Latest Topic'),
//         SB.SH50(),
//         HomeWidget().latestNewsBlock(),
//         SB.SH50(),
//         HomeWidget().widgetIndicator(),
//         SB.SH50(),
//
//         ///Category Type E
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().categoryE()),
//         SB.SH50(),
//
//         ///Category
//         InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed(NewsSingleScreen.route);
//             },
//             child: HomeWidget().category()),
//         SB.SH50(),
//       ]),
//     );
//   }
// }

// latest code
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holedo/screens/Authentication/login.dart';
import 'package:holedo/screens/news/update/widget/update_news_widget.dart';
import 'package:holedo/screens/profile-pages/profile/header.dart';
import 'package:holedo/screens/profile-pages/profile/profile-page.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../common/common_widget.dart';
import '../../../constant/colorPicker/color_picker.dart';
import '../../../constant/fontStyle/font_style.dart';
import '../../../constant/sizedbox.dart';
import '../../../controller/menu_controller.dart';
import '../../../data/data.dart';
import '../../../responsive/responsive.dart';
import '../categories/news_signal.dart';

class UpdateNews extends StatefulWidget {
  static const String route = '/first';

  UpdateNews({Key? key}) : super(key: key);

  @override
  _UpdateNewsState createState() => _UpdateNewsState();
}

class _UpdateNewsState extends State<UpdateNews>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  MenuController _menuController = Get.find();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List drawerItem = ['Home', 'Profile', 'News', 'Jobs', 'Recruitment', 'Help'];

  _buildTabContext(int lineCount) => Container(
          child: Center(
        child: CommonWidget.text('No Data'),
      ));

  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Scaffold(
            body: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Header(),
                    _menuController.menuIndex.value == 0
                        ? Column(
                            children: [
                              Container(
                                height: 147,
                                color: ColorPicker.kPrimary,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: ColorPicker.kPrimary,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.height * 0.07),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Image.asset(
                                                  'assets/icons/rightShield.png',
                                                  height: 33,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CommonWidget.text(
                                                  'AHL',
                                                  style: FontTextStyle
                                                      .kWhite33W600PR,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CommonWidget.text(
                                              'MY GRADE',
                                              style: FontTextStyle
                                                  .kWhite16W600PR
                                                  .copyWith(letterSpacing: 2.5),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      width: 2,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: ColorPicker.kPrimary,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.height * 0.07),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonWidget.text(
                                                  '33% ',
                                                  style: FontTextStyle
                                                      .kBlueLight33W600PR,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                  'assets/icons/info.png',
                                                  height: 33,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CommonWidget.text(
                                              'TO NEXT GRADE',
                                              style: FontTextStyle
                                                  .kGreyDark16W600PR
                                                  .copyWith(letterSpacing: 2.5),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      width: 2,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: ColorPicker.kPrimary,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.height * 0.07),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/icons/shield.png',
                                                  height: 33,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                CommonWidget.text(
                                                  'MHL',
                                                  style: FontTextStyle
                                                      .kGreyDark33W600PR,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CommonWidget.text(
                                              'NEXT GRADE',
                                              style: FontTextStyle
                                                  .kGreyDark16W600PR
                                                  .copyWith(letterSpacing: 2.5),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 87,
                                width: Get.width,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 600,
                                      color: Colors.white,
                                      child: TabBar(
                                        controller: _tabController,
                                        onTap: (int value) {
                                          _menuController.setTabIndex(value);
                                        },
                                        labelPadding:
                                            const EdgeInsets.only(bottom: 15),
                                        tabs: List.generate(
                                          Data.tabItem.length,
                                          (index) => CommonWidget.text(
                                            Data.tabItem[index],
                                            style:
                                                FontTextStyle.kGreyDark16W600PR,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IndexedStack(
                                key: ValueKey<int>(_menuController
                                    .tabIndex.value
                                    .toInt()), // add this line
                                index: _menuController.tabIndex.value.toInt(),
                                children: <Widget>[
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        Responsive.isDesktop(context)
                                            ? SizedBox(
                                                height: Get.height * 0.05)
                                            : SizedBox(),
                                        webView(),
                                      ],
                                    ),
                                  ),
                                  _buildTabContext(200),
                                  _buildTabContext(2),
                                  _buildTabContext(200),
                                  _buildTabContext(2)
                                ],
                              ),
                            ],
                          )

                        //Profile page functionality

                        : _menuController.menuIndex.value == 1
                            ? ProfilePage()
                            : _menuController.menuIndex.value == 2
                                ? Column(
                                    children: [
                                      Container(
                                        height: 147,
                                        color: ColorPicker.kPrimary,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: ColorPicker.kPrimary,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Get.height * 0.07),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/rightShield.png',
                                                          height: 33,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        CommonWidget.text(
                                                          'AHL',
                                                          style: FontTextStyle
                                                              .kWhite33W600PR,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    CommonWidget.text(
                                                      'MY GRADE',
                                                      style: FontTextStyle
                                                          .kWhite16W600PR
                                                          .copyWith(
                                                              letterSpacing:
                                                                  2.5),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              width: 2,
                                              color: Colors.black,
                                            ),
                                            Expanded(
                                              child: Container(
                                                color: ColorPicker.kPrimary,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Get.height * 0.07),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CommonWidget.text(
                                                          '33% ',
                                                          style: FontTextStyle
                                                              .kBlueLight33W600PR,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Image.asset(
                                                          'assets/icons/info.png',
                                                          height: 33,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    CommonWidget.text(
                                                      'TO NEXT GRADE',
                                                      style: FontTextStyle
                                                          .kGreyDark16W600PR
                                                          .copyWith(
                                                              letterSpacing:
                                                                  2.5),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              width: 2,
                                              color: Colors.black,
                                            ),
                                            Expanded(
                                              child: Container(
                                                color: ColorPicker.kPrimary,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Get.height * 0.07),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/shield.png',
                                                          height: 33,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        CommonWidget.text(
                                                          'MHL',
                                                          style: FontTextStyle
                                                              .kGreyDark33W600PR,
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    CommonWidget.text(
                                                      'NEXT GRADE',
                                                      style: FontTextStyle
                                                          .kGreyDark16W600PR
                                                          .copyWith(
                                                              letterSpacing:
                                                                  2.5),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 87,
                                        width: Get.width,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 600,
                                              color: Colors.white,
                                              child: TabBar(
                                                controller: _tabController,
                                                labelPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 15),
                                                tabs: List.generate(
                                                  Data.tabItem.length,
                                                  (index) => CommonWidget.text(
                                                    Data.tabItem[index],
                                                    style: FontTextStyle
                                                        .kGreyDark16W600PR,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IndexedStack(
                                        // This key causes the AnimatedSwitcher to interpret this as a "new"
                                        // child each time the count changes, so that it will begin its animation
                                        // when the count changes.
                                        key: ValueKey<int>(_tabController!
                                            .index), // add this line
                                        index: _tabController!.index,
                                        children: <Widget>[
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: [
                                                Responsive.isDesktop(context)
                                                    ? SizedBox(
                                                        height:
                                                            Get.height * 0.05)
                                                    : SizedBox(),
                                                webView(),
                                              ],
                                            ),
                                          ),
                                          _buildTabContext(200),
                                          _buildTabContext(2),
                                          _buildTabContext(200),
                                          _buildTabContext(2)
                                        ],
                                      ),
                                    ],
                                  )
                                : _menuController.menuIndex.value == 3
                                    ? Center(child: Text('Jobs'))
                                    : _menuController.menuIndex.value == 4
                                        ? Center(child: Text('Recruitment'))
                                        : Container(
                                            child: Text('help'),
                                          )
                  ],
                ),
              );
            }),
          )
        : SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              appBar: CommonWidget.tabletAppBarLogIn(onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              }),
              endDrawer: Drawer(
                child: Container(
                  color: ColorPicker.kPrimaryLight,
                  child: Column(
                    children: [
                      SB.SH20(),
                      CircleAvatar(
                        radius: Get.width * 0.12,
                        backgroundImage:
                            AssetImage('assets/images/alone_girl.png'),
                      ),
                      SB.SH10(),
                      Text(
                        'Hello Noberto',
                        style: FontTextStyle.kWhite20W600PR,
                      ),
                      SB.SH10(),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            drawerItem.length,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _menuController.setIndex(index);
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Obx(() => Text(
                                          '${drawerItem[index]}',
                                          style: _menuController
                                                      .menuIndex.value ==
                                                  index
                                              ? FontTextStyle.kWhite16W400SSP
                                              : FontTextStyle
                                                  .kPrimaryLight216W400SSP,
                                        )),
                                  ),
                                ),
                                Divider(
                                  color:
                                      ColorPicker.kGreyLight10.withOpacity(0.1),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: Obx(() {
                return _menuController.menuIndex.value == 0
                    ? Column(
                        children: [
                          Container(
                            height: 56,
                            color: ColorPicker.kPrimary,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: ColorPicker.kPrimary,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.01),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/rightShield.png',
                                              height: 18,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CommonWidget.text(
                                              'AHL',
                                              style:
                                                  FontTextStyle.kWhite20W600PR,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CommonWidget.text(
                                          'MY GRADE',
                                          style: FontTextStyle.kWhite10W600PR
                                              .copyWith(letterSpacing: 2.5),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Container(
                                    color: ColorPicker.kPrimary,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.01),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CommonWidget.text(
                                              '33% ',
                                              style: FontTextStyle
                                                  .kBlueLight20W600PR,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/icons/info.png',
                                              height: 18,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CommonWidget.text(
                                          'TO NEXT GRADE',
                                          style: FontTextStyle.kGreyDark10W600PR
                                              .copyWith(letterSpacing: 2.5),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Container(
                                    color: ColorPicker.kPrimary,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.01),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/shield.png',
                                              height: 18,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CommonWidget.text(
                                              'MHL',
                                              style: FontTextStyle
                                                  .kGreyDark10W600PR,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CommonWidget.text(
                                          'NEXT GRADE',
                                          style: FontTextStyle.kGreyDark10W600PR
                                              .copyWith(letterSpacing: 2.5),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 65,
                            width: Get.width,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 600,
                                  color: Colors.white,
                                  child: TabBar(
                                    controller: _tabController,
                                    labelPadding:
                                        const EdgeInsets.only(bottom: 15),
                                    tabs: List.generate(
                                      Data.tabItem.length,
                                      (index) => CommonWidget.text(
                                        Data.tabItem[index],
                                        style: Responsive.isTablet(context)
                                            ? FontTextStyle.kGreyDark14W600PR
                                            : FontTextStyle.kGreyDark10W600PR,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                SingleChildScrollView(child: mobileView()),
                                Center(child: Text('Travel')),
                                Center(child: Text('Developments')),
                                Center(child: Text('International')),
                                Center(child: Text('Investment')),
                              ],
                            ),
                          ),
                        ],
                      )
                    : _menuController.menuIndex.value == 1
                        ? ProfilePage()
                        : _menuController.menuIndex.value == 2
                            ? Column(
                                children: [
                                  Container(
                                    height: 65,
                                    width: Get.width,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 600,
                                          color: Colors.white,
                                          child: TabBar(
                                            controller: _tabController,
                                            labelPadding: const EdgeInsets.only(
                                                bottom: 15),
                                            tabs: List.generate(
                                              Data.tabItem.length,
                                              (index) => CommonWidget.text(
                                                Data.tabItem[index],
                                                style:
                                                    Responsive.isTablet(context)
                                                        ? FontTextStyle
                                                            .kGreyDark14W600PR
                                                        : FontTextStyle
                                                            .kGreyDark10W600PR,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        SingleChildScrollView(
                                            child: mobileView()),
                                        Center(child: Text('Travel')),
                                        Center(child: Text('Developments')),
                                        Center(child: Text('International')),
                                        Center(child: Text('Investment')),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : _menuController.menuIndex.value == 3
                                ? Center(child: Text('Jobs'))
                                : _menuController.menuIndex.value == 4
                                    ? Center(child: Text('Recruitment'))
                                    : Center(child: Text('Help'));
              }),
            ),
          );
  }

  Padding mobileView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ///FIRST ROW TWO CONTAINER MOBILE
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: Get.width * 0.5,
                width: Get.width * 0.9,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: ColorPicker.kGreyDark.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20)
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/share.png',
                          height: Get.width * 0.2,
                          width: Get.width * 0.25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidget.text(
                              'Hello Noberto',
                              style: FontTextStyle.kPrimary16W600PR
                                  .copyWith(fontSize: Get.width * 0.05),
                            ),
                            SizedBox(height: Get.width * 0.02),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: CommonWidget.text(
                                'What’s news today? Share an update, link or news article with your connections. Get out there!',
                                style: FontTextStyle.kGreyLight12W600PR
                                    .copyWith(fontSize: Get.width * 0.03),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: Get.width * 0.02),
                    Row(
                      children: [
                        Container(
                          height: Get.width * 0.12,
                          width: Get.width * 0.12,
                          margin: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/profile.png')),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Expanded(
                          child: Container(
                            height: Get.width * 0.12,
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: ColorPicker.kBorder, width: 1),
                                color: ColorPicker.kGreyLight2),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: FontTextStyle.kGreyLight16W600PR,
                                  contentPadding: EdgeInsets.only(
                                      top: Get.width * 0.01, left: 10),
                                  hintText: 'Share an update or link.....'),
                              style: FontTextStyle.kGreyLight318W600PR,
                            ),
                          ),
                        )
                      ],
                    ),
                    SB.SH10(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          height: Get.width * 0.05,
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04),
                          decoration: BoxDecoration(
                            color: ColorPicker.kBlueLight,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: CommonWidget.text(
                              'Post Update',
                              style: FontTextStyle.kWhite8W600PR.copyWith(
                                fontSize: Get.width * 0.02,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: Get.width * 0.5,
                width: Get.width * 0.9,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: ColorPicker.kGreyDark.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20)
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: ColorPicker.kPrimary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidget.text(
                              '25%',
                              style: FontTextStyle.kWhite22W600PR
                                  .copyWith(fontSize: Get.width * 0.05),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            LinearPercentIndicator(
                              lineHeight: 8.0,
                              percent: 0.9,
                              backgroundColor: Colors.black,
                              progressColor: ColorPicker.kRed,
                              barRadius: Radius.circular(20),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CommonWidget.text(
                              'Your Profile is only\n25% complete',
                              style: FontTextStyle.kWhite18W600PR,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.08),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonWidget.text(
                                  'Where did you work before your current job?',
                                  style: FontTextStyle.kBlueDark20W600PR
                                      .copyWith(fontSize: Get.width * 0.03),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                CommonWidget.text(
                                  'your work history shows your career path and experience in the industry.',
                                  style: FontTextStyle.kBlueDark20W600PR
                                      .copyWith(fontSize: Get.width * 0.03),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 25),
                                  height: 35,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.01),
                                  decoration: BoxDecoration(
                                    color: ColorPicker.kBlueLight,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: CommonWidget.text(
                                      'Add work experience',
                                      style: FontTextStyle.kWhite16W600PR,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: List.generate(
                                      4,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          backgroundColor: index == 0
                                              ? ColorPicker.kBlueLight
                                              : ColorPicker.kBlueLight
                                                  .withOpacity(0.3),
                                          radius: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_back_ios,
                                          size: 20,
                                          color: ColorPicker.kBlueLight
                                              .withOpacity(0.5)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorPicker.kBlueLight,
                                        size: 20,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Divider(
          color: ColorPicker.kBorder,
          thickness: 1,
        ),

        ///Headline
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: CommonWidget.text(
                    'Headline',
                    style: FontTextStyle.kBlueDark24W600PR,
                  ),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/public.png')),
                      boxShadow: [
                        BoxShadow(
                            color: ColorPicker.kGreyDark.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 20)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: "'We must stay at update': ",
                    style: FontTextStyle.kRed20W600PR,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Hong Kong expected to confirm 614 coronavirus cases',
                          style: FontTextStyle.kPrimaryLight20W600PR),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CommonWidget.text(
                    'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                    style: FontTextStyle.kGreyLight14W600PR,
                  ),
                ),
                Divider(
                  color: ColorPicker.kBorder,
                  thickness: 2,
                ),
                SizedBox(
                  height: 15,
                ),

                ///double container
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/public.png')),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorPicker.kGreyDark
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 20)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Winter Olympics/ ",
                              style: FontTextStyle.kRed20W600PR,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'snowboarder Su Yiming claims silver in slopestyle final',
                                    style: FontTextStyle.kPrimaryLight20W600PR),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonWidget.text(
                            'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                            style: FontTextStyle.kGreyLight14W600PR,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/public.png')),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorPicker.kGreyDark
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 20)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Winter Olympics/ ",
                              style: FontTextStyle.kRed20W600PR,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'snowboarder Su Yiming claims silver in slopestyle final',
                                    style: FontTextStyle.kPrimaryLight20W600PR),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonWidget.text(
                            'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                            style: FontTextStyle.kGreyLight14W600PR,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: ColorPicker.kBorder,
                  thickness: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: "Winter Olympics/ ",
                    style: FontTextStyle.kRed20W600PR.copyWith(height: 1.4),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'snowboarder Su Yiming claims silver in slopestyle final',
                          style: FontTextStyle.kPrimaryLight20W600PR
                              .copyWith(height: 1.4)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CommonWidget.text(
                  'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                  style: FontTextStyle.kGreyLight14W600PR,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),

        /// /// hamburg,DE
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: Get.width,
              margin: EdgeInsets.all(Get.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidget.text(
                    "Hamburg, DE",
                    style: FontTextStyle.kPrimaryLight32W600PR,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CommonWidget.text(
                    "3 February 2022 15:13",
                    style: FontTextStyle.kPrimaryLight16W600PR,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/cloud.png'),
                      CommonWidget.text(
                        '7° C',
                        style: FontTextStyle.kPrimaryLight40W600PR,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  CommonWidget.text(
                    "Bedecket",
                    style: FontTextStyle.kPrimaryLight22W600PR,
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Container(
                    height: Get.height * 0.067,
                    width: Get.width * 0.65,
                    decoration: BoxDecoration(
                      color: ColorPicker.kBlueLight,
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                    ),
                    child: Center(
                      child: CommonWidget.text(
                        'Wheather from OpenWeatherMap',
                        style: FontTextStyle.kWhite16W600PR,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Container(
                    height: Get.height * 0.7,
                    padding: EdgeInsets.symmetric(vertical: 34, horizontal: 25),
                    decoration: BoxDecoration(
                      color: ColorPicker.kPrimaryLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonWidget.text(
                          '25%',
                          style: FontTextStyle.kWhite83W600PR,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 10.0,
                          width: Get.width * 0.7,
                          alignment: MainAxisAlignment.center,
                          percent: 0.25,
                          backgroundColor: Colors.black,
                          progressColor: ColorPicker.kRed,
                          barRadius: Radius.circular(20),
                        ),
                        CommonWidget.text(
                          "Your Profile is only 25% complete. Improve it now. Here's how",
                          style: FontTextStyle.kWhite18W600PR,
                          textAlign: TextAlign.center,
                        ),
                        ListView.builder(
                          itemCount: Data.specification.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 18,
                                    width: 18,
                                    color: Color(0xff33A3FE),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: CommonWidget.text(
                                      "Add your work experience",
                                      style: TextStyle(
                                          color: Color(0xff33A3FE),
                                          fontSize: Get.height * 0.018),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black.withOpacity(0.2),
                                    height: 25,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width * 0.006),
                                    child: Center(
                                        child: CommonWidget.text(
                                      '+20%',
                                      style: TextStyle(
                                        color: Color(0xff33A3FE),
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.width * 0.005,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: Get.width * 0.002,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height * 0.06,
                          decoration: BoxDecoration(
                              color: Color(0xFF33A3FE),
                              borderRadius:
                                  BorderRadius.circular(Get.height * 0.01)),
                          child: Center(
                            child: CommonWidget.text(
                              "Edit my profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.height * 0.02),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: ColorPicker.kBorder,
              thickness: 2,
            ),
            SizedBox(
              height: 15,
            ),
          ]),
        ),

        /// Videos
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CommonWidget.text(
                'Video',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF101E4A),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: Get.width * 0.03),
              SizedBox(
                height: Get.width * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Image(
                        image: AssetImage('assets/images/couple_bg.png'),
                        // height: Get.height * 0.55,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: Get.width * 0.15,
                          width: Get.width,
                          color: Colors.black54,
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.only(left: Get.width * 0.03),
                              padding: EdgeInsets.all(Get.width * 0.025),
                              height: Get.width * 0.08,
                              width: Get.width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(1)),
                              // child: Icon(Icons.play_arrow_rounded,
                              //     color: Colors.white, size: 50),
                              child: SvgPicture.asset(
                                'assets/icons/play_arrow.svg',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: Get.width * 0.01),
                            CommonWidget.text(
                              'Couple fight boy’s brain cancer with\nnatural remedies',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.width * 0.03),
              Divider(color: ColorPicker.kBorder),
              Divider(color: ColorPicker.kBorder),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: ColorPicker.kBorder),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: ColorPicker.kBorder),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.width * 0.03),
            ]),
          ),
        ),

        ///Widget block type X
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.text(
                  'Widget block type X',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF101E4A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.width * 0.03),
                Container(
                    width: Get.width,
                    height: Get.width * 0.3,
                    alignment: Alignment.center,
                    // width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: CommonWidget.text(
                      'Widget Area',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                SizedBox(height: Get.width * 0.06),
              ],
            ),
          ),
        ),

        ///Jobs you might be interested in
        Container(
          color: ColorPicker.kBg1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CommonWidget.text(
                'Jobs you might be\ninterested in',
                style: FontTextStyle.kBlueDark24W600PR.copyWith(height: 1.2),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 339,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 281,
                    margin: EdgeInsets.only(right: Get.width * 0.01),
                    width: 251,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: ColorPicker.kBorder1),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 30,
                            width: 153,
                            margin: EdgeInsets.only(top: 16, right: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: ColorPicker.kGreen),
                            child: Center(
                                child: CommonWidget.text(
                              'Premium Listing',
                              style: FontTextStyle.kWhite116W600PR,
                            )),
                          ),
                        ),
                        index.isOdd
                            ? SizedBox(
                                height: 32,
                              )
                            : SizedBox(),
                        index.isOdd
                            ? Image.asset('assets/images/fairmont_logo.png')
                            : Image.asset('assets/images/hilton_logo.png'),
                        SizedBox(
                          height: 35,
                        ),
                        Divider(
                          color: ColorPicker.kBorder,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CommonWidget.text(
                              'Cluster Sales Manager - Leisure & MICE',
                              style: FontTextStyle.kBlueDark22W600PR),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CommonWidget.text('Hilton, Capetown',
                                style: FontTextStyle.kGreyDark16W600PR),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.width * 0.06),
            ],
          ),
        ),

        ///Category Type B
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.width * 0.05),
                CommonWidget.text(
                  'Category Type B',
                  style: FontTextStyle.kBlueDark24W600PR,
                ),
                SizedBox(height: Get.width * 0.05),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/public.png')),
                      boxShadow: [
                        BoxShadow(
                            color: ColorPicker.kGreyDark.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 20)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: "'We must stay at update': ",
                    style: FontTextStyle.kRed20W600PR,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Hong Kong expected to confirm 614 coronavirus cases',
                          style: FontTextStyle.kPrimaryLight20W600PR),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CommonWidget.text(
                  'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                  style: FontTextStyle.kGreyLight14W600PR,
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: ColorPicker.kBorder,
                  thickness: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Winter Olympics/ ',
                      style: TextStyle(
                        color: Color(0xFFEF3534),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text:
                          'snowboarder Su Yiming claims silver in slopestyle final ',
                      style: TextStyle(
                        color: Color(0xFF101E4A),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )
                  ]),
                ),
                SB.SH20(),
                CommonWidget.text(
                  'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                  style: TextStyle(
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                SB.SH20(),
                Divider(
                  color: ColorPicker.kBorder,
                  thickness: 2,
                ),
                SizedBox(
                  height: 15,
                ),

                ///double container
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/public.png')),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorPicker.kGreyDark
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 20)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "'We must stay at update': ",
                              style: FontTextStyle.kRed20W600PR,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Hong Kong expected to confirm 614 coronavirus cases',
                                    style: FontTextStyle.kPrimaryLight20W600PR),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonWidget.text(
                            'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                            style: FontTextStyle.kGreyLight14W600PR,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/public.png')),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorPicker.kGreyDark
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 20)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "'We must stay at update': ",
                              style: FontTextStyle.kRed20W600PR,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Hong Kong expected to confirm 614 coronavirus cases',
                                    style: FontTextStyle.kPrimaryLight20W600PR),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonWidget.text(
                            'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                            style: FontTextStyle.kGreyLight14W600PR,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                ///Hamburg, DE
                openWeatherMapMob(),

                SizedBox(
                  height: Get.height * 0.015,
                ),
              ],
            ),
          ),
        ),

        ///Category Type A
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                CommonWidget.text(
                  'Category Type A',
                  style: FontTextStyle.kBlueDark24W600PR.copyWith(height: 1.2),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/alone_girl.png')),
                      boxShadow: [
                        BoxShadow(
                            color: ColorPicker.kGreyDark.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 20)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "‘I’ve had letters from klansmen’: ",
                      style: FontTextStyle.kRed20W600PR,
                    ),
                    TextSpan(
                      text: 'Jennifer Beals on Flashdance',
                      style: FontTextStyle.kBlueDark20W600PR,
                    )
                  ]),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: Get.width * 0.2,
                    backgroundImage: AssetImage('assets/images/profile2.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CommonWidget.text(
                    'How buddhism has changed\nthe west for better',
                    textAlign: TextAlign.center,
                    style: FontTextStyle.kBlueDark20W600PR,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CommonWidget.text(
                    'Rebecca Sonlit',
                    textAlign: TextAlign.center,
                    style: FontTextStyle.kRed20W600PR,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: ColorPicker.kBorder,
                  thickness: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/public.png')),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorPicker.kGreyDark
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 20)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "'We must stay at update': ",
                              style: FontTextStyle.kRed20W600PR,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Hong Kong expected to confirm 614 coronavirus cases',
                                    style: FontTextStyle.kPrimaryLight20W600PR),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonWidget.text(
                            'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                            style: FontTextStyle.kGreyLight14W600PR,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/public.png')),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorPicker.kGreyDark
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 20)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "'We must stay at update': ",
                              style: FontTextStyle.kRed20W600PR,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Hong Kong expected to confirm 614 coronavirus cases',
                                    style: FontTextStyle.kPrimaryLight20W600PR),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonWidget.text(
                            'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                            style: FontTextStyle.kGreyLight14W600PR,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: ColorPicker.kBorder,
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Winter Olympics/ ',
                      style: TextStyle(
                        color: Color(0xFFEF3534),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text:
                          'snowboarder Su Yiming claims silver in slopestyle final ',
                      style: TextStyle(
                        color: Color(0xFF101E4A),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )
                  ]),
                ),
                SB.SH20(),
                CommonWidget.text(
                  'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                  style: TextStyle(
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                SB.SH20(),
                Container(
                    margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
                    alignment: Alignment.center,
                    height: 268,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: CommonWidget.text(
                      'Widget Area',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                SizedBox(height: 40)
              ])),
        ),

        ///People in your area or industry
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidget.text(
                'People in your area or industry',
                style: FontTextStyle.kBlueDark24W600PR.copyWith(height: 1.2),
              ),
              SB.SH20(),
              Container(
                height: 325,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 325,
                    margin: EdgeInsets.only(right: Get.width * 0.02),
                    width: 187,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0XFFCACACA)),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(5)),
                            child: Image(
                              height: 150,
                              width: Get.width,
                              fit: BoxFit.fill,
                              image: index.isEven
                                  ? AssetImage('assets/images/nasa.png')
                                  : AssetImage('assets/images/winter.png'),
                            ),
                          ),
                        ),
                        Container(
                          height: 170,
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              index.isEven
                                  ? CommonWidget.text(
                                      'Nasa concerned',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
                                        color: Color(0xFF101E4A),
                                      ),
                                    )
                                  : CommonWidget.text(
                                      'Winter Olympics',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
                                        color: Color(0xFF101E4A),
                                      ),
                                    ),
                              index.isEven
                                  ? CommonWidget.text(
                                      'Nasa has expressed concern about SpaceX’s proposed second-generation',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        wordSpacing: 2,
                                        color: Color(0xFFA1A1A1),
                                      ))
                                  : CommonWidget.text(
                                      'Fans of Chinese teen snowboard sensation Su Yiming expressed feelings',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        wordSpacing: 2,
                                        color: Color(0xFFA1A1A1),
                                      ),
                                    ),
                              SB.SH20(),
                              Container(
                                height: 31,
                                width: Get.width * 0.25,
                                decoration: BoxDecoration(
                                    color: ColorPicker.kBlueLight),
                                child: Center(
                                  child: CommonWidget.text('Connect',
                                      style: FontTextStyle.kWhite14W600PR),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SB.SH20(),
            ],
          ),
        ),

        /// Widget block type D
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CommonWidget.text(
                'Widget block type D',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF101E4A),
                ),
              ),
              SB.SH20(),
              Container(
                  height: 270,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/news.png')),
                  )),
              SB.SH20(),
              Container(
                  height: 560,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/twitter.png')),
                  )),
              SB.SH20(),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: ColorPicker.kBorder),
              SB.SH10(),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: ColorPicker.kBorder),
              SB.SH10(),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SB.SH20(),
              openWeatherMapMob(),
              SB.SH20(),
            ]),
          ),
        ),

        ///Latest Topics
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CommonWidget.text(
              'Latest Topics',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Color(0xFF101E4A),
              ),
            ),
            SB.SH20(),
            Container(
              height: 299,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 299,
                  margin: EdgeInsets.only(right: Get.width * 0.02),
                  width: 187,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0XFFCACACA)),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(5)),
                          child: Image(
                            height: 150,
                            width: Get.width,
                            fit: BoxFit.fill,
                            image: index.isEven
                                ? AssetImage('assets/images/nasa.png')
                                : AssetImage('assets/images/winter.png'),
                          ),
                        ),
                      ),
                      Container(
                        height: 140,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            index.isEven
                                ? CommonWidget.text(
                                    'Nasa concerned',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19,
                                      color: Color(0xFF101E4A),
                                    ),
                                  )
                                : CommonWidget.text(
                                    'Winter Olympics',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19,
                                      color: Color(0xFF101E4A),
                                    ),
                                  ),
                            index.isEven
                                ? CommonWidget.text(
                                    'Nasa has expressed concern about SpaceX’s proposed second-generation',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      wordSpacing: 2,
                                      color: Color(0xFFA1A1A1),
                                    ))
                                : CommonWidget.text(
                                    'Fans of Chinese teen snowboard sensation Su Yiming expressed feelings',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      wordSpacing: 2,
                                      color: Color(0xFFA1A1A1),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 1),
                alignment: Alignment.center,
                height: 15,
                width: Get.width,
                // color: Colors.red,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CircleAvatar(
                      // foregroundColor: Colors.red,
                      backgroundColor: index == 0
                          ? Color(0xFF33A3FE)
                          : Color(0xFF33A3FE).withOpacity(0.19),
                    );
                  },
                )),
            SB.SH30(),
          ]),
        ),

        ///Widget block type E
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CommonWidget.text(
                'Widget block type E',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF101E4A),
                ),
              ),
              SB.SH20(),
              Container(
                height: 225,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/E1.png'),
                        ),
                      ),
                    ),
                    SB.SW10(),
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/E2.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SB.SH20(),
              Divider(
                  color: Color(0xFFDADADA),
                  indent: 10,
                  endIndent: 10,
                  thickness: 1),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color(0xFFDADADA), thickness: 1),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color(0xFFDADADA), thickness: 1),
              Container(
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SB.SH20(),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Winter Olympics/ ',
                            style: TextStyle(
                              color: Color(0xFFEF3534),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                'snowboarder Su Yiming claims silver in slopestyle final ',
                            style: TextStyle(
                              color: Color(0xFF101E4A),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ]),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SB.SH20(),
              Container(
                  width: Get.width,
                  height: Get.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: CommonWidget.text(
                      'Widget Area',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )),
              SB.SH30(),
            ]),
          ),
        ),

        ///Category
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewsSingleScreen.route);
          },
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                CommonWidget.text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xFF101E4A),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image(
                    width: Get.width,
                    height: Get.width * 0.8,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/E1.png'),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SB.SH20(),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: [
                            TextSpan(
                              text: '‘We must stay at update’: ',
                              style: TextStyle(
                                color: Color(0xFFEF3534),
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Hong Kong expected to confirm 614 coronavirus cases',
                              style: TextStyle(
                                color: Color(0xFF101E4A),
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ]),
                        ),
                        SB.SH20(),
                        CommonWidget.text(
                          'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                          style: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontWeight: FontWeight.w600,
                            wordSpacing: 2,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image(
                    width: Get.width,
                    height: Get.width * 0.8,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/E2.png'),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SB.SH20(),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: [
                            TextSpan(
                              text: '‘We must stay at update’: ',
                              style: TextStyle(
                                color: Color(0xFFEF3534),
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Hong Kong expected to confirm 614 coronavirus cases',
                              style: TextStyle(
                                color: Color(0xFF101E4A),
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ]),
                        ),
                        SB.SH20(),
                        CommonWidget.text(
                          'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                          style: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontWeight: FontWeight.w600,
                            wordSpacing: 2,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(color: Color(0xFFDADADA), thickness: 1),
                Container(
                  // color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SB.SH20(),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Winter Olympics/ ',
                              style: TextStyle(
                                color: Color(0xFFEF3534),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'snowboarder Su Yiming claims silver in slopestyle final ',
                              style: TextStyle(
                                color: Color(0xFF101E4A),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            )
                          ]),
                        ),
                        SB.SH20(),
                        CommonWidget.text(
                          'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                          style: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(color: Color(0xFFDADADA), thickness: 1),
                Container(
                  // color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SB.SH20(),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Winter Olympics/ ',
                              style: TextStyle(
                                color: Color(0xFFEF3534),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'snowboarder Su Yiming claims silver in slopestyle final ',
                              style: TextStyle(
                                color: Color(0xFF101E4A),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            )
                          ]),
                        ),
                        SB.SH20(),
                        CommonWidget.text(
                          'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                          style: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(color: Color(0xFFDADADA), thickness: 1),
                Container(
                  // color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SB.SH20(),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Winter Olympics/ ',
                              style: TextStyle(
                                color: Color(0xFFEF3534),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'snowboarder Su Yiming claims silver in slopestyle final ',
                              style: TextStyle(
                                color: Color(0xFF101E4A),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            )
                          ]),
                        ),
                        SB.SH20(),
                        CommonWidget.text(
                          'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                          style: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ])),
        ),
      ]),
    );
  }

  Container openWeatherMapMob() {
    return Container(
      height: 325,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: ColorPicker.kPrimaryLight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CommonWidget.text(
            "Hamburg, DE",
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          CommonWidget.text(
            "3 February 2022 15:13",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/cloud.png', height: 30),
              CommonWidget.text(
                '7° C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          CommonWidget.text(
            "Bedecket",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          Container(
            height: Get.height * 0.067,
            width: Get.width * 0.75,
            decoration: BoxDecoration(
              color: Color(0xFF33A3FE),
              borderRadius: BorderRadius.circular(
                4,
              ),
            ),
            child: Center(
              child: CommonWidget.text(
                'Wheather from OpenWeatherMap',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container webView() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ///FIRST ROW TWO CONTAINER
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 413,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: ColorPicker.kBorder, blurRadius: 5),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/share.png',
                            height: 189,
                            width: Get.width * 0.14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonWidget.text(
                                'Hello Noberto',
                                style: FontTextStyle.kPrimary32W600PR,
                              ),
                              SB.SH25(),
                              SizedBox(
                                width: Get.width * 0.21,
                                child: CommonWidget.text(
                                  'What’s news today? Share an update, link or news article with your connections. Get out there!',
                                  style: FontTextStyle.kGreyLight18W600PR,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SB.SH25(),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/profile.png')),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Expanded(
                            child: Container(
                              height: 70,
                              margin: EdgeInsets.only(right: 45),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: ColorPicker.kBorder, width: 1),
                                  color: ColorPicker.kGreyLight2),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        FontTextStyle.kGreyLight318W600PR,
                                    contentPadding:
                                        EdgeInsets.only(top: 18, left: 10),
                                    hintText: 'Share an update or link.....'),
                                style: FontTextStyle.kGreyLight318W600PR,
                              ),
                            ),
                          )
                        ],
                      ),
                      SB.SH25(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 45),
                            height: 47,
                            width: Get.width * 0.08,
                            decoration: BoxDecoration(
                              color: ColorPicker.kBlueLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: CommonWidget.text('Post Update',
                                  style: FontTextStyle.kWhite16W600PR),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 57,
              ),
              Expanded(
                child: Container(
                  height: 413,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: ColorPicker.kBorder, blurRadius: 5),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: ColorPicker.kPrimary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonWidget.text(
                                '25%',
                                style: FontTextStyle.kWhite83W600PR
                                    .copyWith(fontSize: Get.width * 0.05),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LinearPercentIndicator(
                                lineHeight: 8.0,
                                percent: 0.9,
                                backgroundColor: Colors.black,
                                progressColor: ColorPicker.kRed,
                                barRadius: Radius.circular(20),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              CommonWidget.text(
                                'Your Profile is only\n25% complete',
                                style: FontTextStyle.kWhite18W600PR,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.21,
                                    child: CommonWidget.text(
                                      'Where did you work before your current job?',
                                      style: FontTextStyle.kBlueDark20W600PR,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.21,
                                    child: CommonWidget.text(
                                      'your work history shows your career path and experience in the industry.',
                                      style: FontTextStyle.kBlueDark20W600PR,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 45),
                                    height: 47,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width * 0.01),
                                    decoration: BoxDecoration(
                                      color: ColorPicker.kBlueLight,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: CommonWidget.text(
                                        'Add work experience',
                                        style: FontTextStyle.kWhite16W600PR,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: Get.width * 0.25,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: List.generate(
                                        4,
                                        (index) => Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: CircleAvatar(
                                            backgroundColor: index == 0
                                                ? ColorPicker.kBlueLight
                                                : ColorPicker.kBlueLight
                                                    .withOpacity(0.3),
                                            radius: 8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.arrow_back_ios,
                                            size: 35,
                                            color: ColorPicker.kBlueLight
                                                .withOpacity(0.5)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: ColorPicker.kBlueLight,
                                          size: 35,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SB.SH50(),

        ///Headline
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().headlineBlock()),
        SB.SH50(),

        ///WHITE BIG
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().videoBlock()),
        SB.SH50(),
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().blockTitle('Jobs you might be interested in')),
        SB.SH30(),

        ///Jobs you might be interested in
        HomeWidget().jobsBlock(),
        SB.SH50(),
        HomeWidget().widgetIndicator(),
        SizedBox(
          height: 30,
        ),

        ///Category Type B
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().categoryB()),
        SB.SH50(),

        ///Category Type A
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().categoryA()),
        SB.SH50(),

        ///People in your area or industry
        HomeWidget().blockTitle('People in your area or industry'),
        SB.SH30(),
        HomeWidget().peopleBlock(),
        SizedBox(
          height: 50,
        ),
        HomeWidget().widgetIndicator(),
        SizedBox(
          height: 50,
        ),

        ///Category Type C
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().categoryC()),

        ///Latest News
        SB.SH50(),
        HomeWidget().blockTitle('Latest News'),
        SB.SH50(),
        HomeWidget().latestNewsBlock(),
        SB.SH50(),
        HomeWidget().widgetIndicator(),
        SB.SH50(),

        ///Category Type D
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().categoryD()),
        SB.SH50(),

        ///Latest Topic
        HomeWidget().blockTitle('Latest Topic'),
        SB.SH50(),
        HomeWidget().latestNewsBlock(),
        SB.SH50(),
        HomeWidget().widgetIndicator(),
        SB.SH50(),

        ///Category Type E
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().categoryE()),
        SB.SH50(),

        ///Category
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NewsSingleScreen.route);
            },
            child: HomeWidget().category()),
        SB.SH50(),
      ]),
    );
  }
}
