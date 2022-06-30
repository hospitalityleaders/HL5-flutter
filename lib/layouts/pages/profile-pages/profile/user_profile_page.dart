import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/custom_loading.dart';
import 'package:holedo/presentation/ui/pages/sections/activity_section/activity_section.dart';
import 'package:holedo/presentation/ui/pages/sections/articles_section/articles_section.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_section.dart';
import 'package:holedo/presentation/ui/pages/sections/reference_section/reference_section.dart';
import 'package:holedo/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import '../profile-edit/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/components/profile_tabbar.dart';
import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/presentation/ui/pages/profile_mobile_view/profile_mobile_view_page.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class GlobalKeys {
  static final refKey = GlobalKey();
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

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

  ///Common widgets
  Widget buildEditButton() {
    return EditButton(
      onChanged: (value) {
        setState(() {
          isEditable = !(value as bool);
        });
      },
      isEditable: isEditable,
      //header card edit functionality

      callBackHeader: callBackHeader,
      headerCardKey: headerCardKey,

      //section1 edit functionality
      callBackButtonSec1: callBackButtonSec1,
      profileOverviewSec1ProSummKey: profileOverviewSec1ProSummKey,
      profileOverviewSec1AreaOfExpKey: profileOverviewSec1AreaOfExpKey,
      profileOverviewSec1ReferencesKey: profileOverviewSec1ReferencesKey,
      //section2 edit functionality
      callBackButtonSec2: callBackButtonSec2,
      profileOverviewSec2WorkExpKey: profileOverviewSec2WorkExpKey,
      profileOverviewSec2EducationKey: profileOverviewSec2EducationKey,
      profileOverviewSec2AchievementKey: profileOverviewSec2AchievementKey,
      profileOverviewSec2LanguagesKey: profileOverviewSec2LanguagesKey,

      // References card edit functionality

      callBackReference: callBackReference,
      referenceCardKey: referenceCardKey,
    );
  }

  ///header card edit functionality
  final headerCardKey = GlobalKey();
  var headerCard_H;
  var headerCard_W;

  callBackHeader(headerCardKey) {
    setState(() {
      headerCard_H = headerCardKey.height;
      headerCard_W = headerCardKey.width;
    });
  }

  /// References card edit functionality
  final List<GlobalObjectKey<FormState>> referenceCardKey =
      List.generate(10, (index) => GlobalObjectKey<FormState>(index));

  // final referenceCardKey = List<GlobalKey>.generate(10, (index) => GlobalKeys.refKey);
  // final referenceCardKey = GlobalKey();
  var referenceCard_H;
  var referenceCard_W;

  callBackReference(referenceCardKey) {
    setState(() {
      referenceCard_H = referenceCardKey.height;
      referenceCard_W = referenceCardKey.width;
    });
  }

  //section1 edit functionality
  final profileOverviewSec1ProSummKey = GlobalKey();
  var profileOverviewSec1ProSumm_H;
  var profileOverviewSec1ProSumm_W;

  final profileOverviewSec1AreaOfExpKey = GlobalKey();
  var profileOverviewSec1AreaOfExp_H;
  var profileOverviewSec1AreaOfExp_W;

  final profileOverviewSec1ReferencesKey = GlobalKey();
  var profileOverviewSec1References_H;
  var profileOverviewSec1References_W;

  callBackButtonSec1(profileOverviewSec1Key, profileOverviewSec1AreaOfExpKey,
      profileOverviewSec1ReferencesKey) {
    setState(() {
      profileOverviewSec1ProSumm_H = profileOverviewSec1Key.height;
      profileOverviewSec1ProSumm_W = profileOverviewSec1Key.width;

      profileOverviewSec1AreaOfExp_H = profileOverviewSec1AreaOfExpKey.height;
      profileOverviewSec1AreaOfExp_W = profileOverviewSec1AreaOfExpKey.width;

      profileOverviewSec1References_H = profileOverviewSec1ReferencesKey.height;
      profileOverviewSec1References_W = profileOverviewSec1ReferencesKey.width;
    });
  }

  //section2 edit functionality

  final profileOverviewSec2WorkExpKey = GlobalKey();
  var profileOverviewSec2WorkExp_H;
  var profileOverviewSec2WorkExp_W;
  final profileOverviewSec2EducationKey = GlobalKey();
  var profileOverviewSec2Education_H;
  var profileOverviewSec2Education_W;
  final profileOverviewSec2AchievementKey = GlobalKey();
  var profileOverviewSec2Achievement_H;
  var profileOverviewSec2Achievement_W;
  final profileOverviewSec2LanguagesKey = GlobalKey();
  var profileOverviewSec2Languages_H;
  var profileOverviewSec2Languages_W;

  callBackButtonSec2(
      profileOverviewSec2WorkExpKey,
      profileOverviewSec2EducationKey,
      profileOverviewSec2AchievementKey,
      profileOverviewSec2LanguagesKey) {
    setState(() {
      profileOverviewSec2WorkExp_H = profileOverviewSec2WorkExpKey.height;
      profileOverviewSec2WorkExp_W = profileOverviewSec2WorkExpKey.width;

      profileOverviewSec2Education_H = profileOverviewSec2EducationKey.height;
      profileOverviewSec2Education_W = profileOverviewSec2EducationKey.width;

      profileOverviewSec2Achievement_H =
          profileOverviewSec2AchievementKey.height;
      profileOverviewSec2Achievement_W =
          profileOverviewSec2AchievementKey.width;

      profileOverviewSec2Languages_H = profileOverviewSec2LanguagesKey.height;
      profileOverviewSec2Languages_W = profileOverviewSec2LanguagesKey.width;
    });
  }

  ///Mobile Functionality
  final List<Item> _data = generateItems(1);

  Widget buildMobileMenuDropDownButton(String btnName) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 44,
        child: Text(
          btnName,
          style: FontTextStyle.kBlueLight114W400SSP,
        ),
      ),
    );
  }

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
    // _tabController.addListener(() {});
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
    final bool isMine = appState.isLoginnedAndEditable(widget.userProfileData);
    print('app ${isEditable}');
    return Stack(
      children: [
        // if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
        if (isTableOrMobile(context))
          ProfileMobileViewPage(
            currentTabIndex: currentTabIndex,
            changeCurrentIndex: changeCurrentIndex,
            userProfileData: widget.userProfileData,
            tabController: _tabController,
            onTabBarTap: onTabBarTap,
          )
        // else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET))
        //   Container(
        //     color: Cr.green1,
        //     child: Text(
        //       "Tablet View",
        //       style: h2Bold,
        //     ),
        //   )
        else
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                if (showNotifications)
                  AppbarNotification(
                    onClosePressed: () {
                      setState(
                        () {
                          showNotifications = false;
                        },
                      );
                    },
                  ),
                ProfileImageBanner(
                  userProfileData: widget.userProfileData,
                  onEditButtonPressed: () {},
                ),
                ProfileTabbar(
                  onTap: onTabBarTap,
                  isMine: isMine,
                  tabController: _tabController,
                ),
                Di.SBHEL,
                Center(
                  child: [
                    PageOverviewSection(
                      isEditable: isEditable,
                      userProfileData: widget.userProfileData,
                      editProfileBtn: buildEditButton,
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

        Provider.of<ProfileProvider>(context).showProfileLoading
            ? CustomLoading()
            : Di.ESB,
      ],
    );
    // Responsive.isDesktop(context)
    //     ? Container(
    //         decoration: BoxDecoration(color: ColorPicker.kBG),
    //         child: SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               HeaderCard(
    //                 isEditable: isEditable,
    //                 headerCardKey: headerCardKey,
    //                 headerCard_H: headerCard_H,
    //                 headerCard_W: headerCard_W,
    //                 hCardApiData: widget.userProfileData,
    //               ),
    //               Container(
    //                 height: SS.sH(context) * 0.065,
    //                 width: SS.sW(context),
    //                 decoration: BoxDecoration(
    //                   color: ColorPicker.kWhite,
    //                   border: Border(
    //                     bottom: BorderSide(color: Color(0xFFBDC4C7), width: 2),
    //                   ),
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.symmetric(
    //                       horizontal: SS.sW(context) * .080),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           Container(
    //                             height: 26,
    //                             width: 26,
    //                             decoration: BoxDecoration(
    //                               image: DecorationImage(
    //                                 image: NetworkImage(
    //                                   widget.userProfileData.avatar.toString(),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: EdgeInsets.symmetric(horizontal: 8.0),
    //                             child: Text(
    //                                 widget.userProfileData.fullName.toString(),
    //                                 style: FontTextStyle.kBlueDark116W700SSP),
    //                           ),
    //                           Text(
    //                               widget.userProfileData.userTitleTypesId
    //                                   .toString(),
    //                               style: FontTextStyle.kBlueDark112W700SSP),
    //                         ],
    //                       ),
    //                       Row(
    //                         children: [
    //                           TabBar(
    //                             labelColor: ColorPicker.kBlueLight1,
    //                             unselectedLabelColor: ColorPicker.kGreyLight7,
    //                             indicatorColor: ColorPicker.kBlueLight1,
    //                             indicatorPadding:
    //                                 EdgeInsets.symmetric(horizontal: 10),
    //                             controller: _tabController,
    //                             physics: NeverScrollableScrollPhysics(),
    //                             isScrollable: true,
    //                             automaticIndicatorColorAdjustment: true,
    //                             tabs: [
    //                               Padding(
    //                                 padding: EdgeInsets.all(10.0),
    //                                 child: Text(
    //                                   'Profile overview',
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.w600,
    //                                       fontFamily: 'SourceSansPro',
    //                                       fontSize: 14),
    //                                 ),
    //                               ),
    //                               Padding(
    //                                   padding: EdgeInsets.all(10.0),
    //                                   child: Text(
    //                                     'Timeline',
    //                                     style: TextStyle(
    //                                       fontWeight: FontWeight.w600,
    //                                       fontFamily: 'SourceSansPro',
    //                                       fontSize: 14,
    //                                     ),
    //                                   )),
    //                               Padding(
    //                                 padding: EdgeInsets.all(10.0),
    //                                 child: Text(
    //                                   'Articles',
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.w600,
    //                                       fontFamily: 'SourceSansPro',
    //                                       fontSize: 14),
    //                                 ),
    //                               ),
    //                               Padding(
    //                                 padding: EdgeInsets.all(10.0),
    //                                 child: Text(
    //                                   'Activity',
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.w600,
    //                                       fontFamily: 'SourceSansPro',
    //                                       fontSize: 14),
    //                                 ),
    //                               ),
    //                               Padding(
    //                                 padding: EdgeInsets.all(10.0),
    //                                 child: Text(
    //                                   'References',
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.w600,
    //                                       fontFamily: 'SourceSansPro',
    //                                       fontSize: 14),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                       (isMine) ? buildEditButton() : Container(),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: SS.sH(context) * 1.9,
    //                 child: TabBarView(
    //                     controller: _tabController,
    //                     children: <Widget>[
    //                       ProfileOverview(
    //                           isEditable: isEditable,

    //                           //section1 edit functionality
    //                           profileOverviewSec1ProSummKey:
    //                               profileOverviewSec1ProSummKey,
    //                           profileOverviewSec1ProSumm_H:
    //                               profileOverviewSec1ProSumm_H,
    //                           profileOverviewSec1ProSumm_W:
    //                               profileOverviewSec1ProSumm_W,
    //                           profileOverviewSec1AreaOfExpKey:
    //                               profileOverviewSec1AreaOfExpKey,
    //                           profileOverviewSec1AreaOfExp_H:
    //                               profileOverviewSec1AreaOfExp_H,
    //                           profileOverviewSec1AreaOfExp_W:
    //                               profileOverviewSec1AreaOfExp_W,
    //                           profileOverviewSec1ReferencesKey:
    //                               profileOverviewSec1ReferencesKey,
    //                           profileOverviewSec1References_H:
    //                               profileOverviewSec1References_H,
    //                           profileOverviewSec1References_W:
    //                               profileOverviewSec1References_W,

    //                           //section2 edit functionality

    //                           profileOverviewSec2WorkExpKey:
    //                               profileOverviewSec2WorkExpKey,
    //                           profileOverviewSec2WorkExp_H:
    //                               profileOverviewSec2WorkExp_H,
    //                           profileOverviewSec2WorkExp_W:
    //                               profileOverviewSec2WorkExp_W,
    //                           profileOverviewSec2EducationKey:
    //                               profileOverviewSec2EducationKey,
    //                           profileOverviewSec2Education_H:
    //                               profileOverviewSec2Education_H,
    //                           profileOverviewSec2Education_W:
    //                               profileOverviewSec2Education_W,
    //                           profileOverviewSec2AchievementKey:
    //                               profileOverviewSec2AchievementKey,
    //                           profileOverviewSec2Achievement_H:
    //                               profileOverviewSec2Achievement_H,
    //                           profileOverviewSec2Achievement_W:
    //                               profileOverviewSec2Achievement_W,
    //                           profileOverviewSec2LanguagesKey:
    //                               profileOverviewSec2LanguagesKey,
    //                           profileOverviewSec2Languages_H:
    //                               profileOverviewSec2Languages_H,
    //                           profileOverviewSec2Languages_W:
    //                               profileOverviewSec2Languages_W,
    //                           pOApiData: widget.userProfileData,
    //                           editProfileBtn: buildEditButton),
    //                       TimeLine(),
    //                       TimeLine(),
    //                       TimeLine(),
    //                       References(
    //                         isEditable: isEditable,
    //                         referenceCard_H: referenceCard_H,
    //                         referenceCard_W: referenceCard_W,
    //                         referenceCardKey: referenceCardKey,
    //                       )
    //                     ]),
    //               )
    //             ],
    //           ),
    //         ),
    //       )
    //     : SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             HeaderCard(
    //                 isEditable: isEditable,
    //                 headerCardKey: headerCardKey,
    //                 headerCard_H: headerCard_H,
    //                 headerCard_W: headerCard_W,
    //                 hCardApiData: widget.userProfileData),
    //             Padding(
    //               padding: EdgeInsets.all(8.0),
    //               child: ExpansionPanelList(
    //                 expansionCallback: (int index, bool isExpanded) {
    //                   setState(() {
    //                     _data[index].isExpanded = !isExpanded;
    //                   });
    //                 },
    //                 children: _data.map<ExpansionPanel>((Item item) {
    //                   return ExpansionPanel(
    //                     headerBuilder: (BuildContext context, bool isExpanded) {
    //                       return Column(
    //                         children: [
    //                           ListTile(
    //                             leading: Container(
    //                               height: 26,
    //                               width: 26,
    //                               decoration: BoxDecoration(
    //                                 image: DecorationImage(
    //                                   image: NetworkImage(
    //                                     widget.userProfileData.avatar
    //                                         .toString(),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             title: Row(
    //                               children: [
    //                                 Text(
    //                                   widget.userProfileData.fullName
    //                                       .toString(),
    //                                   textAlign: TextAlign.center,
    //                                   style: FontTextStyle.kBlueDark116W700SSP,
    //                                 ),
    //                                 SS.sB(0, 2),
    //                                 Text(
    //                                   widget.userProfileData.userTitleTypesId
    //                                       .toString(),
    //                                   textAlign: TextAlign.center,
    //                                   style: FontTextStyle.kBlueDark112W700SSP,
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           isExpanded
    //                               ? Container()
    //                               : isMine
    //                                   ? buildEditButton()
    //                                   : Container()
    //                         ],
    //                       );
    //                     },
    //                     body: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Padding(
    //                           padding: EdgeInsets.all(8.0),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               buildMobileMenuDropDownButton(
    //                                   'Profile Overview'),
    //                               buildMobileMenuDropDownButton('Timeline'),
    //                               buildMobileMenuDropDownButton('Articles'),
    //                               buildMobileMenuDropDownButton('Activity'),
    //                               buildMobileMenuDropDownButton('References'),
    //                               isMine ? buildEditButton() : Container()
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     isExpanded: item.isExpanded,
    //                   );
    //                 }).toList(),
    //               ),
    //             ),
    //             ProfileOverview(
    //                 isEditable: isEditable,

    //                 //section1 edit functionality
    //                 profileOverviewSec1ProSummKey:
    //                     profileOverviewSec1ProSummKey,
    //                 profileOverviewSec1ProSumm_H: profileOverviewSec1ProSumm_H,
    //                 profileOverviewSec1ProSumm_W: profileOverviewSec1ProSumm_W,
    //                 profileOverviewSec1AreaOfExpKey:
    //                     profileOverviewSec1AreaOfExpKey,
    //                 profileOverviewSec1AreaOfExp_H:
    //                     profileOverviewSec1AreaOfExp_H,
    //                 profileOverviewSec1AreaOfExp_W:
    //                     profileOverviewSec1AreaOfExp_W,
    //                 profileOverviewSec1ReferencesKey:
    //                     profileOverviewSec1ReferencesKey,
    //                 profileOverviewSec1References_H:
    //                     profileOverviewSec1References_H,
    //                 profileOverviewSec1References_W:
    //                     profileOverviewSec1References_W,

    //                 //section2 edit functionality

    //                 profileOverviewSec2WorkExpKey:
    //                     profileOverviewSec2WorkExpKey,
    //                 profileOverviewSec2WorkExp_H: profileOverviewSec2WorkExp_H,
    //                 profileOverviewSec2WorkExp_W: profileOverviewSec2WorkExp_W,
    //                 profileOverviewSec2EducationKey:
    //                     profileOverviewSec2EducationKey,
    //                 profileOverviewSec2Education_H:
    //                     profileOverviewSec2Education_H,
    //                 profileOverviewSec2Education_W:
    //                     profileOverviewSec2Education_W,
    //                 profileOverviewSec2AchievementKey:
    //                     profileOverviewSec2AchievementKey,
    //                 profileOverviewSec2Achievement_H:
    //                     profileOverviewSec2Achievement_H,
    //                 profileOverviewSec2Achievement_W:
    //                     profileOverviewSec2Achievement_W,
    //                 profileOverviewSec2LanguagesKey:
    //                     profileOverviewSec2LanguagesKey,
    //                 profileOverviewSec2Languages_H:
    //                     profileOverviewSec2Languages_H,
    //                 profileOverviewSec2Languages_W:
    //                     profileOverviewSec2Languages_W,
    //                 pOApiData: widget.userProfileData,
    //                 editProfileBtn: buildEditButton),
    //           ],
    //         ),
    //       );
  }
}

class AppbarNotification extends StatelessWidget {
  const AppbarNotification({
    Key? key,
    this.onClosePressed,
  }) : super(key: key);

  final void Function()? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Di.getScreenSize(context).width,
      color: Cr.red3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Di.ESB,
          Row(
            children: [
              Text(
                "Your profile is only 25% complete. Complete it now to earn your first Hospitality Leaders grade.   ",
                textAlign: TextAlign.center,
                style: bodyLarge.copyWith(
                  color: Cr.redTextColor,
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
          GestureDetector(
            onTap: onClosePressed,
            child: Icon(
              Icons.close,
              color: Cr.redTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
