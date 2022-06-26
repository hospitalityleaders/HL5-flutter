import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/edit_icon_buttton.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_summary_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:holedo/services/holedo_api_services.dart';
import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';

class ProfileSummaryComponent extends StatefulWidget {
  const ProfileSummaryComponent({
    Key? key,
    this.isMobile = false,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;
  final bool isMobile;
  @override
  State<ProfileSummaryComponent> createState() =>
      _ProfileSummaryComponentState();
}

class _ProfileSummaryComponentState extends State<ProfileSummaryComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Di.PSD),
      decoration: Styles.boxDecoration.copyWith(
        color: Cr.whiteColor,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Profile summary",
              style: h2Regular,
            ),
          ),
          Divider(
            thickness: 1,
            height: 0,
          ),
          IntrinsicHeight(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Di.PSD,
                        vertical: Di.PSEL,
                      ),
                      child: Text(
                        widget.userProfileData.profileSummary ?? "",
                        maxLines: widget.isMobile ? 6 : null,
                        style: bodyLarge.copyWith(color: Cr.darkGrey1),
                      ),
                    ),
                    Di.DD2,
                  ],
                ),
                Provider.of<ProfileProvider>(context).isProfileEditable
                    ? Container(
                        width: 560,
                        color: Cr.accentBlue2.withOpacity(.8),
                      )
                    : Di.ESB,
                Provider.of<ProfileProvider>(context).isProfileEditable
                    ? EditIconButton(
                        onPressed: () {
                          showCustomDialog(
                            context,
                            ProfileSummaryDialogWidget(
                              userProfileData: widget.userProfileData,
                            ),
                          );
                        },
                      )
                    : Di.ESB,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOverviewFirstColumn extends StatefulWidget {
  const ProfileOverviewFirstColumn({
    required this.sec1IsEditable,
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final sec1IsEditable;
  final User userProfileData;

  @override
  State<ProfileOverviewFirstColumn> createState() =>
      _ProfileOverviewFirstColumnState();
}

class _ProfileOverviewFirstColumnState
    extends State<ProfileOverviewFirstColumn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSummaryComponent(
            userProfileData: widget.userProfileData,
          ),
          Di.SBHETS,
          Container(
            padding: EdgeInsets.symmetric(horizontal: Di.PSD),
            decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Areas of expertise",
                    style: h2Regular,
                  ),
                ),

                Stack(
                  children: [
                    Column(
                      children: [
                        Divider(
                          thickness: .7,
                          color: Cr.darkGrey2,
                        ),
                        // widget.userProfileData.expertise != null
                        //     ? Wrap(
                        //         children: List<Widget>.generate(
                        //           widget.userProfileData.expertise!.length,
                        //           (int idx) {
                        //             return
                        //                 //  Di.SBWS,
                        //                 CustomCheckboxWithTitle(
                        //               title: (widget.userProfileData
                        //                           .expertise![idx] as Expertise)
                        //                       .title ??
                        //                   "Leadership",
                        //             );
                        //           },
                        //         ).toList(),
                        //       )
                        //     : Di.ESB,
                        Row(
                          children: [
                            Di.SBWS,
                            CustomCheckboxWithTitle(
                                title: "Business management"),
                            Di.SBWS,
                            CustomCheckboxWithTitle(title: "Leadership"),
                          ],
                        ),
                        Row(
                          children: [
                            Di.SBWS,
                            CustomCheckboxWithTitle(title: "Leadership"),
                            Di.SBWS,
                            CustomCheckboxWithTitle(title: "Growth Hacking"),
                            Di.SBWS,
                            CustomCheckboxWithTitle(title: "Finance"),
                          ],
                        ),
                        Row(
                          children: [
                            Di.SBWD,
                            CustomCheckboxWithTitle(
                                title: "Business management"),
                            Di.SBWS,
                            CustomCheckboxWithTitle(title: "Leadership"),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Di.SBWS,
                            CustomCheckboxWithTitle(title: "Finance"),
                            Di.SBWS,
                            CustomCheckboxWithTitle(title: "Acquisitions"),
                            Di.SBWS,
                            TextWithBackground(
                              text: " + Show all",
                              textColor: Cr.accentBlue1,
                              backgroundColor: Cr.accentBlue3,
                            ),
                          ],
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
                                  height: 174,
                                  color: Cr.accentBlue2.withOpacity(.8),
                                  padding: EdgeInsets.all(Di.PSD),
                                ),
                              ],
                            ),
                          )
                        : Di.ESB,
                    Provider.of<ProfileProvider>(context).isProfileEditable
                        ? EditIconButton(onPressed: () {
                            buildAreaOfExpePopUp(context);
                          })
                        : Di.ESB,
                  ],
                ),
                // CustomCheckboxWithTitle(title: "Growth Hacking"),
                // CustomCheckboxWithTitle(title: "Finance"),
                // CustomCheckboxWithTitle(title: "Acquisitions"),
                // CustomCheckboxWithTitle(title: "Recruitment"),
                // CustomCheckboxWithTitle(title: "Hotel groups"),
                // CustomCheckboxWithTitle(title: "Consulting"),
                // CustomCheckboxWithTitle(title: "Public speaking"),

                // Training

                Di.SBHD,
              ],
            ),
          ),

          Di.SBHETS,
          // ProfileReferenceComponent(),
          Container(
            decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Di.SBHETS,
                Card(
                  child: ListTile(
                    title: Text(
                      "References",
                      style: h2Regular,
                    ),
                  ),
                ),
                // Divider(thickness: 1),
                Stack(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          width: 360,
                          padding: EdgeInsets.symmetric(horizontal: Di.PSS),
                          decoration: Styles.boxDecoration
                              .copyWith(color: Cr.whiteColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: PersonAvatar(
                                  avatarSize: Di.FSOTL + 10,
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      "Sarah Lee",
                                      style: h4Bold,
                                    ),
                                    Di.SBWES,
                                    Text(
                                      "MHL",
                                      style: dividerTextSmall,
                                    )
                                  ],
                                ),
                                subtitle: Text(
                                  "General Manager, One & Only Hotel",
                                  style: bodySmallRegular.copyWith(
                                    color: Cr.darkGrey1,
                                  ),
                                ),
                              ),
                              Di.SBHES,
                              Container(
                                height: Di.FSOTL + 10,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Di.PSD),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Di.FSOTL,
                                      height: Di.FSOTL,
                                      decoration: Styles.boxDecoration.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                      child: Icon(
                                        Icons.format_quote,
                                        color: Cr.whiteColor,
                                      ),
                                    ),
                                    Di.SBWD,
                                    Expanded(
                                      // width: 100,
                                      child: SizedBox(
                                        height: Di.FSOTL + 6,
                                        child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                                          style: bodyLarge.copyWith(
                                            color: Cr.darkGrey1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Di.SBHETS,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Di.PSD),
                                child: Text(
                                  "incididunt ut labore et dolore magna aliqua.",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: bodyLarge.copyWith(
                                    color: Cr.darkGrey1,
                                  ),
                                ),
                              ),
                              CustomTextButton(
                                text: "  + Show more",
                              ),
                              Di.SBHD,
                              Divider(thickness: 1),
                            ],
                          ),
                        ),

                        // _ProfileReferenceListTile(),
                        // _ProfileReferenceListTile(),
                        // Divider(thickness: 1),
                      ],
                    ),
                    Provider.of<ProfileProvider>(context).isProfileEditable
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 50),
                                Container(
                                  width: 560,
                                  height: 370,
                                  color: Cr.accentBlue2.withOpacity(.8),
                                  padding: EdgeInsets.all(Di.PSD),
                                ),
                              ],
                            ),
                          )
                        : Di.ESB,
                    Provider.of<ProfileProvider>(context).isProfileEditable
                        ? EditIconButton(
                            onPressed: () {
                              PopUpHeadMenu.buildReferencesCardPopUp(context);
                            },
                          )
                        : Di.ESB,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final ApiServices _apiServices = ApiServices();
  bool isUpdating = false;

  Future<void> updateUsers(dynamic id, String profileSummaryController) async {
    setState(() {
      isUpdating = true;
    });
    if (profileSummaryController.toString() != '') {
      Map<String, dynamic> userData = {
        "id": id,
        "profile_summary": profileSummaryController
      };
      print('usser: ${userData}');
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

  Widget buildAreaOfExpertiseButton(String btnName) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
      ),
      onPressed: () {},
      icon: Padding(
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
            padding: EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 30),
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
                        child: Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)),
                          child: Icon(
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
          SizedBox(
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

  Future<String?> buildProfileCardPopUp(
      {required dynamic id, required String profileSummary}) {
    TextEditingController _profileCtrl =
        TextEditingController(text: profileSummary);
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
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
                  PopUpHeadMenu.popUpHead('Profile Summary', context),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      color: ColorPicker.kWhite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Summary',
                              style: FontTextStyle.kBlueDark114W700SSP,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _profileCtrl,
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
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel')),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: isUpdating
                                      ? CircularProgressIndicator()
                                      : ElevatedButton(
                                          onPressed: () {
                                            updateUsers(id, _profileCtrl.text);
                                          },
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
                width: Responsive.isDesktop(context)
                    ? SS.sW(context) * .50
                    : Responsive.isMobile(context)
                        ? SS.sW(context) * .90
                        : SS.sW(context) * .60,
                // height: 375,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PopUpHeadMenu.popUpHead('Expertise', context),
                      SizedBox(
                        height: SS.sH(context) * .05,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              color: ColorPicker.kWhite,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(20),
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
                                              padding: EdgeInsets.symmetric(
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
                                    padding: EdgeInsets.all(8.0),
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
                                              label: Text(i.toString()),
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
                                    padding: EdgeInsets.all(20),
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

}

class AreasOfExpertiseComponents extends StatelessWidget {
  const AreasOfExpertiseComponents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Di.PSD),
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Areas of expertise",
              style: h2Regular,
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Divider(
                    thickness: .7,
                    color: Cr.darkGrey2,
                  ),
                  Row(
                    children: [
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Business management"),
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Leadership"),
                    ],
                  ),
                  Row(
                    children: [
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Leadership"),
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Growth Hacking"),
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Finance"),
                    ],
                  ),
                  Row(
                    children: [
                      Di.SBWD,
                      CustomCheckboxWithTitle(title: "Business management"),
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Leadership"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Finance"),
                      Di.SBWS,
                      CustomCheckboxWithTitle(title: "Acquisitions"),
                      Di.SBWS,
                      TextWithBackground(
                        text: " + Show all",
                        textColor: Cr.accentBlue1,
                        backgroundColor: Cr.accentBlue3,
                      ),
                    ],
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
                            height: 174,
                            color: Cr.accentBlue2.withOpacity(.8),
                            padding: EdgeInsets.all(Di.PSD),
                          ),
                        ],
                      ),
                    )
                  : Di.ESB,
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? EditIconButton(onPressed: () {})
                  : Di.ESB,
            ],
          ),
          // CustomCheckboxWithTitle(title: "Growth Hacking"),
          // CustomCheckboxWithTitle(title: "Finance"),
          // CustomCheckboxWithTitle(title: "Acquisitions"),
          // CustomCheckboxWithTitle(title: "Recruitment"),
          // CustomCheckboxWithTitle(title: "Hotel groups"),
          // CustomCheckboxWithTitle(title: "Consulting"),
          // CustomCheckboxWithTitle(title: "Public speaking"),

          // Training

          Di.SBHD,
        ],
      ),
    );
  }
}
