import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/common/dropDownButton.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import '../../../../common/popUpHeadMenu.dart';
import '../../../../common/textfield_fieldname.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/sizedbox.dart';
import '../../../../responsive/responsive.dart';
import '../profile-edit/profile_edit.dart';

class ProfileOverviewSec2 extends StatefulWidget {
  final sec2IsEditable;
  final profileOverviewSec2WorkExpKey;
  final profileOverviewSec2WorkExp_H;
  final profileOverviewSec2WorkExp_W;
  final profileOverviewSec2EducationKey;
  final profileOverviewSec2Education_H;
  final profileOverviewSec2Education_W;
  final profileOverviewSec2AchievementKey;
  final profileOverviewSec2Achievement_H;
  final profileOverviewSec2Achievement_W;
  final profileOverviewSec2LanguagesKey;
  final profileOverviewSec2Languages_H;
  final profileOverviewSec2Languages_W;
  final pOApiDataSec2;

  ProfileOverviewSec2({
    Key? key,
    required this.sec2IsEditable,
    this.profileOverviewSec2WorkExpKey,
    this.profileOverviewSec2WorkExp_H,
    this.profileOverviewSec2WorkExp_W,
    this.profileOverviewSec2EducationKey,
    this.profileOverviewSec2Education_H,
    this.profileOverviewSec2Education_W,
    this.profileOverviewSec2AchievementKey,
    this.profileOverviewSec2Achievement_H,
    this.profileOverviewSec2Achievement_W,
    this.profileOverviewSec2LanguagesKey,
    this.profileOverviewSec2Languages_H,
    this.profileOverviewSec2Languages_W,
    this.pOApiDataSec2,
  }) : super(key: key);

  @override
  State<ProfileOverviewSec2> createState() => _ProfileOverviewSec2State();
}

class _ProfileOverviewSec2State extends State<ProfileOverviewSec2> {
  bool isVisible = false;
  bool showIcon = false;
  bool isHovering = false;
  bool isShowingPopUpCard = false;

