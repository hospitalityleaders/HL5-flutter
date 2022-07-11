import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/country.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/data/presentation_data.dart';
import 'package:holedo/presentation/functions/helper_functions.dart';
import 'package:holedo/presentation/functions/image_upload_functions.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/components/upload_button_widget.dart';
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
            const DialogTitleWidget(
              title: "My Profile",
            ),
            Di.SBHL,
            const _ProfilePictureDialogExpandedTile(isExpanded: true),
            Di.SBHS,
            ProfileDetailsExpandedTile(
              isExpanded: true,
              userProfileData: widget.userProfileData,
            ),
            Di.SBHS,
            const ContactDetailsExpandedTile(isExpanded: true),
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
  List<String> contactNumberList = [""];
  List<String> socialProfilesList = ["", "", ""];

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
      margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 645,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
          child: const Center(
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
            : const CustomMinusIcon(),
        theme: const ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
          color: Cr.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Di.DWZH,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Di.SBCH(18),
                  Container(
                    padding: const EdgeInsets.all(Di.PSL),
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
                  const DialogLabelTextFormField(
                    customLabel: "Contact number",
                    icon: HelpIconDialog(),
                  ),
                  Text(
                    "This is for data report purposes only and will always be anonymously displayed",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  ),
                  ...getNewContactPhoneFields(),
                  Di.SBCH(8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        contactNumberList.add('');
                      });
                    },
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
                  const DialogLabelTextFormField(
                    customLabel: "Email address",
                    isImportant: false,
                  ),
                  Di.SBHES,
                  const _TextFieldWithPrivacy(),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(
                    customLabel: "Website link",
                    isImportant: false,
                  ),
                  Di.SBHES,
                  const _TextFieldWithPrivacy(),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(
                    customLabel: "Skype",
                    isImportant: false,
                  ),
                  Di.SBHES,
                  const _TextFieldWithPrivacy(),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(
                    customLabel: "Social profiles",
                    isImportant: false,
                  ),
                  ...getNewSocialProfilesFields(),
                  Di.SBCH(8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        socialProfilesList.add('');
                      });
                    },
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
                ],
              ),
              Di.SBCH(18),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      borderColor: Cr.accentBlue2,
                      makeWidthNull: true,
                      onPressed: () => Nav.pop(context),
                      height: 36,
                      donotShowIcon: true,
                      backgroundColor: Cr.accentBlue3,
                      child: Text(
                        "Cancel",
                        style: bodySmallRegular.copyWith(
                          color: Cr.accentBlue1,
                        ),
                      ),
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
                      height: 36,
                      donotShowIcon: true,
                      backgroundColor: Cr.accentBlue1,
                      child: Text(
                        "Save",
                        style: bodySmallRegular.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Di.SBHL,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getNewContactPhoneFields() {
    var textField = <Widget>[];
    for (var i = 0; i < contactNumberList.length; i++) {
      textField.add(
        _ContactNumberField(
          onCloseTap: () {
            setState(() {
              contactNumberList.removeAt(i);
            });
          },
        ),
      );
    }
    return textField;
  }

  List<Widget> getNewSocialProfilesFields() {
    var textField = <Widget>[];
    for (var i = 0; i < socialProfilesList.length; i++) {
      textField.add(
        _SocialProfileField(
          selectedSocialMediaIndex: i % 3,
          onCloseTap: () {
            setState(() {
              socialProfilesList.removeAt(i);
            });
          },
        ),
      );
    }
    return textField;
  }
}

class _SocialProfileField extends StatefulWidget {
  const _SocialProfileField({
    Key? key,
    this.onCloseTap,
    this.selectedSocialMediaIndex,
  }) : super(key: key);
  final int? selectedSocialMediaIndex;
  final void Function()? onCloseTap;

  @override
  State<_SocialProfileField> createState() => __SocialProfileFieldState();
}

