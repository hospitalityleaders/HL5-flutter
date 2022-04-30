import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  // _launchUrl(url) async {
  //   if (!await launchUrl(url)) throw 'Could not launch $url';
  // }

  final Uri url = Uri.parse('https://flutter.dev');

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
                color: isHoveringCard
                    ? ColorPicker.kWhite
                    : ColorPicker.kGreyLight9,
                child: FaIcon(
                  btnIcon,
                  color: ColorPicker.kBlueLight1,
                  size: 12,
                ),
              ));
        }));
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
              decoration: BoxDecoration(borderRadius: BorderRadius.zero),
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
                                    ))
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
                                                padding: const EdgeInsets.all(12.0),
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
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
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

  /// Porfile card pop up functionality End

  // String profilePicCardDes =
  //     ' Upload an image from your computer in either JPG, GIF or PNG format. Maximum file size can not exceed 3MB. Make sure you look good on Hospitality Leaders? Upload a photo that\'s at least 150px in width and height.';

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  // buildProfilePictureCard() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Container(
  //       width: 200,
  //       color: Colors.white,
  //       child: Column(
  //         children: [
  //           // Row(
  //           //   children: [
  //           //     Padding(
  //           //       padding: const EdgeInsets.all(8.0),
  //           //       child: Container(
  //           //         height: 50,
  //           //         width: 50,
  //           //         color: const Color(0xFF0d9bdc),
  //           //         child: const Center(
  //           //           child: Icon(
  //           //             Icons.camera_alt,
  //           //             color: Colors.white,
  //           //           ),
  //           //         ),
  //           //       ),
  //           //     ),
  //           //     Column(
  //           //       crossAxisAlignment: CrossAxisAlignment.start,
  //           //       children: const [
  //           //         Text(
  //           //           'Profile picture',
  //           //           style: TextStyle(
  //           //               fontWeight: FontWeight.w400, fontSize: 16),
  //           //         ),
  //           //         Text(
  //           //             'Your profile picture will be used on your profile and throughout the site.',
  //           //             style: TextStyle(
  //           //                 fontWeight: FontWeight.w400,
  //           //                 fontSize: 12,
  //           //                 color: Color(0xffbdb5c2)))
  //           //       ],
  //           //     )
  //           //   ],
  //           // ),
  //           // const Padding(
  //           //   padding: EdgeInsets.all(8.0),
  //           //   child: Divider(
  //           //     height: 1,
  //           //     color: Colors.grey,
  //           //   ),
  //           // ),
  //           Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         height: 150,
  //                         width: 150,
  //                         decoration: const BoxDecoration(
  //                           image: DecorationImage(
  //                               image: NetworkImage(
  //                                   'https://cdn.pixabay.com/photo/2019/10/20/20/02/nature-4564618_960_720.jpg'),
  //                               fit: BoxFit.cover),
  //                         ),
  //                       ),
  //                       TextButton.icon(
  //                         onPressed: () {},
  //                         icon: Icon(Icons.delete),
  //                         label: Text('Delete photo'),
  //                       )
  //                     ]),
  //               ),
  //               Column(
  //                 children: [
  //                   Card(
  //                     color: Colors.grey,
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(16.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           OutlinedButton(
  //                             onPressed: () {
  //                               pickImage();
  //                             },
  //                             child: Text('Choose File'),
  //                           ),
  //                           Text('No file choosen'),
  //                           ElevatedButton(
  //                               onPressed: () {}, child: Text('Upload'))
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     width: double.infinity,
  //                     child: Text(profilePicCardDes),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  bool isHovering = false;

  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Container(
      key: key,
      width: _width,
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
                    top: _height * .18,
                    bottom: _height * .18,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        key: widget.headerCardKey,
                        width: 550,
                        // height: _height,
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
                                    child: StatefulBuilder(
                                        builder: (context, setState) {
                                      return InkWell(
                                        onTap: () {},
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
                                                      width: 1,
                                                      color: Colors.grey)
                                                  : Border.all(
                                                      width: 0,
                                                      color:
                                                          Colors.transparent)),
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
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    })),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.person_add),
                                label: Padding(
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
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        'https://cdn.pixabay.com/photo/2012/11/26/15/07/earth-67359__340.jpg'),
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
                    top: _height * .22,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: _width,
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
            top: _height * 0.14,
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
          widget.isEditable
              ? Padding(
                  padding: EdgeInsets.only(
                    top: _height * .18,
                    bottom: _height * .16,
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
