import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';

import '../profile-edit/profile-edit.dart';

class ProfileOverviewSec1 extends StatefulWidget {
  final sec1IsEditable;
  final profileOverviewSec1ProSummKey;
  final profileOverviewSec1ProSumm_H;
  final profileOverviewSec1ProSumm_W;
  final profileOverviewSec1AreaOfExpKey;
  final profileOverviewSec1AreaOfExp_H;
  final profileOverviewSec1AreaOfExp_W;
  final profileOverviewSec1ReferencesKey;
  final profileOverviewSec1References_H;
  final profileOverviewSec1References_W;
  final pOApiDataSec1;

  const ProfileOverviewSec1({
    Key? key,
    required this.sec1IsEditable,
    this.profileOverviewSec1ProSummKey,
    this.profileOverviewSec1ProSumm_H,
    this.profileOverviewSec1ProSumm_W,
    this.profileOverviewSec1AreaOfExpKey,
    this.profileOverviewSec1AreaOfExp_H,
    this.profileOverviewSec1AreaOfExp_W,
    this.profileOverviewSec1ReferencesKey,
    this.profileOverviewSec1References_H,
    this.profileOverviewSec1References_W,
    this.pOApiDataSec1,
  }) : super(key: key);

  @override
  State<ProfileOverviewSec1> createState() => _ProfileOverviewSec1State();
}

