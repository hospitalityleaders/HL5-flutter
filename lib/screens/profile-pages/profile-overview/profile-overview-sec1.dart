import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/screens/Authentication/login.dart';
import '../../../controller/auth_controller.dart';
import '../../../models/userProfileModel.dart';
import '../../../services/holedo_api_services.dart';
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
  final token;

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
    this.token,
  }) : super(key: key);

  @override
  State<ProfileOverviewSec1> createState() => _ProfileOverviewSec1State();
}

class _ProfileOverviewSec1State extends State<ProfileOverviewSec1> {
  final ApiServices _apiServices = ApiServices();
  final UserProfileModel profile = UserProfileModel.fromJson(AuthData.data);
  User? user;
  late TextEditingController profileSummaryController;

  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    user = profile.data?.user;
    print('pp: ${user?.profileSummary}');
    profileSummaryController =
        new TextEditingController(text: ' ${user?.profileSummary}');
  }

  Future<void> updateUsers() async {
    setState(() {
      isUpdating = true;
    });
    if (profileSummaryController.text != '') {
      Map<String, dynamic> userData = {
        "id": user?.id,
        "profile_summary": profileSummaryController.text
      };

      print('usser: ${userData}');

      dynamic res = await _apiServices.updateUserProfile(
          accessToken: '${AuthData.token}', profileData: userData);

      if (res?.errors == null) {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${res?.messages}'),
            backgroundColor: Colors.red.shade300,
          ),
        );
      }
    }
    setState(() {
      isUpdating = false;
    });
  }

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
                    style: FontTextStyle.kGreyLight516W400SSP,
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
                  icon: Icon(
                    Icons.add,
                    color: ColorPicker.kBlueLight1,
                  ),
                  label: Text(
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

  ///Profile summary pop up start

  ///api to fetch and update data

  Future<String?> buildProfileCardPopUp(profileSummaryController) {
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
                              'Summary',
                              style: FontTextStyle.kBlueDark114W700SSP,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: profileSummaryController,
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
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: isUpdating
                                      ? CircularProgressIndicator()
                                      : ElevatedButton(
                                          onPressed: updateUsers,
                                          child: Text('Save'),
                                        ),
                                ),
                              ],
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
  }

  /// profile summary pop up end

  ///Area of exper pop up start

  TextEditingController _controller = TextEditingController();

  List chipList = ['Business'];

  Future<String?> buildAreaOfExpePopUp(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                                              setState(
                                                () {
                                                  if (_controller.text != '') {
                                                    chipList
                                                        .add(_controller.text);
                                                  } else {
                                                    null;
                                                  }
                                                },
                                              );
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
                                                setState(
                                                  () {
                                                    chipList.removeAt(
                                                        chipList.indexOf(i));
                                                  },
                                                );
                                              },
                                            ),
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
          },
        );
      },
    );
  }

  ///Area of exper pop up end

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
                      child: Text(
                        'Profile summary',
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
                      buildProfileCardPopUp(profileSummaryController);
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
                      buildAreaOfExpePopUp(context);
                    },
                    showAddButton: true,
                    popUpAdd: () {
                      buildAreaOfExpePopUp(context);
                    })
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
                      ' MHL',
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
                      ' MHL',
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
