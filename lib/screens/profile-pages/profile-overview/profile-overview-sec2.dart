import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/common/dropDownButton.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import '../../../common/popUpHeadMenu.dart';
import '../../../constant/colorPicker/color_picker.dart';
import '../../../constant/sizedbox.dart';
import '../profile-edit/profile-edit.dart';

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

  const ProfileOverviewSec2({
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
  }) : super(key: key);

  @override
  State<ProfileOverviewSec2> createState() => _ProfileOverviewSec2State();
}

class _ProfileOverviewSec2State extends State<ProfileOverviewSec2> {
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
      popUpAddCards) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            key: sec2Key,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 5, top: 13),
                  child: Text(
                    cardName,
                    style: const TextStyle(
                        color: Color(0xFF272E41),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 8),
                Divider(
                  height: .5,
                  color: Color(0xFFE5E5E5),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: const Color(0xFF0d9bdc),
                            child: Center(
                              child: Icon(
                                cardIcon,
                                color: Colors.white,
                              ),
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
                            cardTitle,
                            style: const TextStyle(
                                color: Color(0xFF272E41),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                              child: Text(
                                cardSubTitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF32A3FD),
                                ),
                              ),
                              onTap: () {}),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            cardDate,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7C8990),
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: const Color(0xFFEDEFF1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: Text(
                          cardBtn,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff32A3FD)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        widget.sec2IsEditable
            ? ProfileEdit.buildProfileEdit(
                width: sec2_W,
                height: sec2_H,
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

  /// build field Name Common start

  buildFieldName(String fieldName, [String? reqField]) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: '$fieldName ',
              style: FontTextStyle.kBlueDark118W700SSP,
              children: [
                TextSpan(
                    text: reqField, style: FontTextStyle.kBlueLight114W400SSP),
              ]),
        ),
        SS.sB(5)
      ],
    );
  }

  buildTextField([String? hintText]) {
    return Column(
      children: [
        Container(
          height: 36,
          color: ColorPicker.kGreyLight9,
          child: TextFormField(
            decoration: InputDecoration(hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide:
                      BorderSide(color: ColorPicker.kGreyLight9, width: 2)),
            ),
          ),
        ),
        SS.sB(18),
      ],
    );
  }

  /// build field Name Common end

  Future<String?> buildWorkExpPopUp() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              color: ColorPicker.kGreyLight3,
              width: SS.sW(context) * .50,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PopUpHeadMenu.popUpHead('Work experience', context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  /// Education pop up edit functionality start

  bool isVisibleEducation = false;
  bool isEducationEditable = false;
  bool isEducationShowCard = false;
  int indexEdu = 1;

  buildEduInnerCard(bool isEducationEditable, bool isEducationShowCard,int indexEdu) {
    return StatefulBuilder(builder: (context, setState) {
      List<Widget> eduTextFieldGenerate =
          List.generate(indexEdu, (int i) => buildTextField('Course name'));
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: SS.sW(context) * .50,
          color: ColorPicker.kWhite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: SS.sH(context) * .08,
                      width: SS.sW(context) * .03,
                      color: ColorPicker.kBlueLight1,
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
                ),
                isEducationShowCard
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(
                              height: SS.sH(context) * 0.01,
                              color: ColorPicker.kGreyLight3,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildFieldName(
                                      'Educational institution', '*'),
                                  buildTextField(),
                                  buildFieldName('Course duration'),
                                  buildFieldName('Qualification title'),
                                  buildTextField(),
                                  buildFieldName('Description'),
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
                                  buildFieldName('Course outline'),
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
                  width: SS.sW(context) * .50,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PopUpHeadMenu.popUpHead('Education', context),
                        isVisibleEducation
                            ? buildEduInnerCard(false, true,indexEdu)
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
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
                        buildEduInnerCard(true, isEducationShowCard,indexEdu),
                        buildEduInnerCard(true, isEducationShowCard,indexEdu),
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

  buildAchiveInnerCard(bool isArchiveEditable, bool isArchiveShowCard,
      [String? title, String? subTitle, String? year]) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: SS.sW(context) * .50,
          color: ColorPicker.kWhite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: SS.sH(context) * .08,
                      width: SS.sW(context) * .03,
                      color: ColorPicker.kBlueLight1,
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
                ),
                isArchiveShowCard
                    ? Column(
                        children: [
                          Divider(
                            height: SS.sH(context) * 0.01,
                            color: ColorPicker.kGreyLight3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildFieldName('Achievement type', '*'),
                                DropDownButton(
                                    menuList: achiveList,
                                    hintText: 'Presentation'),
                                buildFieldName('Achievement title'),
                                buildTextField(),
                                buildFieldName('Issuing entity'),
                                buildTextField(),
                                buildFieldName('Award/Website link'),
                                buildTextField(),
                                buildFieldName('Date received'),
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
                width: SS.sW(context) * .50,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Achievements', context),
                      isVisibleAchivement
                          ? buildAchiveInnerCard(false, true)
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
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

  Future<String?> buildLanguagePopUp(langIndex) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            List<Widget> textField =
                List.generate(langIndex, (int i) => buildTextField());
            List<Widget> menuItem = List.generate(
                langIndex,
                (int i) => DropDownButton(
                      menuList: langItem,
                      hintText: 'Native or bilingual profiency',
                    ));
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: SS.sW(context) * .50,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PopUpHeadMenu.popUpHead('Languages', context),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: SS.sW(context) * .50,
                          color: ColorPicker.kWhite,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildFieldName('Language', '*'),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      buildFieldName('Proficiency', '*'),
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

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        buildProfileSec2Cards(
            widget.profileOverviewSec2WorkExpKey,
            widget.profileOverviewSec2WorkExp_H,
            widget.profileOverviewSec2WorkExp_W,
            _width,
            _height,
            'Work experience',
            'Food and Beverage Manager',
            'Marriott Hotels',
            'February 2013 – 2014 (1 year 6 months)',
            'Show more',
            'Card-Details',
            Icons.apartment_rounded,
            buildWorkExpPopUp,
            buildWorkExpPopUp),
        buildProfileSec2Cards(
            widget.profileOverviewSec2EducationKey,
            widget.profileOverviewSec2Education_H,
            widget.profileOverviewSec2Education_W,
            _width,
            _height,
            'Education',
            'University of Cape Town',
            'Postgraduate Degree in Business Science',
            '2010 - 2013',
            'Course outline',
            'Card-Details',
            Icons.school_outlined,
            buildEducationPopUp,
            buildEducationPopUp),
        buildProfileSec2Cards(
            widget.profileOverviewSec2AchievementKey,
            widget.profileOverviewSec2Achievement_H,
            widget.profileOverviewSec2Achievement_W,
            _width,
            _height,
            'Achievement',
            'Marriott Hotel and Resorts employee of the year awards',
            'www.mariiott.com/awards',
            '',
            ' More info',
            'Card-Details',
            Icons.shield,
            buildAchivementPopUp,
            buildAchivementPopUp),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                key: widget.profileOverviewSec2LanguagesKey,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        'Languages',
                        style: TextStyle(
                            color: Color(0xFF272E41),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Divider(height: 1, color: Colors.grey.shade400),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      color: const Color(0xFF0d9bdc),
                                      child: const Center(
                                        child: Icon(
                                          CupertinoIcons.globe,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    AutoSizeText(
                                      'English',
                                      style: TextStyle(
                                          color: Color(0xFF272E41),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    AutoSizeText(
                                      'Native and bilingual profiency',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF7C8990)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 6),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade400,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      color: const Color(0xFF0d9bdc),
                                      child: const Center(
                                        child: Icon(
                                          CupertinoIcons.globe,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Spanish',
                                      style: TextStyle(
                                          color: Color(0xFF272E41),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Elementary profiency',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF7C8990)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 6),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            widget.sec2IsEditable
                ? ProfileEdit.buildProfileEdit(
                    width: widget.profileOverviewSec2Languages_W,
                    height: widget.profileOverviewSec2Languages_H,
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
