import 'package:flutter/material.dart';
import 'package:holedo/layouts/pages/profile-pages/profile/header_card.dart';
import 'package:holedo/layouts/pages/profile-pages/timeline/timeline.dart';
import 'package:holedo/models/models.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/fontStyle/font_style.dart';
import '../../../../constant/sizedbox.dart';
import '../../../../responsive/responsive.dart';
import '../profile-edit/profile_edit.dart';
import '../profile-overview/profile_overview.dart';
import '../references/references.dart';

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

  const UserProfilePage({Key? key, required this.userProfileData})
      : super(key: key);

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
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final bool isMine = appState.isLoginnedAndEditable(widget.userProfileData);
    print('app ${isEditable}');
    return Responsive.isDesktop(context)
        ? Container(
            decoration: BoxDecoration(color: ColorPicker.kBG),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderCard(
                    isEditable: isEditable,
                    headerCardKey: headerCardKey,
                    headerCard_H: headerCard_H,
                    headerCard_W: headerCard_W,
                    hCardApiData: widget.userProfileData,
                  ),
                  Container(
                    height: SS.sH(context) * 0.065 as double,
                    width: SS.sW(context) as double,
                    decoration: BoxDecoration(
                      color: ColorPicker.kWhite,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFBDC4C7), width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SS.sW(context) * .080 as double),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      widget.userProfileData.avatar.toString(),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    widget.userProfileData.fullName.toString(),
                                    style: FontTextStyle.kBlueDark116W700SSP),
                              ),
                              Text(
                                  widget.userProfileData.userTitleTypesId
                                      .toString(),
                                  style: FontTextStyle.kBlueDark112W700SSP),
                            ],
                          ),
                          Row(
                            children: [
                              TabBar(
                                labelColor: ColorPicker.kBlueLight1,
                                unselectedLabelColor: ColorPicker.kGreyLight7,
                                indicatorColor: ColorPicker.kBlueLight1,
                                indicatorPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                controller: _tabController,
                                physics: NeverScrollableScrollPhysics(),
                                isScrollable: true,
                                automaticIndicatorColorAdjustment: true,
                                tabs: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Profile overview',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Timeline',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Articles',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Activity',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'References',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          (isMine) ? buildEditButton() : Container(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SS.sH(context) * 1.9 as double,
                    child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          ProfileOverview(
                              isEditable: isEditable,

                              //section1 edit functionality
                              profileOverviewSec1ProSummKey:
                                  profileOverviewSec1ProSummKey,
                              profileOverviewSec1ProSumm_H:
                                  profileOverviewSec1ProSumm_H,
                              profileOverviewSec1ProSumm_W:
                                  profileOverviewSec1ProSumm_W,
                              profileOverviewSec1AreaOfExpKey:
                                  profileOverviewSec1AreaOfExpKey,
                              profileOverviewSec1AreaOfExp_H:
                                  profileOverviewSec1AreaOfExp_H,
                              profileOverviewSec1AreaOfExp_W:
                                  profileOverviewSec1AreaOfExp_W,
                              profileOverviewSec1ReferencesKey:
                                  profileOverviewSec1ReferencesKey,
                              profileOverviewSec1References_H:
                                  profileOverviewSec1References_H,
                              profileOverviewSec1References_W:
                                  profileOverviewSec1References_W,

                              //section2 edit functionality

                              profileOverviewSec2WorkExpKey:
                                  profileOverviewSec2WorkExpKey,
                              profileOverviewSec2WorkExp_H:
                                  profileOverviewSec2WorkExp_H,
                              profileOverviewSec2WorkExp_W:
                                  profileOverviewSec2WorkExp_W,
                              profileOverviewSec2EducationKey:
                                  profileOverviewSec2EducationKey,
                              profileOverviewSec2Education_H:
                                  profileOverviewSec2Education_H,
                              profileOverviewSec2Education_W:
                                  profileOverviewSec2Education_W,
                              profileOverviewSec2AchievementKey:
                                  profileOverviewSec2AchievementKey,
                              profileOverviewSec2Achievement_H:
                                  profileOverviewSec2Achievement_H,
                              profileOverviewSec2Achievement_W:
                                  profileOverviewSec2Achievement_W,
                              profileOverviewSec2LanguagesKey:
                                  profileOverviewSec2LanguagesKey,
                              profileOverviewSec2Languages_H:
                                  profileOverviewSec2Languages_H,
                              profileOverviewSec2Languages_W:
                                  profileOverviewSec2Languages_W,
                              pOApiData: widget.userProfileData,
                              editProfileBtn: buildEditButton),
                          TimeLine(),
                          TimeLine(),
                          TimeLine(),
                          References(
                            isEditable: isEditable,
                            referenceCard_H: referenceCard_H,
                            referenceCard_W: referenceCard_W,
                            referenceCardKey: referenceCardKey,
                          )
                        ]),
                  )
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                HeaderCard(
                    isEditable: isEditable,
                    headerCardKey: headerCardKey,
                    headerCard_H: headerCard_H,
                    headerCard_W: headerCard_W,
                    hCardApiData: widget.userProfileData),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _data[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _data.map<ExpansionPanel>((Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        widget.userProfileData.avatar
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      widget.userProfileData.fullName
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: FontTextStyle.kBlueDark116W700SSP,
                                    ),
                                    SS.sB(0, 2),
                                    Text(
                                      widget.userProfileData.userTitleTypesId
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: FontTextStyle.kBlueDark112W700SSP,
                                    ),
                                  ],
                                ),
                              ),
                              isExpanded
                                  ? Container()
                                  : isMine
                                      ? buildEditButton()
                                      : Container()
                            ],
                          );
                        },
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildMobileMenuDropDownButton(
                                      'Profile Overview'),
                                  buildMobileMenuDropDownButton('Timeline'),
                                  buildMobileMenuDropDownButton('Articles'),
                                  buildMobileMenuDropDownButton('Activity'),
                                  buildMobileMenuDropDownButton('References'),
                                  isMine ? buildEditButton() : Container()
                                ],
                              ),
                            ),
                          ],
                        ),
                        isExpanded: item.isExpanded,
                      );
                    }).toList(),
                  ),
                ),
                ProfileOverview(
                    isEditable: isEditable,

                    //section1 edit functionality
                    profileOverviewSec1ProSummKey:
                        profileOverviewSec1ProSummKey,
                    profileOverviewSec1ProSumm_H: profileOverviewSec1ProSumm_H,
                    profileOverviewSec1ProSumm_W: profileOverviewSec1ProSumm_W,
                    profileOverviewSec1AreaOfExpKey:
                        profileOverviewSec1AreaOfExpKey,
                    profileOverviewSec1AreaOfExp_H:
                        profileOverviewSec1AreaOfExp_H,
                    profileOverviewSec1AreaOfExp_W:
                        profileOverviewSec1AreaOfExp_W,
                    profileOverviewSec1ReferencesKey:
                        profileOverviewSec1ReferencesKey,
                    profileOverviewSec1References_H:
                        profileOverviewSec1References_H,
                    profileOverviewSec1References_W:
                        profileOverviewSec1References_W,

                    //section2 edit functionality

                    profileOverviewSec2WorkExpKey:
                        profileOverviewSec2WorkExpKey,
                    profileOverviewSec2WorkExp_H: profileOverviewSec2WorkExp_H,
                    profileOverviewSec2WorkExp_W: profileOverviewSec2WorkExp_W,
                    profileOverviewSec2EducationKey:
                        profileOverviewSec2EducationKey,
                    profileOverviewSec2Education_H:
                        profileOverviewSec2Education_H,
                    profileOverviewSec2Education_W:
                        profileOverviewSec2Education_W,
                    profileOverviewSec2AchievementKey:
                        profileOverviewSec2AchievementKey,
                    profileOverviewSec2Achievement_H:
                        profileOverviewSec2Achievement_H,
                    profileOverviewSec2Achievement_W:
                        profileOverviewSec2Achievement_W,
                    profileOverviewSec2LanguagesKey:
                        profileOverviewSec2LanguagesKey,
                    profileOverviewSec2Languages_H:
                        profileOverviewSec2Languages_H,
                    profileOverviewSec2Languages_W:
                        profileOverviewSec2Languages_W,
                    pOApiData: widget.userProfileData,
                    editProfileBtn: buildEditButton),
              ],
            ),
          );
  }
}