  Widget buildProfileSec2Cards(
      sec2Key,
      sec2_H,
      sec2_W,
      _width,
      _height,
      String cardName,
      String cardTitle,
      String cardSubTitle,
      String cardDate,
      String cardBtn,
      String cardDetail,
      IconData cardIcon,
      popUpEditCards,
      popUpAddCards,
      bool isVisible,
      String description,
      bool showIcon,
      bool isShowingPopUpCard) {
    return Stack(
      children: [
        StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              key: sec2Key as Key,
              color: ColorPicker.kWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isShowingPopUpCard ? Text('showing') : Container(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 13),
                          child: Text(cardName,
                              style: FontTextStyle.kBlueDark120W400SSP),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            showIcon
                                ? StatefulBuilder(builder: (context, set) {
                                    return InkWell(
                                      onTap: () {
                                        set(() {
                                          isShowingPopUpCard =
                                              !isShowingPopUpCard;
                                          print(isShowingPopUpCard);
                                        });
                                      },
                                      onHover: (value) {
                                        setState(() {
                                          isHovering = value;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(top: 13, right: 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: isHovering
                                                  ? BorderRadius.circular(3)
                                                  : BorderRadius.circular(0),
                                              border: isHovering
                                                  ? Border.all(
                                                      width: 1,
                                                      color: Colors.grey)
                                                  : Border.all(
                                                      width: 0,
                                                      color:
                                                          Colors.transparent)),
                                          child: Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: ColorPicker.kBlueDark1,
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SS.sB(8),
                  Divider(
                    height: .5,
                    color: Color(0xFFE5E5E5),
                  ),
                  SS.sB(10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              color: ColorPicker.kBlueLight1,
                              child: Icon(
                                cardIcon,
                                color: ColorPicker.kWhite,
                                size: 16.67,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cardTitle,
                                style: FontTextStyle.kBlueDark116W700SSP),
                            SS.sB(5),
                            GestureDetector(
                                child: Text(
                                  cardSubTitle,
                                  style: FontTextStyle.kBlueLight114W400SSP,
                                ),
                                onTap: () {}),
                            SS.sB(5),
                            Text(
                              cardDate,
                              style: FontTextStyle.kGreyLight5146W400SSP,
                            ),
                            SS.sB(5),
                          ],
                        ),
                      ),
                      SS.sB(0, 6),
                    ],
                  ),
                  SS.sB(5),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          height: isVisible ? 120 : 0,
                          color: ColorPicker.kGreyLight2,
                          duration: Duration(seconds: 1),
                          alignment: isVisible
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          curve: Curves.fastOutSlowIn,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                description,
                                style: FontTextStyle.kGreyLight516W400SSP,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          color: ColorPicker.kGreyLight2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(
                                  isVisible ? Icons.remove : Icons.add,
                                  color: ColorPicker.kBlueLight1,
                                ),
                                label: Text(isVisible ? 'Close' : cardBtn,
                                    style: FontTextStyle.kBlueLight114W400SSP),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        widget.sec2IsEditable as bool
            ? ProfileEdit.buildProfileEdit(
                width: sec2_W as double,
                height: sec2_H as double,
                popUpEdit: () {
                  popUpEditCards();
                },
                showAddButton: true,
                popUpAdd: () {
                  popUpAddCards();
                })
            : Container()
      ],
    );
  }

  /// pop up functionality Start

  /// Work experience pop up edit functionality start

  bool isVisibleExperience = false;
  bool isExperienceEditable = false;
  bool isExperienceShowCard = false;
  int indexExp = 1;

  Widget buildExpInnerCard(
      bool isExperienceEditable, bool isExperienceShowCard, int indexExp) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Container(
          width: Responsive.isDesktop(context)
              ? SS.sW(context) * .50 as double
              : Responsive.isMobile(context)
                  ? SS.sW(context) * .90 as double
                  : SS.sW(context) * .60 as double,
          color: ColorPicker.kWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    color: ColorPicker.kBlueLight1,
                    child: Icon(
                      Icons.apartment_rounded,
                      size: 18,
                      color: ColorPicker.kWhite,
                    ),
                  ),
                  title: Text(''),
                  subtitle: Text(''),
                  trailing: isExperienceEditable
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isExperienceShowCard = !isExperienceShowCard;
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 10,
                            color: ColorPicker.kBlueLight1,
                          ),
                        )
                      : null,
                ),
                isExperienceShowCard
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(
                              height: SS.sH(context) * 0.01 as double,
                              color: ColorPicker.kGreyLight3,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFieldAndFieldName.buildFieldName(
                                      'Title / position', '*') as Widget,
                                  TextFieldAndFieldName.buildTextField(
                                      'General manager') as Widget,
                                  TextFieldAndFieldName.buildFieldName(
                                      'Company name', '*') as Widget,
                                  TextFieldAndFieldName.buildTextField(
                                      'Fairmont Zimbali Resort') as Widget,
                                  TextFieldAndFieldName.buildFieldName(
                                      'Company website') as Widget,
                                  TextFieldAndFieldName.buildTextField(
                                      'www.fairmontzimbali.com') as Widget,
                                  TextFieldAndFieldName.buildFieldName(
                                      'Job description') as Widget,
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      autocorrect: true,
                                      minLines: 4,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Text('Cancel')),
                                      SS.sB(0, 10),
                                      ElevatedButton(
                                          onPressed: () {}, child: Text('Save'))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<String?> buildWorkExpPopUp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .50 as double
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90 as double
                        : SS.sW(context) * .60 as double,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Work experience', context),
                      SS.sB(15),
                      isVisibleExperience
                          ? buildExpInnerCard(false, true, indexExp)
                          : Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: ColorPicker.kGreenNeon,
                                child: IconButton(
                                  color: ColorPicker.kWhite,
                                  onPressed: () {
                                    setState(
                                      () {
                                        isVisibleExperience =
                                            !isVisibleExperience;
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ),
                      buildExpInnerCard(true, isExperienceShowCard, indexExp),
                      buildExpInnerCard(true, isExperienceShowCard, indexExp),
                      SS.sB(15)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Work experience pop up edit functionality end

  /// Education pop up edit functionality start

  bool isVisibleEducation = false;
  bool isEducationEditable = false;
  bool isEducationShowCard = false;
  int indexEdu = 1;

  Widget buildEduInnerCard(
      bool isEducationEditable, bool isEducationShowCard, int indexEdu) {
    return StatefulBuilder(builder: (context, setState) {
      List<Widget> eduTextFieldGenerate = List.generate(
          indexEdu,
          (int i) =>
              TextFieldAndFieldName.buildTextField('Course name') as Widget);
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Container(
          width: Responsive.isDesktop(context)
              ? SS.sW(context) * .50 as double
              : Responsive.isMobile(context)
                  ? SS.sW(context) * .90 as double
                  : SS.sW(context) * .60 as double,
          color: ColorPicker.kWhite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    color: ColorPicker.kBlueLight1,
                    child: Icon(
                      Icons.school_rounded,
                      color: ColorPicker.kWhite,
                      size: 18,
                    ),
                  ),
                  title: Text(''),
                  subtitle: Text(''),
                  trailing: isEducationEditable
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isEducationShowCard = !isEducationShowCard;
                            });
                          },
                          icon: Icon(Icons.edit),
                        )
                      : null,
                ),
                isEducationShowCard
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(
                              height: SS.sH(context) * 0.01 as double,
                              color: ColorPicker.kGreyLight3,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFieldAndFieldName.buildFieldName(
                                      'Educational institution', '*') as Widget,
                                  TextFieldAndFieldName.buildTextField()
                                      as Widget,
                                  TextFieldAndFieldName.buildFieldName(
                                      'Course duration') as Widget,
                                  TextFieldAndFieldName.buildFieldName(
                                      'Qualification title') as Widget,
                                  TextFieldAndFieldName.buildTextField()
                                      as Widget,
                                  TextFieldAndFieldName.buildFieldName(
                                      'Description') as Widget,
                                  TextField(
                                    autocorrect: true,
                                    minLines: 4,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                  ),
                                  SS.sB(18),
                                  TextFieldAndFieldName.buildFieldName(
                                      'Course outline') as Widget,
                                  Column(children: eduTextFieldGenerate),
                                  TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        indexEdu++;
                                      });
                                    },
                                    icon: Icon(Icons.add),
                                    label: Text('Add another'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Text('Cancel')),
                                      SS.sB(0, 10),
                                      ElevatedButton(
                                          onPressed: () {}, child: Text('Save'))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<String?> buildEducationPopUp() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: Dialog(
                child: Container(
                  color: ColorPicker.kGreyLight3,
                  width: Responsive.isDesktop(context)
                      ? SS.sW(context) * .50 as double
                      : Responsive.isMobile(context)
                          ? SS.sW(context) * .90 as double
                          : SS.sW(context) * .60 as double,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PopUpHeadMenu.popUpHead('Education', context),
                        SS.sB(15),
                        isVisibleEducation
                            ? buildEduInnerCard(false, true, indexEdu)
                            : Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: ColorPicker.kGreenNeon,
                                  child: IconButton(
                                      color: ColorPicker.kWhite,
                                      onPressed: () {
                                        setState(() {
                                          isVisibleEducation =
                                              !isVisibleEducation;
                                        });
                                      },
                                      icon: Icon(Icons.add)),
                                ),
                              ),
                        buildEduInnerCard(true, isEducationShowCard, indexEdu),
                        buildEduInnerCard(true, isEducationShowCard, indexEdu),
                        SS.sB(15)
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  /// Education pop up edit functionality end

  ///Achivement pop up edit functionality start

  bool isVisibleAchivement = false;
  bool isArchiveEditable = false;
  bool isArchiveShowCard = false;
  List achiveList = ['Award', 'Project', 'Presentation'];
  List achiveYearList = ['2010', '2011', '2012', '2013', '2014', '2015'];

  Widget buildAchiveInnerCard(bool isArchiveEditable, bool isArchiveShowCard,
      [String? title, String? subTitle, String? year]) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Container(
          width: Responsive.isDesktop(context)
              ? SS.sW(context) * .50 as double
              : Responsive.isMobile(context)
                  ? SS.sW(context) * .90 as double
                  : SS.sW(context) * .60 as double,
          color: ColorPicker.kWhite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    color: ColorPicker.kBlueLight1,
                    child: FaIcon(
                      Icons.verified_user_rounded,
                      color: ColorPicker.kWhite,
                      size: 18,
                    ),
                  ),
                  title: Text(''),
                  subtitle: Text(''),
                  trailing: isArchiveEditable
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isArchiveShowCard = !isArchiveShowCard;
                            });
                          },
                          icon: Icon(Icons.edit),
                        )
                      : null,
                ),
                isArchiveShowCard
                    ? Column(
                        children: [
                          Divider(
                            height: SS.sH(context) * 0.01 as double,
                            color: ColorPicker.kGreyLight3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldAndFieldName.buildFieldName(
                                    'Achievement type', '*') as Widget,
                                DropDownButton(
                                    menuList: achiveList,
                                    hintText: 'Presentation'),
                                TextFieldAndFieldName.buildFieldName(
                                    'Achievement title') as Widget,
                                TextFieldAndFieldName.buildTextField()
                                    as Widget,
                                TextFieldAndFieldName.buildFieldName(
                                    'Issuing entity') as Widget,
                                TextFieldAndFieldName.buildTextField()
                                    as Widget,
                                TextFieldAndFieldName.buildFieldName(
                                    'Award/Website link') as Widget,
                                TextFieldAndFieldName.buildTextField()
                                    as Widget,
                                TextFieldAndFieldName.buildFieldName(
                                    'Date received') as Widget,
                                SizedBox(
                                  width: 100,
                                  child: DropDownButton(
                                    menuList: achiveYearList,
                                    hintText: 'Year',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {},
                                        child: Text('Cancel')),
                                    SS.sB(0, 10),
                                    ElevatedButton(
                                        onPressed: () {}, child: Text('Save'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<String?> buildAchivementPopUp() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .50 as double
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90 as double
                        : SS.sW(context) * .60 as double,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Achievements', context),
                      SS.sB(15),
                      isVisibleAchivement
                          ? buildAchiveInnerCard(false, true)
                          : Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: ColorPicker.kGreenNeon,
                                child: IconButton(
                                    color: ColorPicker.kWhite,
                                    onPressed: () {
                                      setState(() {
                                        isVisibleAchivement =
                                            !isVisibleAchivement;
                                      });
                                    },
                                    icon: Icon(Icons.add)),
                              ),
                            ),
                      buildAchiveInnerCard(true, isArchiveShowCard),
                      buildAchiveInnerCard(true, isArchiveShowCard),
                      SS.sB(15)
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  ///Achivement pop up edit functionality end

  /// Language pop up edit functionality start

  List langItem = [
    'Native or bilingual profiency1',
    'Native or bilingual profiency2',
    'Native or bilingual profiency3'
  ];

  // String? selectValue;
  int langIndex = 2;

  Future<String?> buildLanguagePopUp(int langIndex) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            List<Widget> textField = List.generate(langIndex,
                (int i) => TextFieldAndFieldName.buildTextField() as Widget);
            List<Widget> menuItem = List.generate(
                langIndex,
                (int i) => DropDownButton(
                      menuList: langItem,
                      hintText: 'Native or bilingual profiency',
                    ));
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .50 as double
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90 as double
                        : SS.sW(context) * .60 as double,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PopUpHeadMenu.popUpHead('Languages', context),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? SS.sW(context) * .50 as double
                              : Responsive.isMobile(context)
                                  ? SS.sW(context) * .90 as double
                                  : SS.sW(context) * .60 as double,
                          color: ColorPicker.kWhite,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFieldAndFieldName.buildFieldName(
                                          'Language', '*') as Widget,
                                      SS.sB(10, 0),
                                      Column(
                                        children: textField,
                                      ),
                                      TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            langIndex++;
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                        label: Text('Add another'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextFieldAndFieldName.buildFieldName(
                                          'Proficiency', '*') as Widget,
                                      SS.sB(10, 0),
                                      Column(
                                        children: menuItem,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {},
                                              child: Text('Cancel')),
                                          SS.sB(0, 10),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Save'))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  /// Language pop up edit functionality end

  List description = [
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildProfileSec2Cards(
            widget.profileOverviewSec2WorkExpKey,
            widget.profileOverviewSec2WorkExp_H,
            widget.profileOverviewSec2WorkExp_W,
            SS.sW(context),
            SS.sH(context),
            'Work experience',
            'Food and Beverage Manager',
            'Marriott Hotels',
            'February 2013 – 2014 (1 year 6 months)',
            'Show more',
            'Card-Details',
            Icons.apartment_rounded,
            buildWorkExpPopUp,
            buildWorkExpPopUp,
            isVisible,
            description[0].toString(),
            true,
            isShowingPopUpCard),
        buildProfileSec2Cards(
            widget.profileOverviewSec2EducationKey,
            widget.profileOverviewSec2Education_H,
            widget.profileOverviewSec2Education_W,
            SS.sW(context),
            SS.sH(context),
            'Education',
            'University of Cape Town',
            'Postgraduate Degree in Business Science',
            '2010 - 2013',
            'Course outline',
            'Card-Details',
            Icons.school_rounded,
            buildEducationPopUp,
            buildEducationPopUp,
            isVisible,
            description[1].toString(),
            false,
            isShowingPopUpCard),
        buildProfileSec2Cards(
            widget.profileOverviewSec2AchievementKey,
            widget.profileOverviewSec2Achievement_H,
            widget.profileOverviewSec2Achievement_W,
            SS.sW(context),
            SS.sH(context),
            'Achievement',
            'Marriott Hotel and Resorts employee of the year awards',
            'www.mariiott.com/awards',
            '',
            ' More info',
            'Card-Details',
            Icons.verified_user_sharp,
            buildAchivementPopUp,
            buildAchivementPopUp,
            isVisible,
            description[2].toString(),
            false,
            isShowingPopUpCard),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                key: widget.profileOverviewSec2LanguagesKey as Key,
                color: ColorPicker.kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 13),
                      child: Text(
                        'Languages',
                        style: FontTextStyle.kBlueDark120W400SSP,
                      ),
                    ),
                    SS.sB(8),
                    Divider(
                      height: .5,
                      color: Color(0xFFE5E5E5),
                    ),
                    SS.sB(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                color: ColorPicker.kBlueLight1,
                                child: Icon(
                                  Icons.language,
                                  color: ColorPicker.kWhite,
                                  size: 16.67,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.pOApiDataSec2.toString(),
                                  style: FontTextStyle.kBlueDark116W700SSP),
                              SS.sB(5),
                              Text(
                                'Native and bilingual profiency',
                                style: FontTextStyle.kGreyLight514W400SSP,
                              ),
                              SS.sB(5),
                            ],
                          ),
                        ),
                        SS.sB(0, 6),
                      ],
                    ),
                    SS.sB(20),
                    Divider(
                      height: .5,
                      color: Color(0xFFE5E5E5),
                    ),
                    SS.sB(20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                color: ColorPicker.kBlueLight1,
                                child: Icon(
                                  Icons.language,
                                  color: ColorPicker.kWhite,
                                  size: 16.67,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spanish',
                                style: FontTextStyle.kBlueDark116W700SSP,
                              ),
                              SS.sB(5),
                              Text(
                                'Elementary profiency',
                                style: FontTextStyle.kGreyLight514W400SSP,
                              ),
                              SS.sB(5),
                            ],
                          ),
                        ),
                        SS.sB(0, 6)
                      ],
                    ),
                    SS.sB(20)
                  ],
                ),
              ),
            ),
            widget.sec2IsEditable as bool
                ? ProfileEdit.buildProfileEdit(
                    width: widget.profileOverviewSec2Languages_W as double,
                    height: widget.profileOverviewSec2Languages_H as double,
                    popUpEdit: () {
                      buildLanguagePopUp(langIndex);
                    },
                    showAddButton: true,
                    popUpAdd: () {
                      buildLanguagePopUp(langIndex);
                    })
                : Container(),
          ],
        ),
      ],
    );
  }
}
