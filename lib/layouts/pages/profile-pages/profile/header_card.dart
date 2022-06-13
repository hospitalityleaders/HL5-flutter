import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/common/clipper.dart';
import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common/dropDownButton.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/sizedbox.dart';
import '../../../../services/holedo_api_services.dart';
import '../profile-edit/profile_edit.dart';
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
  ///common field

  Widget buildFieldName(String fieldName, [String? reqField]) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: '$fieldName',
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

  Widget buildTextField(
      [String? hintText, TextEditingController? _controller]) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: ColorPicker.kGreyLight9, width: 1),
            ),
          ),
        ),
        SS.sB(18),
      ],
    );
  }

  /// API to fetch and update data functionality Start

  final ApiServices _apiServices = ApiServices();
  bool isUpdating = false;

  Future<void> updateProfileCard(
      dynamic id,
      String fNameController,
      String lNameController,
      String professionalTitleController,
      String areaController) async {
    setState(() {
      isUpdating = true;
    });

    if (fNameController.toString() != '' &&
        fNameController.toString() != null &&
        lNameController.toString() != '' &&
        lNameController.toString() != null) {
      Map<String, dynamic> profileData = {
        "id": id,
        "first_name": fNameController,
        "last_name": lNameController,
        "professional_title": professionalTitleController,
        "area": areaController
      };
      print('usser profile: ${profileData}');
      dynamic res = await _apiServices.updateUserProfile();

      if (res?.success as bool) {
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

  /// API to fetch and update data functionality End

  /// Porfile card pop up functionality Start

  bool isPorfileDetailShowCard = true;
  bool isContactDetailShowCard = true;
  List countryNameList = ['Country1', 'Country2', 'Country3'];

  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final _pickedFile = await picker.pickImage(source: source);

    if (_pickedFile != null) {
      setState(() {
        image = XFile(_pickedFile.path);
      });
    }
  }

  Future buildProfileCardPopUp(
      {required dynamic id,
        required String fName,
        required String lName,
        required String professionalTitle,
        required String area}) {
    TextEditingController _fNameController = TextEditingController(text: fName);
    TextEditingController _lNameController = TextEditingController(text: lName);
    TextEditingController _professionalTitleController =
    TextEditingController(text: professionalTitle);
    TextEditingController _areaController = TextEditingController(text: area);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
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
                    PopUpHeadMenu.popUpHead('Profile Card', context),
                    // buildProfilePictureCard()
                    SS.sB(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 16),
                      child: Container(
                        width: Responsive.isDesktop(context)
                            ? SS.sW(context) * .50 as double
                            : Responsive.isMobile(context)
                            ? SS.sW(context) * .90 as double
                            : SS.sW(context) * .60 as double,
                        color: ColorPicker.kWhite,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                color: ColorPicker.kBlueLight1,
                                child: Icon(
                                  Icons.photo_camera,
                                  color: ColorPicker.kWhite,
                                  size: 18,
                                ),
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
                                    ? Icon(
                                  Icons.remove,
                                  size: 10,
                                  color: ColorPicker.kBlueLight1,
                                )
                                    : Icon(
                                  Icons.add,
                                  size: 10,
                                  color: ColorPicker.kBlueLight1,
                                ),
                              ),
                            ),
                            Divider(
                              height: SS.sH(context) * 0.01 as double,
                              color: ColorPicker.kGreyLight3,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Responsive.isDesktop(context)
                                    ? Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          image != null
                                              ? (Image.network(
                                            image!.path,
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ))
                                              : Image(
                                            image: NetworkImage(
                                                widget.hCardApiData
                                                    .avatar
                                                    .toString()),
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              color: ColorPicker.kRed2,
                                              size: 15,
                                            ),
                                            label: Text(
                                              'Delete Photo',
                                              style: FontTextStyle
                                                  .kRed214W400SSP,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            color:
                                            ColorPicker.kGreyLight9,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 10,
                                                  horizontal: 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        OutlinedButton(
                                                          onPressed: () {
                                                            _pickImage(
                                                                ImageSource
                                                                    .gallery);
                                                          },
                                                          child: Text(
                                                            'Choose Pic',
                                                            style: FontTextStyle
                                                                .kBlueDark114W400SSP,
                                                          ),
                                                        ),
                                                        SS.sB(0, 10),
                                                        image != null
                                                            ? Text(image!
                                                            .name
                                                            .toString())
                                                            : Text(
                                                          'No file choosen',
                                                          style: FontTextStyle
                                                              .kGreyLight514W400SSP,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                            'Upload')),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SS.sB(15),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '''Upload an image from your computer in either JPG, GIF or PNG format. Maximum file size can not exceed 3MB. Make sure you look good on Hospitality Leaders? Upload a photo that's at least 150px in width and height. ''',
                                                  style: FontTextStyle
                                                      .kGreyLight514W400SSP),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                                    : Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    image != null
                                        ? (Image.network(
                                      image!.path,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ))
                                        : Image(
                                      image: NetworkImage(widget
                                          .hCardApiData.avatar
                                          .toString()),
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    SS.sB(5),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: ColorPicker.kRed2,
                                        size: 15,
                                      ),
                                      label: Text(
                                        'Delete Photo',
                                        style:
                                        FontTextStyle.kRed214W400SSP,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.4,
                                            color:
                                            ColorPicker.kGreyLight8),
                                        borderRadius:
                                        BorderRadius.circular(4),
                                        color: ColorPicker.kGreyLight9,
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                OutlinedButton(
                                                  onPressed: () {
                                                    _pickImage(ImageSource
                                                        .gallery);
                                                  },
                                                  child: Text(
                                                    'Choose Pic',
                                                    style: FontTextStyle
                                                        .kBlueDark114W400SSP,
                                                  ),
                                                ),
                                                SS.sB(0, 10),
                                                image != null
                                                    ? Text(image!.name
                                                    .toString())
                                                    : Text(
                                                  'No file choosen',
                                                  style: FontTextStyle
                                                      .kGreyLight514W400SSP,
                                                ),
                                              ],
                                            ),
                                            SS.sB(5),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color: ColorPicker
                                                          .kBlueLight1,
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          4)),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          'Upload',
                                                          style: FontTextStyle
                                                              .kWhite14W400SSP,
                                                          textAlign:
                                                          TextAlign
                                                              .center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '''Upload an image from your computer in either JPG, GIF or PNG format. Maximum file size can not exceed 3MB. Make sure you look good on Hospitality Leaders? Upload a photo that's at least 150px in width and height. ''',
                                          style: FontTextStyle
                                              .kGreyLight514W400SSP),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 16),
                      child: Container(
                        width: Responsive.isDesktop(context)
                            ? SS.sW(context) * .50 as double
                            : Responsive.isMobile(context)
                            ? SS.sW(context) * .90 as double
                            : SS.sW(context) * .60 as double,
                        color: ColorPicker.kWhite,
                        child: Column(
                          children: [
                            ListTile(
                                leading: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  color: ColorPicker.kBlueLight1,
                                  child: Icon(
                                    Icons.photo_camera,
                                    color: ColorPicker.kWhite,
                                    size: 18,
                                  ),
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
                                      ? Icon(
                                    Icons.remove,
                                    size: 10,
                                    color: ColorPicker.kBlueLight1,
                                  )
                                      : Icon(
                                    Icons.add,
                                    size: 10,
                                    color: ColorPicker.kBlueLight1,
                                  ),
                                )),
                            isPorfileDetailShowCard
                                ? Column(
                              children: [
                                Divider(
                                  height: SS.sH(context) * 0.01 as double,
                                  color: ColorPicker.kGreyLight3,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      buildFieldName('Name', '*'),
                                      buildTextField(
                                          'Name', _fNameController),
                                      buildFieldName('Surname', '*'),
                                      buildTextField(
                                          'Surname', _lNameController),
                                      buildFieldName(
                                          'Professional title' '?'),
                                      buildTextField(
                                          'Business development manager, recruiter and hotel specialist',
                                          _professionalTitleController),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                buildFieldName(
                                                    'City / Area  / Region',
                                                    '*'),
                                                buildTextField(
                                                    '', _areaController)
                                              ],
                                            ),
                                          ),
                                          SS.sB(
                                              0,
                                              SS.sW(context) * 0.02
                                              as double),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                buildFieldName(
                                                    'Country', '*'),
                                                DropDownButton(
                                                  menuList:
                                                  countryNameList,
                                                  hintText: '',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel')),
                                          SS.sB(0, 10),
                                          isUpdating
                                              ? CircularProgressIndicator()
                                              : ElevatedButton(
                                              onPressed: () {
                                                updateProfileCard(
                                                    id,
                                                    _fNameController
                                                        .text,
                                                    _lNameController
                                                        .text,
                                                    _professionalTitleController
                                                        .text,
                                                    _areaController
                                                        .text);
                                              },
                                              child: Text('Save'))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      child: Container(
                        width: Responsive.isDesktop(context)
                            ? SS.sW(context) * .50 as double
                            : Responsive.isMobile(context)
                            ? SS.sW(context) * .90 as double
                            : SS.sW(context) * .60 as double,
                        color: ColorPicker.kWhite,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                color: ColorPicker.kBlueLight1,
                                child: Icon(
                                  Icons.photo_camera,
                                  color: ColorPicker.kWhite,
                                  size: 18,
                                ),
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
                                    ? Icon(
                                  Icons.remove,
                                  size: 10,
                                  color: ColorPicker.kBlueLight1,
                                )
                                    : Icon(
                                  Icons.add,
                                  size: 10,
                                  color: ColorPicker.kBlueLight1,
                                ),
                              ),
                            ),
                            isContactDetailShowCard
                                ? Column(
                              children: [
                                Divider(
                                  height: SS.sH(context) * 0.01 as double,
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
                    SS.sB(15)
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

  Widget cardDataLoad(String no, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          no,
          minFontSize: 10,
          style: FontTextStyle.kBlueLight120W400SSP,
          maxLines: 1,
        ),
        SS.sB(3),
        AutoSizeText(
          name,
          minFontSize: 8,
          style: FontTextStyle.kGreyLight612W700SSP,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  ///Contact card pop up functionality Start
  bool isHoveringCard = false;
  bool isHoveringInnerCard = false;

  Widget buildContactCardPopUpInnerCard(
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

  Widget buildSocialButton(bool isHoveringCard, IconData btnIcon) {
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

  Widget buildInnerSocialButton(bool isHoveringCard, IconData btnIcon,
      [Uri? url]) {
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

  Future<String?> buildContactCardPopUp(bool isHoveringCard) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Container(
              color: ColorPicker.kWhite,
              width: Responsive.isDesktop(context)
                  ? SS.sW(context) * .50 as double
                  : Responsive.isMobile(context)
                  ? SS.sW(context) * .90 as double
                  : SS.sW(context) * .65 as double,
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
                            isHoveringCard = (value as bool);
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

  /// buildSendConnReqPopUpCard functionality start
  Future buildSendConnReqPopUpCard() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          color: ColorPicker.kWhite,
          width: Responsive.isDesktop(context)
              ? SS.sW(context) * .45 as double
              : Responsive.isMobile(context)
              ? SS.sW(context) * .90 as double
              : SS.sW(context) * .60 as double,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                            border: Border.all(color: ColorPicker.kGreyLight8)),
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
                              height: SS.sH(context) * .05 as double,
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
      ),
    );
  }

  /// buildSendConnReqPopUpCard functionality End

  /// buildWriteRefPopUPCard functionality Start
  Future buildWriteRefPopUPCard() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          color: ColorPicker.kWhite,
          width: SS.sW(context) * .60 as double,
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
                                      height: SS.sH(context) * .05 as double,
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
          width: Responsive.isDesktop(context)
              ? SS.sW(context) * .45 as double
              : Responsive.isMobile(context)
              ? SS.sW(context) * .90 as double
              : SS.sW(context) * .60 as double,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                            border: Border.all(color: ColorPicker.kGreyLight8)),
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
                              height: SS.sH(context) * .05 as double,
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
      ),
    );
  }

  /// buildRecommendPopUpCard functionality End

  ///buildBannerImagePopUpCard Functionality Start

  Future buildBannerImagePopUpCard() {
    return showDialog(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                color: ColorPicker.kGreyLight3,
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .45 as double
                    : Responsive.isMobile(context)
                    ? SS.sW(context) * .90 as double
                    : SS.sW(context) * .60 as double,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Cover image', context),
                      SS.sB(15),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? SS.sW(context) * .50 as double
                              : Responsive.isMobile(context)
                              ? SS.sW(context) * .90 as double
                              : SS.sW(context) * .60 as double,
                          color: ColorPicker.kWhite,
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
                                    Icons.photo_camera,
                                    color: ColorPicker.kWhite,
                                    size: 18,
                                  ),
                                ),
                                title: Text('Cover image'),
                                subtitle: Text(
                                    'Your cover image will be used on your profile.'),
                              ),
                              Image(
                                image: NetworkImage(
                                  widget.hCardApiData.banner.toString(),
                                ),
                                fit: BoxFit.cover,
                                height: 235,
                              ),
                              SS.sB(20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                child: Container(
                                  color: ColorPicker.kGreyLight8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Row(
                                            children: [
                                              OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                    ColorPicker.kWhite),
                                                onPressed: () {
                                                  _pickImage(ImageSource.gallery);
                                                },
                                                child: Text(
                                                  'Choose file',
                                                  style: FontTextStyle
                                                      .kBlueDark114W400SSP,
                                                ),
                                              ),
                                              SS.sB(0, 10),
                                              Text(
                                                'No file choosen',
                                                style: FontTextStyle
                                                    .kGreyLight514W400SSP,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {});
                                              },
                                              child: Text('Upload')),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  '''Upload an image from your computer in either JPG, GIF or PNG format. Maximum file size can not exceed 8MB. Make sure your cover image looks good on Hospitality Leaders? Upload a photo that's at least 1280px in width and 640 in height.''',
                                  style: FontTextStyle.kGreyLight514W400SSP,
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 22.5, bottom: 20),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: ColorPicker.kRed2,
                                    size: 15,
                                  ),
                                  label: Text(
                                    'Delete Photo',
                                    style: FontTextStyle.kRed214W400SSP,
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
          }),
    );
  }

  /// buildBannerImagePopUpCard Functionality End

  bool isHovering = false;
  bool isVisible = false;
  bool isShowing = false;
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final headerCardData = widget.hCardApiData;
    return Container(
      key: key,
      width: SS.sW(context) as double,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            headerCardData.banner.toString(),
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
              top: SS.sH(context) * .18 as double,
              bottom: SS.sH(context) * .18 as double,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  key: widget.headerCardKey as Key,
                  width: SS.sW(context) * .4 as double,
                  color: ColorPicker.kWhite,
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
                              label: Text(
                                'contact card',
                                style: FontTextStyle.kGreyLight514W400SSP,
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
                                height: SS.sH(context) * 0.050 as double,
                                width: SS.sW(context) * 0.033 as double,
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
                          headerCardData.fullName.toString(),
                          textAlign: TextAlign.center,
                          style: FontTextStyle.kBlueDark140W400SSP,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Business development manager,recruiter and hotel specialist',
                          style: FontTextStyle.kGreyLight516W400SSP,
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
                                  text: headerCardData.area.toString(),
                                  style:
                                  FontTextStyle.kGreyLight514W400SSP)
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
                          SS.sB(0, 2),
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
                      SS.sB(30),
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
              top: SS.sH(context) * .18 as double,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: SS.sW(context) as double,
                  key: widget.headerCardKey as Key,
                  color: ColorPicker.kWhite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SS.sB(29),
                        Text(
                          widget.hCardApiData.fullName.toString(),
                          textAlign: TextAlign.center,
                          style: FontTextStyle.kBlueDark136W400SSP,
                        ),
                        SS.sB(5),
                        Card(
                          child: Text(
                            widget.hCardApiData.userTitleTypesId
                                .toString(),
                            style: FontTextStyle.kGreyLight514W400SSP,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Business development manager,recruiter and hotel specialist',
                            style: FontTextStyle.kGreyLight516W400SSP,
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
                                    child: Icon(
                                      Icons.location_on,
                                      color: ColorPicker.kGreyLight5,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                    text: headerCardData.area.toString(),
                                    style: FontTextStyle
                                        .kGreyLight514W400SSP)
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  buildContactCardPopUp(isHoveringCard);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color:
                                          ColorPicker.kGreyLight9)),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(1.0),
                                            child: Icon(
                                              Icons
                                                  .contact_phone_outlined,
                                              color: Colors.grey,
                                              size: 14,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                            text: ' contact card ',
                                            style: FontTextStyle
                                                .kGreyLight514W400SSP),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isShowing = !isShowing;
                                      print(isShowing);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color:
                                            ColorPicker.kGreyLight9)),
                                    height: 30,
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
                                )),
                          ],
                        ),
                        Visibility(
                          visible: isShowing,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  color: ColorPicker.kBlueLight2,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      SS.sB(0, 15),
                                      Icon(
                                        Icons.contact_phone_outlined,
                                        color: ColorPicker.kBlueLight1,
                                        size: 12,
                                      ),
                                      SS.sB(0, 6),
                                      Text(
                                        'Share profile via email',
                                        style: FontTextStyle
                                            .kBlueLight114W400SSP,
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isShowing = !isShowing;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        SS.sB(0, 17.5),
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              buildSendConnReqPopUpCard();
                            },
                            icon: const Icon(
                              Icons.person_add,
                              size: 10,
                              color: ColorPicker.kWhite,
                            ),
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
                                backgroundColor:
                                MaterialStateProperty.all(
                                  const Color(0xFFe5f4fb),
                                ),
                              ),
                              onPressed: () {
                                buildWriteRefPopUPCard();
                              },
                              label: const Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 10),
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
                            SS.sB(0, 2),
                            OutlinedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                  const Color(0xFFe5f4fb),
                                ),
                              ),
                              onPressed: () {
                                buildRecommendPopUpCard();
                              },
                              label: const Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 10),
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
                        SS.sB(30),
                        CircleAvatar(
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
          ),
          Responsive.isDesktop(context)
              ? Positioned(
            top: SS.sH(context) * 0.15 as double,
            child: Center(
              child: Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.hCardApiData.avatar.toString()),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          )
              : Positioned(
            top: SS.sH(context) * 0.13 as double,
            child: Center(
              child: Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.hCardApiData.avatar.toString()),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          isVisible
              ? Column(
            children: [
              SS.sB(SS.sH(context) * .26 as double),
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
          widget.isEditable as bool
              ? Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                buildBannerImagePopUpCard();
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: ColorPicker.kBlueLight1,
                child: Icon(
                  Icons.camera_alt,
                  color: ColorPicker.kWhite,
                  size: 25,
                ),
              ),
            ),
          )
              : Container(),
          widget.isEditable as bool
              ? Padding(
            padding: EdgeInsets.only(
              top: SS.sH(context) * .18 as double,
              bottom: Responsive.isDesktop(context)
                  ? SS.sH(context) * .16 as double
                  : 0 as double,
            ),
            child: ProfileEdit.buildProfileEdit(
                width: widget.headerCard_W as double,
                height: widget.headerCard_H as double,
                popUpEdit: () {
                  buildProfileCardPopUp(
                      id: headerCardData.id,
                      fName: headerCardData.firstName.toString(),
                      lName: headerCardData.lastName.toString(),
                      professionalTitle:
                      headerCardData.professionalTitle.toString(),
                      area: headerCardData.area.toString());
                },
                showAddButton: false),
          )
              : Container(),
        ],
      ),
    );
  }
}