class __SocialProfileFieldState extends State<_SocialProfileField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Di.SBHES,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DialogDropDownTextField(
              selectedSocialMediaIndex: widget.selectedSocialMediaIndex,
              width: 132,
              iconDataList: const [
                Icons.facebook,
                FontAwesomeIcons.twitter,
                FontAwesomeIcons.google,
              ],
              hintText: 'Choose',
              dataList: const [
                "Facebook",
                "Twitter",
                "Google",
              ],
            ),
            Di.SBCW(12),
            const Expanded(
              child: DialogTextFieldForm(
                hintText: "Profile Url",
              ),
            ),
            Di.SBCW(12),
            const PrivacyDropDown(),
            Di.SBCW(12),
            Material(
              child: InkWell(
                onTap: widget.onCloseTap,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: const Icon(
                    Icons.close,
                    color: Cr.accentBlue1,
                    size: 14,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _TextFieldWithPrivacy extends StatefulWidget {
  const _TextFieldWithPrivacy({
    Key? key,
    this.onCloseTap,
    this.textEditingController,
    this.width,
    this.hintText,
  }) : super(key: key);

  final void Function()? onCloseTap;
  final TextEditingController? textEditingController;
  final double? width;
  final String? hintText;

  @override
  State<_TextFieldWithPrivacy> createState() => __TextFieldWithPrivacyState();
}

class __TextFieldWithPrivacyState extends State<_TextFieldWithPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Di.SBHES,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // DialogDropDownTextField(
            //   width: 122,
            //   hintText: 'Mobile',
            //   dataList: [
            //     "Mobile",
            //     "Telephone",
            //   ],
            // ),
            Expanded(
              child: DialogTextFieldForm(
                textEditingController: widget.textEditingController,
                width: widget.width,
                hintText: widget.hintText,
              ),
            ),
            Di.SBCW(12),
            const PrivacyDropDown(),
            Di.SBCW(12),
            Material(
              child: InkWell(
                onTap: widget.onCloseTap,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: const Icon(
                    Icons.close,
                    color: Cr.accentBlue1,
                    size: 14,
                  ),
                ),
              ),
            )
          ],
        ),
        Di.SBCH(7),
      ],
    );
  }
}

class _ContactNumberField extends StatefulWidget {
  const _ContactNumberField({
    Key? key,
    this.onCloseTap,
  }) : super(key: key);
  final void Function()? onCloseTap;

  @override
  State<_ContactNumberField> createState() => __ContactNumberFieldState();
}

