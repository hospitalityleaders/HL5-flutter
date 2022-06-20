import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/common/build_work_exp_pop_up.dart';
import 'package:holedo/common/clipper.dart';
import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/common/textfield_fieldname.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/layouts/pages/profile-pages/profile-edit/profile_edit.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/components/edit_icon_buttton.dart';
import 'package:holedo/presentation/ui/pages/components/profile_workexperience.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:provider/provider.dart';
import 'package:holedo/common/dropDownButton.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';

class ProfileOverviewSecondColumn extends StatefulWidget {
  const ProfileOverviewSecondColumn({
    Key? key,
    this.sec2IsEditable,
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

  @override
  State<ProfileOverviewSecondColumn> createState() =>
      _ProfileOverviewSecondColumnState();
}

class _ProfileOverviewSecondColumnState
    extends State<ProfileOverviewSecondColumn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeaturedVideoComponent(),
          Di.SBHEL,
          ProfileWorkExperienceComponent(
            onEditPressed: buildWorkExpPopUp,
          ),
          Di.SBHEL,
          EducationComponent(onEditPressed: buildEducationPopUp),
          Di.SBHEL,
          AchievementComponent(
            onEditPressed: buildAchivementPopUp,
          ),
          Di.SBHEL,
          LanguagesComponent(
            onEditPressed: () => buildLanguagePopUp(langIndex),
          ),
          Di.SBHEL,
        ],
      ),
    );
  }

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
  ) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            key: sec2Key as Key,
            color: ColorPicker.kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      isShowingPopUpCard = !isShowingPopUpCard;
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
                                                  width: 1, color: Colors.grey)
                                              : Border.all(
                                                  width: 0,
                                                  color: Colors.transparent)),
                                      child: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        color: ColorPicker.kBlueDark1,
                                      ),
                                    ),
                                  ),
                                )
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
                  child: StatefulBuilder(builder: (context, setState) {
                    return Column(
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
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        showIcon
            ? Positioned(
                top: 50,
                right: 10,
                child: Visibility(
                  visible: isShowingPopUpCard,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(.35, 0),
                        child: ClipPath(
                          clipper: ArrowClipper(),
                          child: Container(
                            height: 15,
                            width: 12,
                            decoration: BoxDecoration(
                              color: ColorPicker.kGreyLight7.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment(.25, .12),
                          child: Container(
                            color: ColorPicker.kWhite,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.menu,
                                        color: ColorPicker.kBlueLight1,
                                        size: 10,
                                      ),
                                      SS.sB(0, 7.5),
                                      Text(
                                        'View in timeline',
                                        style:
                                            FontTextStyle.kBlueLight114W400SSP,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 0.5,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.menu,
                                        color: ColorPicker.kBlueLight1,
                                        size: 10,
                                      ),
                                      SS.sB(0, 7.5),
                                      Text(
                                        'View in timeline',
                                        style:
                                            FontTextStyle.kBlueLight114W400SSP,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ))
            : Container(),
        if (widget.sec2IsEditable as bool)
          ProfileEdit.buildProfileEdit(
              width: sec2_W as double,
              height: sec2_H as double,
              popUpEdit: () {
                popUpEditCards();
              },
              showAddButton: true,
              popUpAdd: () {
                popUpAddCards();
              })
        else
          Container(),
      ],
    );
  }

  /// pop up functionality Start

  /// Work experience pop up edit functionality start

  bool isVisibleExperience = false;
  bool isExperienceEditable = false;
  bool isExperienceShowCard = false;
  int indexExp = 1;

  BuildWorkExpPopUp _buildWorkExpPopUp = BuildWorkExpPopUp();

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
                    ? SS.sW(context) * .50
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90
                        : SS.sW(context) * .60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Work experience', context),
                      SS.sB(15),
                      isVisibleExperience
                          ? _buildWorkExpPopUp.buildExpInnerCard(
                              false, true, indexExp)
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
                      _buildWorkExpPopUp.buildExpInnerCard(
                          true, isExperienceShowCard, indexExp),
                      _buildWorkExpPopUp.buildExpInnerCard(
                          true, isExperienceShowCard, indexExp),
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
    return StatefulBuilder(
      builder: (context, setState) {
        List<Widget> eduTextFieldGenerate = List.generate(indexEdu,
            (int i) => TextFieldAndFieldName.buildTextField('Course name'));
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Container(
            width: Responsive.isDesktop(context)
                ? SS.sW(context) * .50
                : Responsive.isMobile(context)
                    ? SS.sW(context) * .90
                    : SS.sW(context) * .60,
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
                                  height: SS.sH(context) * 0.01,
                                  color: ColorPicker.kGreyLight3),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFieldAndFieldName.buildFieldName(
                                        'Educational institution', '*'),
                                    TextFieldAndFieldName.buildTextField(),
                                    TextFieldAndFieldName.buildFieldName(
                                        'Course duration'),
                                    TextFieldAndFieldName.buildFieldName(
                                        'Qualification title'),
                                    TextFieldAndFieldName.buildTextField(),
                                    TextFieldAndFieldName.buildFieldName(
                                        'Description'),
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
                                        'Course outline'),
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
                                          onPressed: () {},
                                          child: Text('Save'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
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
                      ? SS.sW(context) * .50
                      : Responsive.isMobile(context)
                          ? SS.sW(context) * .90
                          : SS.sW(context) * .60,
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
              ? SS.sW(context) * .50
              : Responsive.isMobile(context)
                  ? SS.sW(context) * .90
                  : SS.sW(context) * .60,
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
                            height: SS.sH(context) * 0.01,
                            color: ColorPicker.kGreyLight3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldAndFieldName.buildFieldName(
                                    'Achievement type', '*'),
                                DropDownButton(
                                    menuList: achiveList,
                                    hintText: 'Presentation'),
                                TextFieldAndFieldName.buildFieldName(
                                    'Achievement title'),
                                TextFieldAndFieldName.buildTextField(),
                                TextFieldAndFieldName.buildFieldName(
                                    'Issuing entity'),
                                TextFieldAndFieldName.buildTextField(),
                                TextFieldAndFieldName.buildFieldName(
                                    'Award/Website link'),
                                TextFieldAndFieldName.buildTextField(),
                                TextFieldAndFieldName.buildFieldName(
                                    'Date received'),
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
                    ? SS.sW(context) * .50
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90
                        : SS.sW(context) * .60,
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
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            List<Widget> textField = List.generate(
                langIndex, (int i) => TextFieldAndFieldName.buildTextField());
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
                    ? SS.sW(context) * .50
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90
                        : SS.sW(context) * .60,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PopUpHeadMenu.popUpHead('Languages', context),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? SS.sW(context) * .50
                              : Responsive.isMobile(context)
                                  ? SS.sW(context) * .90
                                  : SS.sW(context) * .60,
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
                                          'Language', '*'),
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
                                          'Proficiency', '*'),
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
                                            child: Text(
                                              'Cancel',
                                            ),
                                          ),
                                          SS.sB(0, 10),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Save',
                                            ),
                                          ),
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
          },
        );
      },
    );
  }

  /// Language pop up edit functionality end

  List description = [
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
    '''Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
  ];
}

class LanguagesComponent extends StatelessWidget {
  const LanguagesComponent({
    Key? key,
    this.onEditPressed,
  }) : super(key: key);

  final void Function()? onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          ListTile(
            title: Text(
              "Languages",
              style: h2Regular,
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Divider(
                    thickness: 1,
                    height: 0,
                  ),
                  Di.SBHS,
                  Container(
                    width: 360,
                    decoration:
                        Styles.boxDecoration.copyWith(color: Cr.whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: ContainerWithIcon(
                            iconData: FontAwesomeIcons.buildingColumns,
                            size: 50,
                          ),
                          trailing: SizedBox(),
                          title: Text(
                            "English",
                            style: h4Bold.copyWith(
                              fontSize: Di.FSD,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Di.PSETS + 1,
                            ),
                            child: Text(
                              "Native and bilingual profiency",
                              style: bodySmallRegular.copyWith(
                                color: Cr.accentBlue1,
                                fontSize: Di.FSS,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: ContainerWithIcon(
                            iconData: FontAwesomeIcons.buildingColumns,
                            size: 50,
                          ),
                          trailing: SizedBox(),
                          title: Text(
                            "Spanish",
                            style: h4Bold.copyWith(
                              fontSize: Di.FSD,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Di.PSETS,
                            ),
                            child: Text(
                              "Native and bilingual profiency",
                              style: bodySmallRegular.copyWith(
                                color: Cr.accentBlue1,
                                fontSize: Di.FSS,
                              ),
                            ),
                          ),
                        ),
                        Di.SBHD,
                      ],
                    ),
                  ),
                ],
              ),
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 560,
                            height: 135,
                            color: Cr.accentBlue2.withOpacity(.8),
                            padding: EdgeInsets.all(Di.PSD),
                          ),
                        ],
                      ),
                    )
                  : Di.ESB,
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? EditIconButton(onPressed: onEditPressed)
                  : Di.ESB,
            ],
          ),
        ],
      ),
    );
  }
}

class AchievementComponent extends StatelessWidget {
  const AchievementComponent({
    Key? key,
    this.onEditPressed,
  }) : super(key: key);

  final void Function()? onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          ListTile(
            title: Text(
              "Achievement",
              style: h2Regular,
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Divider(
                    thickness: 1,
                    height: 0,
                  ),
                  Di.SBHS,
                  Container(
                    width: 360,
                    decoration:
                        Styles.boxDecoration.copyWith(color: Cr.whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: ContainerWithIcon(
                            iconData: FontAwesomeIcons.buildingColumns,
                            size: 50,
                          ),
                          trailing: SizedBox(),
                          title: Text(
                            "Marriott Hotel and Resorts employee of the year awards",
                            style: h4Bold.copyWith(
                              fontSize: Di.FSD,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Di.SBHES,
                              Text(
                                "www.marriott.com/awards",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                  fontSize: Di.FSS,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Di.SBHD,
                        Divider(
                          thickness: 1,
                          height: 0,
                        ),
                        Container(
                          width: 360,
                          color: Cr.lightGrey2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Di.SBHS,
                              CustomTextButton(
                                text: "  + More info",
                              ),
                              Di.SBHS,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 360,
                            height: 135,
                            color: Cr.accentBlue2.withOpacity(.8),
                            padding: EdgeInsets.all(Di.PSD),
                          ),
                        ],
                      ),
                    )
                  : Di.ESB,
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? EditIconButton(onPressed: onEditPressed)
                  : Di.ESB,
            ],
          ),
        ],
      ),
    );
  }
}

class EducationComponent extends StatelessWidget {
  const EducationComponent({
    Key? key,
    this.onEditPressed,
  }) : super(key: key);
  final void Function()? onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          ListTile(
            title: Text(
              "Education",
              style: h2Regular,
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Divider(
                    thickness: 1,
                    height: 0,
                  ),
                  Di.SBHS,
                  Container(
                    width: 360,
                    decoration:
                        Styles.boxDecoration.copyWith(color: Cr.whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: ContainerWithIcon(
                            iconData: FontAwesomeIcons.buildingColumns,
                            size: 50,
                          ),
                          title: Text(
                            "University of Cape Town",
                            style: h4Bold.copyWith(
                              fontSize: Di.FSD,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: Di.PSETS + 1),
                              Text(
                                "Postgraduate Degree in Business Science",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                  fontSize: Di.FSS,
                                ),
                              ),
                              SizedBox(height: Di.PSETS + 1),
                              Text(
                                "2010 - 2013",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.darkGrey1,
                                  fontSize: Di.FSS,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Di.SBHD,
                        Divider(
                          thickness: 1,
                          height: 0,
                        ),
                        Container(
                          width: 360,
                          color: Cr.lightGrey2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Di.SBHS,
                              CustomTextButton(
                                text: "  + Course online",
                              ),
                              Di.SBHS,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 560,
                            height: 135,
                            color: Cr.accentBlue2.withOpacity(.8),
                            padding: EdgeInsets.all(Di.PSD),
                          ),
                        ],
                      ),
                    )
                  : Di.ESB,
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? EditIconButton(onPressed: onEditPressed)
                  : Di.ESB,
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturedVideoComponent extends StatelessWidget {
  const FeaturedVideoComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Di.PSD),
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Featured video",
              style: h2Regular,
            ),
          ),

          // Di.SBHD,
          Divider(thickness: 1),
          Di.SBHD,
          Stack(
            children: [
              SizedBox(
                height: 180,
                width: 360,
                child: Image.asset(
                  "assets/images/videoThumbnail.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child:
                      // Container(
                      //   width: 100,
                      //   height: 100,
                      //   color: Cr.accentBlue1,
                      // ),
                      SvgPicture.asset(
                    "assets/icons/smallPlayerIcon.svg",
                  ),
                ),
              ),
            ],
          ),
          Di.SBHL,

          Text(
            "Chef TV: Inside the kitchen of Noberto Holden",
            style: h4Bold,
          ),
          Di.SBHL,
          RichText(
            text: TextSpan(
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      "Noberto's career has revolved around causing corporate transformation projects designed to optimize the use of resources enha...",
                ),
                TextSpan(
                  text: "show more",
                  style: TextStyle(
                    color: Cr.accentBlue1,
                  ),
                ),
              ],
            ),
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}