class _ProfileOverviewSec1State extends State<ProfileOverviewSec1> {
  Widget buildAreaOfExpertiseButton(String btnName) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
      ),
      onPressed: () {},
      icon: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Icon(
          Icons.check_circle,
          color: ColorPicker.kBlueLight1,
          size: 14,
        ),
      ),
      label: Text(
        btnName,
        style: FontTextStyle.kBlueDark114W400SSP,
      ),
    );
  }

  ///references card
  Widget buildReferencesCard(String img, String title, String userId,
      String subTitle, String description) {
    return Container(
      padding: EdgeInsets.all(6),
      color: ColorPicker.kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image(
              width: 45,
              height: 45,
              image: NetworkImage(img),
              fit: BoxFit.cover,
            ),


            title: RichText(
              text: TextSpan(children: [
                TextSpan(text: title, style: FontTextStyle.kBlueDark116W700SSP),
                TextSpan(text: userId, style: FontTextStyle.kBlueDark112W700SSP)
              ]),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Text(subTitle, style: FontTextStyle.kGreyLight514W400SSP),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 30),
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 2),
                        child: Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)),
                          child: const Icon(
                            Icons.format_quote_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style:FontTextStyle.kGreyLight516W400SSP,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon:  Icon(
                    Icons.add,
                    color: ColorPicker.kBlueLight1,
                  ),
                  label:  Text(
                    'Show more',
                    style: FontTextStyle.kBlueLight114W400SSP,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  ///profile section1 pop up functionality Start

  //Profile pop up start

  Future<String?> buildProfileCardPopUp() {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              color: ColorPicker.kGreyLight3,
              width: SS.sW(context) * .50,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PopUpHeadMenu.popUpHead('Profile Summary', context),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          color: ColorPicker.kWhite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Summery',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: ColorPicker.kBlueDark),
                                ),
                              ),
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
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: OutlinedButton(
                                          onPressed: () {},
                                          child: Text('Cancel')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Save')),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  // profile pop up end

  //Area of exper pop up start

  List<String> chipValueList = [];
  String? newValue;

  Future<String?> buildAreaOfExpePopUp(
      List chipValueList, BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: SS.sW(context) * .50,
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Expertise', context),
                      SizedBox(
                        height: SS.sH(context) * .05,
                      ),
                      Container(
                        color: ColorPicker.kWhite,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'What are your areas of expertise?',
                                      style: TextStyle()),
                                  WidgetSpan(
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.question_mark_outlined,
                                            size: 20,
                                            color: Colors.blue,
                                          )))
                                ]),
                              ),
                            ),
                            SB.SH5(),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (text) {
                                        setState(() {
                                          newValue = text;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            chipValueList.add(newValue!);
                                            print(chipValueList);
                                          });
                                        },
                                        child: Text('Add to list')),
                                  ),
                                )
                              ],
                            ),
                            for (var i in chipValueList)
                              Wrap(
                                spacing: 2,
                                alignment: WrapAlignment.start,
                                children: [
                                  Chip(
                                    label: Text(i),
                                    onDeleted: () {
                                      setState(() {
                                        chipValueList.removeAt(i);
                                      });
                                    },
                                  )
                                ],
                              )
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

  //Area of exper pop up end

  ///profile section1 pop up functionality End

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Profile Summary

        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                key: widget.profileOverviewSec1ProSummKey,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 20, top: 13),
                      child: AutoSizeText(
                        'Profile summary',
                        minFontSize: 14,
                        style: FontTextStyle.kBlueDark120W400SSP,
                      ),
                    ),
                    SS.sB(8, 0),
                    const Divider(
                      height: 0.5,
                      color: Color(0xffE5E5E5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 20, top: 13),
                      child: AutoSizeText(
                          widget.pOApiDataSec1.profileSummary.toString(),
                          minFontSize: 8,
                          style: FontTextStyle.kGreyLight516W400SSP),
                    ),
                    SS.sB(13, 0),
                  ],
                ),
              ),
            ),
            widget.sec1IsEditable
                ? ProfileEdit.buildProfileEdit(
                    width: widget.profileOverviewSec1ProSumm_W,
                    height: widget.profileOverviewSec1ProSumm_H,
                    popUpEdit: () {
                      buildProfileCardPopUp();
                    },
                    showAddButton: false)
                : Container(),
          ],
        ),

        SS.sB(8, 0),

        /// Areas of expertise
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                key: widget.profileOverviewSec1AreaOfExpKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SS.sW(context),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 20, left: 20, bottom: 13, top: 13),
                        child: AutoSizeText(
                          'Areas of expertise',
                          style: FontTextStyle.kBlueDark120W400SSP,
                        ),
                      ),
                    ),
                    SS.sB(3, 0),
                    Wrap(
                      spacing: 5,
                      runSpacing: 3,
                      children: [
                        buildAreaOfExpertiseButton('Business management'),
                        buildAreaOfExpertiseButton('Training'),
                        buildAreaOfExpertiseButton('Leadership'),
                        buildAreaOfExpertiseButton('Growth hacking'),
                        buildAreaOfExpertiseButton('Finance'),
                        buildAreaOfExpertiseButton('Acquisitions'),
                        buildAreaOfExpertiseButton('Recruitment'),
                        buildAreaOfExpertiseButton(' Hotel groups'),
                        buildAreaOfExpertiseButton('Consulting'),
                        buildAreaOfExpertiseButton('Public speaking'),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFe5f4fb),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Icon(
                              Icons.add,
                              color: Color(0xFF0D9BDC),
                              size: 16,
                            ),
                          ),
                          label: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text('Show all',
                                style: FontTextStyle.kBlueLight114W400SSP),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            widget.sec1IsEditable
                ? ProfileEdit.buildProfileEdit(
                    width: widget.profileOverviewSec1AreaOfExp_W,
                    height: widget.profileOverviewSec1AreaOfExp_H,
                    popUpEdit: () {
                      buildAreaOfExpePopUp(chipValueList, context);
                    },
                    showAddButton: true)
                : Container(),
          ],
        ),

        SS.sB(10, 0),

        ///References card
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                key: widget.profileOverviewSec1ReferencesKey,
                color: ColorPicker.kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20, left: 20, bottom: 5, top: 13),
                      child: Text(
                        'References',
                        style: FontTextStyle.kBlueDark120W400SSP,
                      ),
                    ),
                    SS.sB(8, 0),
                    const Divider(color: Colors.grey, height: 1),
                    buildReferencesCard(
                      'https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      'Sarah Lee',
                      'MHL',
                      'General Manager, One & Only Hotel',
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    ),

                    const Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    buildReferencesCard(
                      'https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      'Sarah Lee',
                      'MHL',
                      'General Manager, One & Only Hotel',
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    ),
                    //work experience card
                    SS.sB(10, 0)
                  ],
                ),
              ),
            ),
            widget.sec1IsEditable
                ? ProfileEdit.buildProfileEdit(
                    width: widget.profileOverviewSec1References_W,
                    height: widget.profileOverviewSec1References_H,
                    popUpEdit: () {
                      PopUpHeadMenu.buildReferencesCardPopUp(context);
                    },
                    showAddButton: true,
                    popUpAdd: () {
                      PopUpHeadMenu.buildReferencesCardPopUp(context);
                    })
                : Container(),
          ],
        ),
        SS.sB(50, 0)
      ],
    );
  }
}