class __ContactNumberFieldState extends State<_ContactNumberField> {
  bool contactableViaWhatsapp = false;
  bool contactableViaSms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Di.SBHES,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DialogDropDownTextField(
              width: 122,
              hintText: 'Mobile',
              dataList: [
                "Mobile",
                "Telephone",
              ],
            ),
            Di.SBCW(12),
            const Expanded(
              child: DialogTextFieldForm(
                hintText: "123456789",
              ),
            ),
            Di.SBCW(12),
            const PrivacyDropDown(),
            Di.SBCW(12),
            Material(
              child: InkWell(
                onTap: widget.onCloseTap,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: const Icon(
                    Icons.close,
                    color: Cr.accentBlue1,
                    size: 14,
                  ),
                ),
              ),
            )
          ],
        ),
        Di.SBCH(7),
        Row(
          children: [
            CheckboxDialog(
              onChanged: (value) {
                setState(() {
                  contactableViaWhatsapp = !contactableViaWhatsapp;
                });
              },
              value: contactableViaWhatsapp,
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
                  contactableViaSms = !contactableViaSms;
                });
              },
              value: contactableViaSms,
            ),
            Text(
              "I am contactable via sms",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            )
          ],
        ),
      ],
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
      selectedSocialMediaIndex: 0,
      width: 125,
      hintText: 'Public',
      iconsList: [
        SvgPicture.asset(
          Svgs.web,
          color: Cr.darkGrey1,
          width: 15,
        ),
        SvgPicture.asset(
          Svgs.web,
          color: Cr.darkGrey1,
          width: 15,
        ),
        SvgPicture.asset(
          Svgs.web,
          color: Cr.darkGrey1,
          width: 15,
        ),
      ],
      dataList: const [
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
  Image? pickedImage;

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
    final userProfileData = DbData.getUserProfileData;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 615,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
          child: const Center(
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
            : const CustomMinusIcon(),
        theme: const ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          color: Cr.whiteColor,
          padding: const EdgeInsets.all(Di.PSL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: pickedImage ??
                        (userProfileData.avatar != null
                            ? Image.network(userProfileData.avatar!)
                            : SvgPicture.asset(Svgs.avatarPlaceholder)),
                  ),
                  Di.SBWL,
                  SizedBox(
                    width: 405,
                    child: Column(
                      children: [
                        UploadButtonWidget(
                          setErrorMessage: pickedImage == null ? "" : null,
                          margin: EdgeInsets.zero,
                          folder: "avatar",
                          uploadedImgCallback: (String imgUrl) async {
                            await User(
                              avatar: imgUrl,
                            ).save(userProfileData);
                          },
                          pickedImgCallback: (Image image) {
                            setState(() {
                              pickedImage = image;
                            });
                          },
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
                onTap: () async {
                  showCircularProgressIndicator(context);
                  if (pickedImage == null && userProfileData.avatar == null) {
                    // Csd.customErrorDialog(
                    //   context,
                    //   "There is no image for deletion",
                    // );
                  } else if (pickedImage != null) {
                    setState(() {
                      pickedImage = null;
                    });
                    // Csd.customSuccessrDialog(context, "Avatar is deleted");
                  } else if (userProfileData.avatar != null) {
                    await ImageUploadFunctions()
                        .deleteImageFromCloudnary(userProfileData.avatar!);
                    await User(
                      avatar: null,
                    ).save(userProfileData);
                    // Csd.customSuccessrDialog(context, "Avatar is deleted");
                  }
                  Nav.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(
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
    required this.userProfileData,
  }) : super(key: key);
  final User userProfileData;

  @override
  State<ProfileDetailsExpandedTile> createState() =>
      _ProfileDetailsExpandedTileState();
}

class _ProfileDetailsExpandedTileState
    extends State<ProfileDetailsExpandedTile> {
  String? selectedValue;
  bool currentlyWorkHere = false;

  late ExpandedTileController expandedTileController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _professionalTitleController;
  late final TextEditingController _cityAreaController;
  int? countryId;

  @override
  void initState() {
    _fullNameController =
        TextEditingController(text: widget.userProfileData.fullName ?? "");
    _surnameController =
        TextEditingController(text: widget.userProfileData.lastName ?? "");
    _professionalTitleController = TextEditingController(
        text: widget.userProfileData.professionalTitle ?? "");
    _cityAreaController =
        TextEditingController(text: widget.userProfileData.area ?? "");
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    countryId = widget.userProfileData.countryId;
    super.initState();
  }

  @override
  void dispose() {
    expandedTileController.dispose();
    _fullNameController.dispose();
    _surnameController.dispose();
    _professionalTitleController.dispose();
    _cityAreaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileData = DbData.getUserProfileData;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 645,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
          child: const Center(
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
            : const CustomMinusIcon(),
        theme: const ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
          color: Cr.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DialogLabelTextFormField(customLabel: "Name"),
                  Di.SBHES,
                  DialogTextFieldForm(
                    textEditingController: _fullNameController,
                  ),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(customLabel: "Surname"),
                  Di.SBHES,
                  DialogTextFieldForm(
                    textEditingController: _surnameController,
                  ),
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
                  DialogTextFieldForm(
                    textEditingController: _professionalTitleController,
                  ),
                  Di.SBCH(18),
                  Row(
                    children: const [
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
                        textEditingController: _cityAreaController,
                        width: 250,
                      ),
                      SizedBox(width: 18),
                      DialogDropDownTextField(
                        initialValue:
                            PresentationData.countries[countryId.toString()],
                        onChanged: (value) {
                          if (value != null) {
                            final countryidString =
                                HelperFunctions.findKeyByValueFromMap(
                              PresentationData.countries,
                              value,
                            );

                            if (countryidString != null) {
                              setState(() {
                                countryId = int.tryParse(countryidString);
                              });
                            }
                          }
                        },
                        alignHintTextStart: true,
                        hintText: 'Select Country',
                        dataList: PresentationData.countries.values.toList(),
                      ),
                    ],
                  ),
                ],
              ),
              Di.SBCH(28),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () => Nav.pop(context),
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue3,
                        child: Text(
                          "Cancel",
                          style: bodySmallRegular.copyWith(
                            color: Cr.accentBlue1,
                          ),
                        ),
                      ),
                      Di.SBWES,
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () async {
                          // Nav.pop(context);
                          await User(
                              fullName: "Kalimullah",
                              professionalTitle: "flutter app developer",
                              lastName: "Khan",
                              area: "Sargodha",
                              country: Country(
                                id: 123,
                                title: "Pakistan",
                              )).save(userProfileData);
                        },
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue1,
                        child: Text(
                          "Save",
                          style: bodySmallRegular.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Di.SBHL,
            ],
          ),
        ),
      ),
    );
  }
}
