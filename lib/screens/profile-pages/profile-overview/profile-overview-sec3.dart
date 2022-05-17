import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';

import '../../../common/dropDownButton.dart';
import '../../../common/popUpHeadMenu.dart';
import '../../../common/textfield_fieldname.dart';

class ProfileOverviewSec3 extends StatefulWidget {
  final pOApiDataSec3;

  const ProfileOverviewSec3({Key? key, this.pOApiDataSec3}) : super(key: key);

  @override
  State<ProfileOverviewSec3> createState() => _ProfileOverviewSec3State();
}

class _ProfileOverviewSec3State extends State<ProfileOverviewSec3> {
  double value = 0.25;

  /// buildAddyourworkexperiencePopUpCard endstart

  bool isVisibleExperience = false;
  bool isExperienceEditable = false;
  bool isExperienceShowCard = false;
  int indexExp = 1;

  buildExpInnerCard(
      bool isExperienceEditable, bool isExperienceShowCard, int indexExp) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: SS.sW(context) * .50,
          color: ColorPicker.kWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: SS.sH(context) * .08,
                    width: SS.sW(context) * .03,
                    color: ColorPicker.kBlueLight1,
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
                          icon: Icon(Icons.edit),
                        )
                      : null,
                ),
                isExperienceShowCard
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(
                              height: SS.sH(context) * 0.01,
                              color: ColorPicker.kGreyLight3,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFieldAndFieldName.buildFieldName(
                                      'Title / position', '*'),
                                  TextFieldAndFieldName.buildTextField(
                                      'General manager'),
                                  TextFieldAndFieldName.buildFieldName(
                                      'Company name', '*'),
                                  TextFieldAndFieldName.buildTextField(
                                      'Fairmont Zimbali Resort'),
                                  TextFieldAndFieldName.buildFieldName(
                                      'Company website'),
                                  TextFieldAndFieldName.buildTextField(
                                      'www.fairmontzimbali.com'),
                                  TextFieldAndFieldName.buildFieldName(
                                      'Job description'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
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

  Future<String?> buildAddyourworkexperiencePopUpCard() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: SS.sW(context) * .50,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Work experience', context),
                      isVisibleExperience
                          ? buildExpInnerCard(false, true, indexExp)
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
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

  /// buildAddyourworkexperiencePopUpCard end

  ///buildAddyourqualificationsPopUpCard start

  TextEditingController _controller = TextEditingController();
  List chipList = [];

  Future<String?> buildAddyourqualificationsPopUpCard() {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight8,
                width: SS.sW(context) * .50,
                // height: 375,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Expertise', context),
                      SizedBox(
                        height: SS.sH(context) * .05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              color: ColorPicker.kWhite,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  'What are your areas of expertise ',
                                              style: FontTextStyle
                                                  .kBlueDark114W700SSP),
                                          WidgetSpan(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.help,
                                                size: 15,
                                                color: ColorPicker.kBlueLight1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SS.sB(5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 36,
                                                child: TextField(
                                                  controller: _controller,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_controller.text != '') {
                                                  chipList
                                                      .add(_controller.text);
                                                } else {
                                                  null;
                                                }
                                              });
                                            },
                                            onHover: (value) {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color:
                                                        ColorPicker.kBlueLight2,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: ColorPicker
                                                            .kBlueLight3)),
                                                alignment: Alignment.center,
                                                width: SS.sW(context) * .091,
                                                height: 36,
                                                child: Text(
                                                  'Add to list',
                                                  style: FontTextStyle
                                                      .kBlueLight114W400SSP,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SS.sB(10),
                            Container(
                              width: double.infinity,
                              color: ColorPicker.kGreyLight9,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Wrap(
                                        spacing: 3.0,
                                        runSpacing: 5.0,
                                        children: [
                                          for (var i in chipList)
                                            Chip(
                                              backgroundColor: Colors.white,
                                              elevation: 0.5,
                                              shadowColor: Colors.black,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 5),
                                              shape: RoundedRectangleBorder(),
                                              label: Text(i),
                                              deleteIcon: Icon(
                                                Icons.close,
                                                color: ColorPicker.kBlueLight1,
                                                size: 10,
                                              ),
                                              onDeleted: () {
                                                setState(() {
                                                  chipList.removeAt(
                                                      chipList.indexOf(i));
                                                });
                                              },
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: Text('Cancel')),
                                        SS.sB(0, 10),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Save'))
                                      ],
                                    ),
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
              ),
            );
          });
        });
  }

  ///buildAddyourqualificationsPopUpCard end

  buildAddyourspecialitiesPopUpCard() {}
  int langIndex = 2;

  List langItem = [
    'Native or bilingual profiency1',
    'Native or bilingual profiency2',
    'Native or bilingual profiency3'
  ];

  Future<String?> buildAddyourlanguagesPopUpCards() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
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
                                  padding: const EdgeInsets.all(8.0),
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

  Widget profileListTile(IconData icon, String title, popUp) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            popUp();
          },
          leading: Icon(
            icon,
            color: const Color(0xFF0d9bdc),
          ),
          title: Text(
            title,
            style: FontTextStyle.kBlueLight116W400SSP,
          ),
          trailing: const Card(
            elevation: 1.0,
            margin: EdgeInsets.all(2),
            color: Color(0xff1d2645),
            child: Text(
              '+20%',
              style: TextStyle(
                color: Color(0xFF0d9bdc),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 1,
          color: Color(0xFF1d2645),
        ),
      ],
    );
  }

  Widget buildConnectionsCard(String image) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            color: ColorPicker.kPrimaryLight1,
            child: Column(
              children: [
                Text(
                  '${(value * 100).toInt()}%',
                  style: TextStyle(fontSize: 48, color: ColorPicker.kWhite),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: value,
                      valueColor: AlwaysStoppedAnimation(ColorPicker.kRed2),
                      backgroundColor: ColorPicker.kPrimaryLight,
                      minHeight: 10,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Your profile is only ${(value * 100).toInt()}% complete.Improve it now.Here\'s how',
                      textAlign: TextAlign.center,
                      style: FontTextStyle.kWhite20W400SSP),
                ),
                profileListTile(
                    Icons.add_box_outlined,
                    'Add your work experience',
                    buildAddyourworkexperiencePopUpCard),
                profileListTile(
                    Icons.add_box_outlined,
                    'Add your qualifications',
                    buildAddyourqualificationsPopUpCard),
                profileListTile(Icons.add_box_outlined, 'Add your specialities',
                    buildAddyourspecialitiesPopUpCard),
                profileListTile(Icons.add_box_outlined, 'Add your languages',
                    buildAddyourlanguagesPopUpCards),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SS.sH(context) * .014,
                        horizontal: SS.sW(context) * .085),
                    child: AutoSizeText(
                      'Edit my profile',
                      maxLines: 1,
                      minFontSize: 10,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF32A3FD),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Connections',
                      style: FontTextStyle.kBlueDark120W400SSP),
                ),
                const SizedBox(height: 8),
                Divider(height: 1, color: Colors.grey.shade400),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Wrap(
                    children: [
                      Container(
                        height: 60,
                        width: 120,
                        color: const Color(0xff0D9BDC),
                        child: const Center(
                          child: Text(
                            '250+',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 24),
                          ),
                        ),
                      ),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/842567/pexels-photo-842567.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/716411/pexels-photo-716411.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/1036622/pexels-photo-1036622.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/3727462/pexels-photo-3727462.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/1321943/pexels-photo-1321943.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/3778876/pexels-photo-3778876.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/789822/pexels-photo-789822.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/2897883/pexels-photo-2897883.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      buildConnectionsCard(
                          'https://images.pexels.com/photos/826349/pexels-photo-826349.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'You and Noberto have 25 shared connections.',
                    style: FontTextStyle.kGreyLight514W400SSP,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text('View mutual connections',
                      style: FontTextStyle.kBlueLight114W400SSP),
                ),
                Divider(height: 1, color: Colors.grey.shade400),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFFCCE8FE),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SS.sH(context) * 0.010,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Color(0xFF32A3FD),
                            size: 12,
                          ),
                          SizedBox(
                            width: SS.sW(context) * .01,
                          ),
                          AutoSizeText(
                            'Grow your network',
                            style: TextStyle(
                                color: Color(0xFF32A3FD),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
