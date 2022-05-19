import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/common/clipper.dart';
import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/dropDownButton.dart';
import '../../../constant/colorPicker/color_picker.dart';
import '../../../constant/sizedbox.dart';
import '../profile-edit/profile-edit.dart';
//Header card

class HeaderCard extends StatefulWidget {
  final isEditable;
  final headerCardKey;
  final headerCard_H;
  final headerCard_W;
  final hCardApiData;

  const HeaderCard(
      {Key? key,
      required this.isEditable,
      required this.headerCardKey,
      this.headerCard_H,
      this.headerCard_W,
      this.hCardApiData})
      : super(key: key);

  @override
  _HeaderCardState createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  Widget cardDataLoad(String no, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          no,
          minFontSize: 10,
          style: const TextStyle(
              color: Color(0xFF32A3FD),
              fontSize: 18,
              fontWeight: FontWeight.w400),
          maxLines: 1,
        ),
        const SizedBox(height: 3),
        AutoSizeText(
          name,
          minFontSize: 8,
          style: const TextStyle(
              color: Color(0xFFB5BDC2),
              fontSize: 12,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  ///Contact card pop up functionality Start
  bool isHoveringCard = false;
  bool isHoveringInnerCard = false;

  buildContactCardPopUpInnerCard(
      IconData icon, String title, bool isHoveringInnerCard) {
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
        onHover: (value) {
          setState(() {
            isHoveringCard = value;
          });
        },
        onTap: () {},
        child: Container(
          color: ColorPicker.kWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              color: isHoveringCard
                  ? ColorPicker.kBlueLight2
                  : ColorPicker.kGreyLight9,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: ColorPicker.kBlueLight1,
                  ),
                  title: Text(
                    title,
                    style: FontTextStyle.kBlueLight116W400SSP,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  buildSocialButton(bool isHoveringCard, IconData btnIcon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StatefulBuilder(builder: (context, setState) {
        return InkWell(
          onTap: () {},
          onHover: (value) {
            setState(() {
              isHoveringCard = value;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 38,
            width: 38,
            color:
                isHoveringCard ? ColorPicker.kWhite : ColorPicker.kGreyLight9,
            child: FaIcon(
              btnIcon,
              color: ColorPicker.kBlueLight1,
              size: 12,
            ),
          ),
        );
      }),
    );
  }

  buildInnerSocialButton(bool isHoveringCard, IconData btnIcon, [Uri? url]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StatefulBuilder(
        builder: (context, setState) {
          return InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isHoveringCard = value;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 38,
              width: 38,
              color: isHoveringCard
                  ? ColorPicker.kGreyLight9
                  : ColorPicker.kBlueLight2,
              child: FaIcon(
                btnIcon,
                color: ColorPicker.kBlueLight1,
                size: 12,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<String?> buildContactCardPopUp(
    bool isHoveringCard,
  ) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Container(
              color: ColorPicker.kWhite,
              width: SS.sW(context) * .50,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: NetworkImage(
                                    widget.hCardApiData.avatar.toString()),
                                // fit: BoxFit.cover,
                                height: 85,
                                width: 85,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.hCardApiData.fullName.toString(),
                                style: FontTextStyle.kBlueDark120W400SSP,
                              ),
                              Text(
                                widget.hCardApiData.companyRoleId.toString(),
                                style: FontTextStyle.kGreyLight516W400SSP,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.close,
                                      color: ColorPicker.kBlueLight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 0.5,
                      color: ColorPicker.kGreyLight5,
                    ),
                    SS.sB(20),
                    buildContactCardPopUpInnerCard(Icons.mail,
                        widget.hCardApiData.email.toString(), isHoveringCard),
                    //custom card
                    StatefulBuilder(builder: (context, setState) {
                      return InkWell(
                        onHover: (value) {
                          setState(() {
                            isHoveringCard = value;
                          });
                        },
                        onTap: () {},
                        child: Container(
                          color: ColorPicker.kWhite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Card(
                              color: isHoveringCard
                                  ? ColorPicker.kBlueLight2
                                  : ColorPicker.kGreyLight9,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.mail,
                                    color: ColorPicker.kBlueLight1,
                                  ),
                                  title: Text(
                                    widget.hCardApiData.contactNumber
                                        .toString(),
                                    style: FontTextStyle.kBlueLight116W400SSP,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      buildInnerSocialButton(
                                          isHoveringInnerCard, Icons.call),
                                      buildInnerSocialButton(
                                          isHoveringInnerCard,
                                          FontAwesomeIcons.whatsappSquare),
                                      buildInnerSocialButton(
                                          isHoveringInnerCard,
                                          FontAwesomeIcons.commentSms),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    buildContactCardPopUpInnerCard(FontAwesomeIcons.skype,
                        widget.hCardApiData.skype.toString(), isHoveringCard),
                    buildContactCardPopUpInnerCard(
                        FontAwesomeIcons.link,
                        widget.hCardApiData.holedoUrl.toString(),
                        isHoveringCard),
                    SS.sB(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSocialButton(
                            isHoveringCard, FontAwesomeIcons.facebookSquare),
                        buildSocialButton(
                            isHoveringCard, FontAwesomeIcons.twitterSquare),
                        buildSocialButton(
                            isHoveringCard, FontAwesomeIcons.googlePlusSquare),
                        buildSocialButton(
                            isHoveringCard, FontAwesomeIcons.linkedin),
                        buildSocialButton(
                            isHoveringCard, FontAwesomeIcons.xingSquare),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///Contact card pop up functionality End

  String? valueChoose;
  List listItem = ['item1 ', 'item2'];

  /// Porfile card pop up functionality Start

  bool isPorfileDetailShowCard = true;
  bool isContactDetailShowCard = true;
  List countryNameList = ['Country1', 'Country2', 'Country3'];

  buildFieldName(String fieldName, [String? reqField]) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: '$fieldName ',
              style: FontTextStyle.kBlueDark114W700SSP,
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
            decoration: InputDecoration(
              hintText: hintText,
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

  Future<String?> buildProfileCardPopUp() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Container(
              color: ColorPicker.kGreyLight3,
              width: SS.sW(context) * .50,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PopUpHeadMenu.popUpHead('Profile Card', context),
                    // buildProfilePictureCard()
                    OutlinedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text('Choose File'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: SS.sW(context) * .50,
                        color: ColorPicker.kWhite,
                        child: Column(
                          children: [
                            ListTile(
                                leading: Container(
                                  height: SS.sH(context) * .08,
                                  width: SS.sW(context) * .03,
                                  color: ColorPicker.kBlueLight1,
                                ),
                                title: Text('Profile details'),
                                subtitle: Text(
                                    'Your name, surname, professional title and location.'),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPorfileDetailShowCard =
                                          !isPorfileDetailShowCard;
                                    });
                                  },
                                  icon: isPorfileDetailShowCard
                                      ? Icon(Icons.remove)
                                      : Icon(Icons.add),
                                )),
                            isPorfileDetailShowCard
                                ? Column(
                                    children: [
                                      Divider(
                                        height: SS.sH(context) * 0.01,
                                        color: ColorPicker.kGreyLight3,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            buildFieldName('Name', '*'),
                                            buildTextField('Name'),
                                            buildFieldName('Surname', '*'),
                                            buildTextField('Surname'),
                                            buildFieldName(
                                                'Professional title' '?'),
                                            buildTextField(
                                                'Business development manager, recruiter and hotel specialist'),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    buildFieldName(
                                                        'City / Area  / Region',
                                                        '*'),
                                                    buildTextField()
                                                  ],
                                                )),
                                                SS.sB(0, SS.sW(context) * 0.02),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    buildFieldName(
                                                        'Country', '*'),
                                                    DropDownButton(
                                                      menuList: countryNameList,
                                                      hintText: '',
                                                    )
                                                  ],
                                                )),
                                              ],
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
                                    ],
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        width: SS.sW(context) * .50,
                        color: ColorPicker.kWhite,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                height: SS.sH(context) * .08,
                                width: SS.sW(context) * .03,
                                color: ColorPicker.kBlueLight1,
                              ),
                              title: Text('Contact details'),
                              subtitle: Text(
                                  'Your contact numbers, email address, website link and social profiles.'),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isContactDetailShowCard =
                                        !isContactDetailShowCard;
                                  });
                                },
                                icon: isContactDetailShowCard
                                    ? Icon(Icons.remove)
                                    : Icon(Icons.add),
                              ),
                            ),
                            isContactDetailShowCard
                                ? Column(
                                    children: [
                                      Divider(
                                        height: SS.sH(context) * 0.01,
                                        color: ColorPicker.kGreyLight3,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: ColorPicker
                                                          .kGreyLight5)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Who gets to see my contact details?',
                                                      style: FontTextStyle
                                                          .kGreyLight514W700SSP,
                                                    ),
                                                    Text(
                                                      'Your contact details are not only useful for other connections to contact you, but with your consent, can also be made available to recruiters to inform you of exciting indistry opportunities. You can select which information is seen by who by selecting the privacy setting for each contact detail.',
                                                      style: FontTextStyle
                                                          .kGreyLight514W400SSP,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  /// Porfile card pop up functionality End

  /// buildSendConnReqPopUpCard functionality start

  Future buildSendConnReqPopUpCard() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Container(
                color: ColorPicker.kWhite,
                width: SS.sW(context) * .45,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 16),
                        child: PopUpHeadMenu.popUpHead(
                            'Send conection request', context),
                      ),
                      Divider(
                        color: ColorPicker.kGreyLight4,
                        thickness: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildFieldName('Send to'),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorPicker.kGreyLight8)),
                              child: ListTile(
                                leading: Image.network(
                                  widget.hCardApiData.avatar.toString(),
                                  height: 26,
                                  width: 26,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  widget.hCardApiData.fullName.toString(),
                                  style: FontTextStyle.kGreyLight516W700SSP,
                                ),
                              ),
                            ),
                            SS.sB(20),
                            buildFieldName('Intro message'),
                            Text(
                              'Send a message along with your connection request.',
                              style: FontTextStyle.kGreyLight514W400SSP,
                            ),
                            TextField(
                              autocorrect: true,
                              minLines: 6,
                              maxLines: 8,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                            SS.sB(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: SS.sH(context) * .05,
                                    decoration: BoxDecoration(
                                        color: ColorPicker.kBlueLight1,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Send Request',
                                          style: FontTextStyle.kWhite14W400SSP),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SS.sB(15),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  /// buildSendConnReqPopUpCard functionality End

  /// buildWriteRefPopUPCard functionality Start
  Future buildWriteRefPopUPCard() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          color: ColorPicker.kWhite,
          width: SS.sW(context) * .60,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: PopUpHeadMenu.popUpHead('Write a reference', context),
                ),
                Divider(
                  color: ColorPicker.kGreyLight4,
                  height: .5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: ColorPicker.kWhite,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildFieldName('Reference recipient'),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorPicker.kGreyLight8)),
                                child: ListTile(
                                  leading: Image.network(
                                    widget.hCardApiData.avatar.toString(),
                                    height: 26,
                                    width: 26,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    widget.hCardApiData.fullName.toString(),
                                    style: FontTextStyle.kGreyLight516W700SSP,
                                  ),
                                ),
                              ),
                              SS.sB(20),
                              buildFieldName('Reference'),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'You can edit or delete your reference after submitting it.',
                                    style: FontTextStyle.kGreyLight514W400SSP,
                                  ),
                                ],
                              ),
                              TextField(
                                autocorrect: true,
                                minLines: 6,
                                maxLines: 8,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                              SS.sB(15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: SS.sH(context) * .05,
                                      decoration: BoxDecoration(
                                          color: ColorPicker.kBlueLight1,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Submit Reference',
                                            style:
                                                FontTextStyle.kWhite14W400SSP),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SS.sB(15),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: ColorPicker.kBlueLight1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'REFERENCES',
                                style: FontTextStyle.kWhite13W700SSP,
                              ),
                              SS.sB(10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'What should I include in my reference?',
                                      style: FontTextStyle.kWhite36W400SSP,
                                    ),
                                  ),
                                  Expanded(flex: 1, child: Container())
                                ],
                              ),
                              SS.sB(20),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: ColorPicker.kWhite,
                                        size: 14,
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            ''' Your professional relationship''',
                                        style: FontTextStyle.kWhite16W700SSP)
                                  ],
                                ),
                              ),
                              Text(
                                'Briefly explain the professional relationship or background to give the reference context.',
                                style: FontTextStyle.kWhite16W400SSP,
                              ),
                              SS.sB(15),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: ColorPicker.kWhite,
                                        size: 14,
                                      ),
                                    ),
                                    TextSpan(
                                        text: ''' An endorsement''',
                                        style: FontTextStyle.kWhite16W700SSP),
                                  ],
                                ),
                              ),
                              Text(
                                  '''Explain the reason for your recommendation? What are the person’s skills, attributes and personality traits that you are recommending?''',
                                  style: FontTextStyle.kWhite16W400SSP),
                              SS.sB(35),
                            ],
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
      ),
    );
  }

  /// buildWriteRefPopUPCard functionality End

  /// buildRecommendPopUpCard functionality Start

  Future buildRecommendPopUpCard() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Container(
                color: ColorPicker.kWhite,
                width: SS.sW(context) * .45,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 16),
                        child: PopUpHeadMenu.popUpHead('Send message', context),
                      ),
                      Divider(
                        color: ColorPicker.kGreyLight4,
                        thickness: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildFieldName('Send to'),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorPicker.kGreyLight8)),
                              child: ListTile(
                                leading: Image.network(
                                  widget.hCardApiData.avatar.toString(),
                                  height: 26,
                                  width: 26,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  widget.hCardApiData.fullName.toString(),
                                  style: FontTextStyle.kGreyLight516W700SSP,
                                ),
                              ),
                            ),
                            SS.sB(20),
                            buildFieldName('Message'),
                            TextField(
                              autocorrect: true,
                              minLines: 6,
                              maxLines: 8,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                            SS.sB(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: SS.sH(context) * .05,
                                    decoration: BoxDecoration(
                                        color: ColorPicker.kBlueLight1,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Send Request',
                                          style: FontTextStyle.kWhite14W400SSP),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SS.sB(15),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  /// buildRecommendPopUpCard functionality End

  bool isHovering = false;
  bool isVisible = false;
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: SS.sW(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            widget.hCardApiData.banner.toString(),
          ),
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Responsive.isDesktop(context)
              ? Padding(
                  padding: EdgeInsets.only(
                    top: SS.sH(context) * .18,
                    bottom: SS.sH(context) * .18,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        key: widget.headerCardKey,
                        width: SS.sW(context) * .4,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton.icon(
                                    style: const ButtonStyle(),
                                    onPressed: () {
                                      buildContactCardPopUp(
                                        isHoveringCard,
                                      );
                                    },
                                    label: const Text(
                                      'contact card',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    icon: const Icon(
                                      Icons.contact_phone_outlined,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    onHover: (value) {
                                      setState(() {
                                        isHovering = value;
                                      });
                                    },
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: SS.sH(context) * 0.050,
                                      width: SS.sW(context) * 0.032,
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.menu_outlined,
                                            color: ColorPicker.kGreyLight3,
                                            size: 18,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: ColorPicker.kGreyLight3,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                widget.hCardApiData.fullName.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: ColorPicker.kBlueDark1,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: AutoSizeText(
                                'Business development manager,recruiter and hotel specialist',
                                maxLines: 2,
                                minFontSize: 12,
                                style: TextStyle(
                                    color: Color(0xFF7C8990), fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Color(
                                            0xFF8f9ea6,
                                          ),
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: widget.hCardApiData.address1
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff7C8990)))
                                  ],
                                  style: const TextStyle(
                                    color: Color(0xFF8f9ea6),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                buildSendConnReqPopUpCard();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                // height: SS.sH(context) * .06,
                                // width: SS.sW(context) * .21,
                                height: 52,
                                width: 285,
                                decoration: BoxDecoration(
                                    color: ColorPicker.kBlueLight1,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_add,
                                        color: ColorPicker.kWhite,
                                        size: 12,
                                      ),
                                      SS.sB(0, 6.5),
                                      Text(
                                        'SEND CONNECTION REQUEST',
                                        style: FontTextStyle.kWhite14W400SSP,
                                      ),
                                    ]),
                              ),
                            ),
                            SB.SH5(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {
                                    buildWriteRefPopUPCard();
                                  },
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Write reference',
                                      minFontSize: 10,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFF32A3FD)),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.done_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {
                                    buildRecommendPopUpCard();
                                  },
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Recommend',
                                      maxLines: 1,
                                      minFontSize: 10,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF32A3FD),
                                      ),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey.shade300,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  cardDataLoad('250+', 'CONNECTIONS'),
                                  cardDataLoad('14k', 'LEADER POINTS'),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(widget
                                        .hCardApiData.avatarCdn
                                        .toString()),
                                    // backgroundImage: NetworkImage(
                                    //     'https://cdn.pixabay.com/photo/2012/11/26/15/07/earth-67359__340.jpg'),
                                  ),
                                  cardDataLoad('3', 'REFERENCES'),
                                  cardDataLoad('312', 'RECOMMENDATIONS')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: SS.sH(context) * .22,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: SS.sW(context),
                        key: widget.headerCardKey,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Noberto Holden',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Color(0xFF272E41),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Card(
                              child: Text('AHL'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: AutoSizeText(
                                'Business development manager,recruiter and hotel specialist',
                                maxLines: 2,
                                minFontSize: 12,
                                style: TextStyle(
                                    color: Color(0xFF7C8990), fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Color(
                                            0xFF8f9ea6,
                                          ),
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    const TextSpan(
                                        text: 'Cape Town, South Africa',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff7C8990)))
                                  ],
                                  style: const TextStyle(
                                    color: Color(0xFF8f9ea6),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton.icon(
                                    style: const ButtonStyle(),
                                    onPressed: () {
                                      buildContactCardPopUp(isHoveringCard);
                                    },
                                    label: const Text(
                                      'contact card',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    icon: const Icon(
                                      Icons.contact_phone_outlined,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    value: valueChoose,
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueChoose = newValue as String;
                                      });
                                    },
                                    items: listItem.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.person_add),
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 18),
                                  child: AutoSizeText(
                                    'SEND CONNECTION REQUEST',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF0d9bdc),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Write reference',
                                      minFontSize: 10,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFF32A3FD)),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.done_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Recommend',
                                      maxLines: 1,
                                      minFontSize: 10,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF32A3FD),
                                      ),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2012/11/26/15/07/earth-67359__340.jpg'),
                            ),
                            Divider(
                              height: 3,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  cardDataLoad('250+', 'CONNECTIONS'),
                                  cardDataLoad('14k', 'LEADER POINTS'),
                                  cardDataLoad('3', 'REFERENCES'),
                                  cardDataLoad('312', 'RECOMMENDATIONS')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          Positioned(
            top: SS.sH(context) * 0.14,
            child: Center(
              child: Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image:
                          NetworkImage(widget.hCardApiData.avatar.toString()),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),

          isVisible
              ? Column(
                  children: [
                    SS.sB(SS.sH(context) * .26),
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
                      alignment: Alignment(.25, 0),
                      child: Container(
                        width: 244,
                        decoration: BoxDecoration(
                          color: ColorPicker.kWhite,
                          border: Border.all(
                              width: 0.5, color: ColorPicker.kGreyLight7),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 38,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.contact_phone_outlined,
                                      color: ColorPicker.kBlueLight1,
                                      size: 12,
                                    ),
                                    SS.sB(0, 6),
                                    Text(
                                      'Share profile via email',
                                      style: FontTextStyle.kBlueLight114W400SSP,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: .5,
                              color: ColorPicker.kGreyLight5,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Container(
                                height: 38,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.5, vertical: 9),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.close,
                                        color: ColorPicker.kBlueLight1,
                                        size: 12,
                                      ),
                                      SS.sB(0, 8.5),
                                      Text('Cancel connection',
                                          style: FontTextStyle
                                              .kBlueLight114W400SSP),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Container(),

          widget.isEditable
              ? Padding(
                  padding: EdgeInsets.only(
                    top: SS.sH(context) * .18,
                    bottom: SS.sH(context) * .16,
                  ),
                  child: ProfileEdit.buildProfileEdit(
                      width: widget.headerCard_W,
                      height: widget.headerCard_H,
                      popUpEdit: () {
                        buildProfileCardPopUp();
                      },
                      showAddButton: false),
                )
              : Container(),
          // Responsive.isDesktop(context)
          //     ? Positioned(
          //         top: 0,
          //         child: Header(),
          //       )
          //     : Container()
        ],
      ),
    );
  }
}
