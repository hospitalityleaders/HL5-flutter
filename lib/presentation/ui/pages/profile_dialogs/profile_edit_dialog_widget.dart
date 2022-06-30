import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileEditDialogWidget extends StatefulWidget {
  const ProfileEditDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileEditDialogWidget> createState() =>
      _ProfileEditDialogWidgetState();
}

class _ProfileEditDialogWidgetState extends State<ProfileEditDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Container(
        color: Cr.darkGrey4,
        width: 655,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogTitleWidget(
              title: "My Profile",
            ),
            Di.SBHL,
            _ProfilePictureDialogExpandedTile(isExpanded: true),
            Di.SBHS,
            ProfileDetailsExpandedTile(isExpanded: true),
            Di.SBHS,
            ContactDetailsExpandedTile(isExpanded: true),
            Di.SBHD,
          ],
        ),
      ),
    );
  }
}

class ContactDetailsExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const ContactDetailsExpandedTile({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<ContactDetailsExpandedTile> createState() =>
      _ContactDetailsExpandedTileState();
}

class _ContactDetailsExpandedTileState
    extends State<ContactDetailsExpandedTile> {
  String? selectedValue;
  bool currentlyWorkHere = false;

  late ExpandedTileController expandedTileController;
  @override
  void initState() {
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    super.initState();
  }

  @override
  void dispose() {
    expandedTileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 645,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact details',
              style: h4Bold,
            ),
            Text(
              "Your contact numbers, email address, website link and social profiles.",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            expandedTileController = expandedTileController.copyWith(
              isExpanded: !expandedTileController.isExpanded,
            );
          });
        },
        leading: Container(
          width: 50,
          height: 50,
          color: Cr.accentBlue1,
          child: Center(
            child: Icon(
              Icons.camera_alt,
              size: 22,
              color: Cr.whiteColor,
            ),
          ),
        ),
        trailingRotation: 0,
        trailing: !(expandedTileController.isExpanded == false)
            ? null
            : CustomMinusIcon(),
        theme: ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: Di.PSL),
          color: Cr.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 575,
                    padding: EdgeInsets.all(Di.PSL),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Cr.darkGrey4,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Who gets to see my contact details? Who gets to see my contact details?",
                          style: h5Bold.copyWith(
                            color: Cr.darkGrey1,
                          ),
                        ),
                        Text(
                          "Your contact details are not only useful for other connections to contact you, but with your consent, can also be made available to recruiters to inform you of exciting indistry opportunities. You can select which information is seen by who by selecting the privacy setting for each contact detail.",
                          style: bodySmallRegular.copyWith(
                            color: Cr.darkGrey1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Di.SBCH(18),
                  DialogLabelTextFormField(
                    customLabel: "Contact number",
                    icon: HelpIconDialog(),
                  ),
                  Text(
                    "This is for data report purposes only and will always be anonymously displayed",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  ),
                  Di.SBHES,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DialogDropDownTextField(
                        width: 122,
                        hintText: 'Mobile',
                        dataList: [
                          "Mobile",
                          "Telephone",
                        ],
                      ),
                      SizedBox(
                        width: 285,
                        child: DialogTextFieldForm(
                          hintText: "123456789",
                        ),
                      ),
                      PrivacyDropDown(),
                    ],
                  ),
                  Di.SBCH(7),
                  Row(
                    children: [
                      CheckboxDialog(
                        onChanged: (value) {
                          setState(() {
                            currentlyWorkHere = !currentlyWorkHere;
                          });
                        },
                        value: currentlyWorkHere,
                      ),
                      Text(
                        "I am contactable via whatsapp",
                        style: bodySmallRegular.copyWith(
                          color: Cr.darkGrey1,
                        ),
                      ),
                      Di.SBCW(24),
                      CheckboxDialog(
                        onChanged: (value) {
                          setState(() {
                            currentlyWorkHere = !currentlyWorkHere;
                          });
                        },
                        value: currentlyWorkHere,
                      ),
                      Text(
                        "I am contactable via sms",
                        style: bodySmallRegular.copyWith(
                          color: Cr.darkGrey1,
                        ),
                      )
                    ],
                  ),
                  Di.SBCH(8),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Svgs.plus,
                          color: Cr.accentBlue1,
                          width: 14,
                        ),
                        Text(
                          "  Add another",
                          style: bodySmallRegular.copyWith(
                            color: Cr.accentBlue1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Di.SBCH(18),
                  DialogTextFieldForm(),
                  Di.SBCH(18),
                  DialogLabelTextFormField(customLabel: "Surname"),
                  Di.SBHES,
                  DialogTextFieldForm(),
                  Di.SBCH(18),
                  DialogLabelTextFormField(
                    customLabel: "Professional title",
                    icon: HelpIconDialog(),
                  ),
                  Text(
                    "This is a short and clear sentence which describes what you do. \nE.g. General Manager and Hotel Executive, or Head Chef and Book Author.",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  ),
                  Di.SBHES,
                  DialogTextFieldForm(),
                  Di.SBCH(18),
                  Row(
                    children: [
                      DialogLabelTextFormField(
                        customLabel: "City / Area  / Region",
                        width: 250,
                      ),
                      SizedBox(width: 18),
                      DialogLabelTextFormField(
                        customLabel: "Country",
                        width: 250,
                      ),
                    ],
                  ),
                  Di.SBHES,
                  Row(
                    children: [
                      DialogTextFieldForm(
                        width: 250,
                      ),
                      SizedBox(width: 18),
                      DialogDropDownTextField(
                        hintText: 'Select Country',
                        dataList: [
                          "United state",
                          "Pakistan",
                          "South Africa",
                        ],
                      ),
                    ],
                  ),
                  Di.SBCH(18),
                  DialogLabelTextFormField(customLabel: "Time period"),
                  Di.SBHES,
                  Row(
                    children: [
                      DialogDropDownTextField(
                        width: 122,
                        hintText: 'Select Month',
                        dataList: [
                          "Jaun",
                          "Feb",
                          "March",
                        ],
                      ),
                      Di.SBWES,
                      DialogDropDownTextField(
                        width: 70,
                        hintText: 'Year',
                        dataList: [
                          "2020",
                          "2021",
                          "2022",
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Di.PSS),
                        child: Container(
                          width: 9,
                          height: 1.5,
                          color: Cr.accentBlue1,
                        ),
                      ),
                      DialogDropDownTextField(
                        disable: currentlyWorkHere,
                        width: 122,
                        hintText: 'Select Month',
                        dataList: [
                          "Jaun",
                          "Feb",
                          "March",
                        ],
                      ),
                      Di.SBWES,
                      DialogDropDownTextField(
                        disable: currentlyWorkHere,
                        width: 70,
                        hintText: 'Year',
                        dataList: [
                          "2020",
                          "2021",
                          "2022",
                        ],
                      ),
                    ],
                  ),
                  Di.SBCH(7),
                  Row(
                    children: [
                      Di.SBCW(220),
                      CheckboxDialog(
                        onChanged: (value) {
                          setState(() {
                            currentlyWorkHere = !currentlyWorkHere;
                          });
                        },
                        value: currentlyWorkHere,
                      ),
                      Text(
                        "I currently work here",
                        style: bodySmallRegular.copyWith(
                          color: Cr.darkGrey1,
                        ),
                      )
                    ],
                  ),
                  Di.SBCH(18),
                ],
              ),
              Di.SBCH(28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Svgs.delete,
                          color: Cr.red1,
                          width: 14,
                        ),
                        Di.SBWETS,
                        Text(
                          "Delete",
                          style: bodySmallRegular.copyWith(
                            color: Cr.red1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () => Nav.pop(context),
                        child: Text(
                          "Cancel",
                          style: bodySmallRegular.copyWith(
                            color: Cr.accentBlue1,
                          ),
                        ),
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue3,
                      ),
                      Di.SBWES,
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () async {
                          // Nav.pop(context);
                          // await new User(
                          //   profileSummary:
                          //       _profileSummaryController.text,
                          // ).save(widget.userProfileData);
                        },
                        child: Text(
                          "Save",
                          style: bodySmallRegular.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue1,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyDropDown extends StatelessWidget {
  const PrivacyDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogDropDownTextField(
      width: 125,
      hintText: 'Public',
      prefixIcon: Icon(
        FontAwesomeIcons.earthAmericas,
        color: Cr.darkGrey1,
        size: 10,
      ),
      dataList: [
        "Public",
        "Private",
        "Home",
      ],
    );
  }
}

class _ProfilePictureDialogExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const _ProfilePictureDialogExpandedTile({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<_ProfilePictureDialogExpandedTile> createState() =>
      __ProfilePictureDialogExpandedTileState();
}

class __ProfilePictureDialogExpandedTileState
    extends State<_ProfilePictureDialogExpandedTile> {
  String? selectedValue;
  bool currentlyWorkHere = false;

  late ExpandedTileController expandedTileController;
  @override
  void initState() {
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    super.initState();
  }

  @override
  void dispose() {
    expandedTileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 615,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile picture',
              style: h4Bold,
            ),
            Text(
              "Your profile picture will be used on your profile and throughout the site.",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            expandedTileController = expandedTileController.copyWith(
              isExpanded: !expandedTileController.isExpanded,
            );
          });
        },
        leading: Container(
          width: 50,
          height: 50,
          color: Cr.accentBlue1,
          child: Center(
            child: Icon(
              Icons.camera_alt,
              size: 22,
              color: Cr.whiteColor,
            ),
          ),
        ),
        trailingRotation: 0,
        trailing: !(expandedTileController.isExpanded == false)
            ? null
            : CustomMinusIcon(),
        theme: ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          color: Cr.whiteColor,
          padding: EdgeInsets.all(Di.PSL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(Images.profilePic),
                  ),
                  Di.SBWL,
                  SizedBox(
                    width: 405,
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          color: Cr.accentBlue1,
                        ),
                        Di.SBHS,
                        Text(
                          "Upload an image from your computer in either JPG, GIF or PNG format. Maximum file size can not exceed 3MB. Make sure you look good on Hospitality Leaders? Upload a photo that's at least 150px in width and height. ",
                          style: bodySmallRegular.copyWith(
                            color: Cr.darkGrey1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Di.SBCH(6),
              GestureDetector(
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Cr.red1,
                      size: 12,
                    ),
                    Di.SBCW(3),
                    Text(
                      "Delete photo",
                      style: bodySmallRegular.copyWith(
                        color: Cr.red1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const ProfileDetailsExpandedTile({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<ProfileDetailsExpandedTile> createState() =>
      _ProfileDetailsExpandedTileState();
}

class _ProfileDetailsExpandedTileState
    extends State<ProfileDetailsExpandedTile> {
  String? selectedValue;
  bool currentlyWorkHere = false;

  late ExpandedTileController expandedTileController;
  @override
  void initState() {
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    super.initState();
  }

  @override
  void dispose() {
    expandedTileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 645,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile details',
              style: h4Bold,
            ),
            Text(
              "Your name, surname, professional title and location.",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            expandedTileController = expandedTileController.copyWith(
              isExpanded: !expandedTileController.isExpanded,
            );
          });
        },
        leading: Container(
          width: 50,
          height: 50,
          color: Cr.accentBlue1,
          child: Center(
            child: Icon(
              Icons.camera_alt,
              size: 22,
              color: Cr.whiteColor,
            ),
          ),
        ),
        trailingRotation: 0,
        trailing: !(expandedTileController.isExpanded == false)
            ? null
            : CustomMinusIcon(),
        theme: ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: Di.PSL),
          color: Cr.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DialogLabelTextFormField(customLabel: "Name"),
                  Di.SBHES,
                  DialogTextFieldForm(),
                  Di.SBCH(18),
                  DialogLabelTextFormField(customLabel: "Surname"),
                  Di.SBHES,
                  DialogTextFieldForm(),
                  Di.SBCH(18),
                  DialogLabelTextFormField(
                    customLabel: "Professional title",
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          Svgs.helpCircle,
                          color: Cr.accentBlue1,
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "This is a short and clear sentence which describes what you do. \nE.g. General Manager and Hotel Executive, or Head Chef and Book Author.",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  ),
                  Di.SBHES,
                  DialogTextFieldForm(),
                  Di.SBCH(18),
                  Row(
                    children: [
                      DialogLabelTextFormField(
                        customLabel: "City / Area  / Region",
                        width: 250,
                      ),
                      SizedBox(width: 18),
                      DialogLabelTextFormField(
                        customLabel: "Country",
                        width: 250,
                      ),
                    ],
                  ),
                  Di.SBHES,
                  Row(
                    children: [
                      DialogTextFieldForm(
                        width: 250,
                      ),
                      SizedBox(width: 18),
                      DialogDropDownTextField(
                        hintText: 'Select Country',
                        dataList: [
                          "United state",
                          "Pakistan",
                          "South Africa",
                        ],
                      ),
                    ],
                  ),
                  Di.SBCH(18),
                  DialogLabelTextFormField(customLabel: "Time period"),
                  Di.SBHES,
                  Row(
                    children: [
                      DialogDropDownTextField(
                        width: 122,
                        hintText: 'Select Month',
                        dataList: [
                          "Jaun",
                          "Feb",
                          "March",
                        ],
                      ),
                      Di.SBWES,
                      DialogDropDownTextField(
                        width: 70,
                        hintText: 'Year',
                        dataList: [
                          "2020",
                          "2021",
                          "2022",
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Di.PSS),
                        child: Container(
                          width: 9,
                          height: 1.5,
                          color: Cr.accentBlue1,
                        ),
                      ),
                      DialogDropDownTextField(
                        disable: currentlyWorkHere,
                        width: 122,
                        hintText: 'Select Month',
                        dataList: [
                          "Jaun",
                          "Feb",
                          "March",
                        ],
                      ),
                      Di.SBWES,
                      DialogDropDownTextField(
                        disable: currentlyWorkHere,
                        width: 70,
                        hintText: 'Year',
                        dataList: [
                          "2020",
                          "2021",
                          "2022",
                        ],
                      ),
                    ],
                  ),
                  Di.SBCH(7),
                  Row(
                    children: [
                      Di.SBCW(220),
                      CheckboxDialog(
                        onChanged: (value) {
                          setState(() {
                            currentlyWorkHere = !currentlyWorkHere;
                          });
                        },
                        value: currentlyWorkHere,
                      ),
                      Text(
                        "I currently work here",
                        style: bodySmallRegular.copyWith(
                          color: Cr.darkGrey1,
                        ),
                      )
                    ],
                  ),
                  Di.SBCH(18),
                ],
              ),
              Di.SBCH(28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Svgs.delete,
                          color: Cr.red1,
                          width: 14,
                        ),
                        Di.SBWETS,
                        Text(
                          "Delete",
                          style: bodySmallRegular.copyWith(
                            color: Cr.red1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () => Nav.pop(context),
                        child: Text(
                          "Cancel",
                          style: bodySmallRegular.copyWith(
                            color: Cr.accentBlue1,
                          ),
                        ),
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue3,
                      ),
                      Di.SBWES,
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () async {
                          // Nav.pop(context);
                          // await new User(
                          //   profileSummary:
                          //       _profileSummaryController.text,
                          // ).save(widget.userProfileData);
                        },
                        child: Text(
                          "Save",
                          style: bodySmallRegular.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue1,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
