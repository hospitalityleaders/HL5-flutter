// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as Store;
import 'package:get_storage/get_storage.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/controller/auth_controller.dart';
import 'package:holedo/screens/profile-pages/profile-edit/profile-edit.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile-overview.dart';
import 'package:holedo/screens/profile-pages/timeline/timeline.dart';
import 'package:holedo/services/holedo_api_services.dart';
import '../../../controller/menu_controller.dart';
import '../../../models/HoledoProfileModel.dart';
import '../../../responsive/responsive.dart';
import '../references/references.dart';
import 'header-card.dart';

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
//mobile view end

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  static const String route = '/second';
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  //header card edit functionality
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

  ///Common widgets
  buildEditButton() {
    return EditButton(
      onChanged: (value) {
        setState(() {
          isEditable = !value;
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

  //mobile view functionality

  final List<Item> _data = generateItems(1);

  MenuController _menuController = Get.find();

  List drawerItem = ['Home', 'Profile', 'News', 'Jobs', 'Recruitment', 'Help'];

  TabController? _tabController;
  int _current = 0;
  int tabBar = 0;
  int indexCircle = 0;
  bool isEditable = false;

  buildMobileMenuDropDownButton(String btnName) {
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

  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    //profile();
    //_apiServices.getUserApi('${AuthData.token}');
    super.initState();
  }

  ApiServices _apiServices = ApiServices();

  Future<HoledoProfileModel> profile() async {
    dynamic res = await _apiServices.getUserProfileData();
    final model = Store.Get.put(AuthController()).restoreModel();
    if (res['errors'] == null) {
      final model = Store.Get.put(AuthController()).restoreModel();
      model.setData = HoledoProfileModel.fromJson(res.data);
      Store.Get.find<AuthController>().authModel(model);
    }
    return model.data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HoledoProfileModel?>(
        future: profile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Responsive.isDesktop(context)
                ? Container(
                    decoration: BoxDecoration(color: ColorPicker.kBG),
                    child: Column(
                      children: [
                        HeaderCard(
                            isEditable: isEditable,
                            headerCardKey: headerCardKey,
                            headerCard_H: headerCard_H,
                            headerCard_W: headerCard_W,
                            hCardApiData: snapshot.data!.data!.user!),
                        Container(
                          height: Get.height * 0.06,
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFBDC4C7), width: 2),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * .080),
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
                                            snapshot.data!.data!.user!.avatar
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                          snapshot.data!.data!.user!.fullName
                                              .toString(),
                                          style: FontTextStyle
                                              .kBlueDark116W700SSP),
                                    ),
                                    Text(
                                        snapshot
                                            .data!.data!.user!.userTitleTypesId
                                            .toString(),
                                        style:
                                            FontTextStyle.kBlueDark112W700SSP),
                                  ],
                                ),
                                Row(
                                  children: [
                                    TabBar(
                                      labelColor: ColorPicker.kBlueLight1,
                                      unselectedLabelColor:
                                          ColorPicker.kGreyLight7,
                                      indicatorColor: ColorPicker.kBlueLight1,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      controller: _tabController,
                                      onTap: (int value) {
                                        _menuController.setTabIndex1(value);
                                      },
                                      physics: NeverScrollableScrollPhysics(),
                                      isScrollable: true,
                                      automaticIndicatorColorAdjustment: true,
                                      tabs: const [
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
                                buildEditButton(),
                              ],
                            ),
                          ),
                        ),
                        Obx(() => IndexedStack(
                              // This key causes the AnimatedSwitcher to interpret this as a "new"
                              // child each time the count changes, so that it will begin its animation
                              // when the count changes.
                              key: ValueKey<int>(_menuController.tabIndex1.value
                                  .toInt()), // add this line
                              index: _menuController.tabIndex1.value.toInt(),
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
                                    pOApiData: snapshot.data!.data!.user!,
                                    editProfileBtn: buildEditButton),
                                Timeline(),
                                Timeline(),
                                Timeline(),
                                References(
                                  isEditable: isEditable,
                                  referenceCard_H: referenceCard_H,
                                  referenceCard_W: referenceCard_W,
                                  referenceCardKey: referenceCardKey,
                                )
                              ],
                            ))
                      ],
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
                            hCardApiData: snapshot.data!.data!.user!),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                _data[index].isExpanded = !isExpanded;
                              });
                            },
                            children: _data.map<ExpansionPanel>((Item item) {
                              return ExpansionPanel(
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: Container(
                                          height: 26,
                                          width: 26,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                snapshot
                                                    .data!.data!.user!.avatar
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: Row(
                                          children: [
                                            Text(
                                              snapshot
                                                  .data!.data!.user!.fullName
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: FontTextStyle
                                                  .kBlueDark116W700SSP,
                                            ),
                                            SS.sB(0, 2),
                                            Text(
                                              snapshot.data!.data!.user!
                                                  .userTitleTypesId
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: FontTextStyle
                                                  .kBlueDark112W700SSP,
                                            ),
                                          ],
                                        ),
                                      ),
                                      isExpanded
                                          ? Container()
                                          : buildEditButton()
                                    ],
                                  );
                                },
                                body: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildMobileMenuDropDownButton(
                                              'Profile Overview'),
                                          buildMobileMenuDropDownButton(
                                              'Timeline'),
                                          buildMobileMenuDropDownButton(
                                              'Articles'),
                                          buildMobileMenuDropDownButton(
                                              'Activity'),
                                          buildMobileMenuDropDownButton(
                                              'References'),
                                          buildEditButton()
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
                            pOApiData: snapshot.data!.data!.user!,
                            editProfileBtn: buildEditButton),
                      ],
                    ),
                  );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
    // SingleChildScrollView(
    //   child: FutureBuilder<HoledoProfileModel>(
    //     future: profile(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return
    //       } else {
    //         return CircularProgressIndicator();
    //       }
    //     },
    //   ),
    // );
  }
}
