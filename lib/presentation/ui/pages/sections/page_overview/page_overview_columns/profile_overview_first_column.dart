import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/presentation/ui/components/profile_reference_single_compoenet.dart';
import 'package:holedo/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_expertise_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_summary_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:holedo/services/holedo_api_services.dart';
import 'package:holedo/common/popUpHeadMenu.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';

class ProfileOverviewFirstColumn extends StatefulWidget {
  const ProfileOverviewFirstColumn({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

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
        children: const [
          ProfileSummaryComponent(),
          Di.SBHETS,
          AreasOfExpertiseComponents(),
          Di.SBHL,
          ProfileReferenceComponent(),
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
      print('usser: $userData');
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
  Widget buildReferencesCard(
    String img,
    String title,
    String userId,
    String subTitle,
    String description,
  ) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(6),
      color: ColorPicker.kWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              padding: const EdgeInsets.only(right: 30.0),
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
                  icon: const Icon(
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
    TextEditingController profileCtrl =
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
                              controller: profileCtrl,
                              autocorrect: true,
                              minLines: 4,
                              maxLines: 6,
                              decoration: const InputDecoration(
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
                                      child: const Text('Cancel')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: isUpdating
                                      ? const CircularProgressIndicator()
                                      : ElevatedButton(
                                          onPressed: () {
                                            updateUsers(id, profileCtrl.text);
                                          },
                                          child: const Text('Save'),
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

  final TextEditingController _controller = TextEditingController();

  List chipList = ['Business'];

  ///Area of exper pop up end

  ///profile section1 pop up functionality End

}

class OldPopUpDialogs {
  static Future<String?> buildAreaOfExpePopUp(BuildContext context) {
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
                                              child: const Icon(
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
                                                  // controller: _controller,
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
                                              // setState(
                                              //   () {
                                              //     if (_controller.text != '') {
                                              //       chipList
                                              //           .add(_controller.text);
                                              //     } else {
                                              //       null;
                                              //     }
                                              //   },
                                              // );
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
                                  // Padding(
                                  //   padding: EdgeInsets.all(8.0),
                                  //   child: SingleChildScrollView(
                                  //     child: Wrap(
                                  //       spacing: 3.0,
                                  //       runSpacing: 5.0,
                                  //       children: [
                                  //         for (var i in chipList)
                                  //           Chip(
                                  //             backgroundColor: Colors.white,
                                  //             elevation: 0.5,
                                  //             shadowColor: Colors.black,
                                  //             padding: EdgeInsets.symmetric(
                                  //                 vertical: 15, horizontal: 5),
                                  //             shape: RoundedRectangleBorder(),
                                  //             label: Text(i.toString()),
                                  //             deleteIcon: Icon(
                                  //               Icons.close,
                                  //               color: ColorPicker.kBlueLight1,
                                  //               size: 10,
                                  //             ),
                                  //             onDeleted: () {
                                  //               setState(
                                  //                 () {
                                  //                   chipList.removeAt(
                                  //                       chipList.indexOf(i));
                                  //                 },
                                  //               );
                                  //             },
                                  //           ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: const Text('Cancel')),
                                        SS.sB(0, 10),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: const Text('Save'))
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
}

class ProfileSummaryComponent extends StatefulWidget {
  const ProfileSummaryComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;
  @override
  State<ProfileSummaryComponent> createState() =>
      _ProfileSummaryComponentState();
}

class _ProfileSummaryComponentState extends State<ProfileSummaryComponent> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final String? profileSummary = DbData.getUserProfileData.profileSummary;
    final isMobilePhn = isMobilePhone(context);

    return Container(
      margin: const EdgeInsets.only(bottom: Di.PSD),
      decoration: Styles.boxDecoration.copyWith(
        color: Cr.whiteColor,
        boxShadow: Styles.defaultBoxShadow,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 46,
                padding: EdgeInsets.only(
                    left: widget.isMobile ? Di.PSD : Di.PSL, right: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile summary",
                      style: h2Regular,
                    ),
                    CustomComponentDropdown(
                      size: 32,
                      iconSize: 13,
                      onTappedInside: () {
                        setState(() {
                          showSubMenu = !showSubMenu;
                        });
                      },
                      onTappedOutside: () {
                        // setState(() {
                        //   showSubMenu = false;
                        // });
                      },
                    ),
                  ],
                ),
              ),
              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    isMobilePhn
                        ? ExpandedCollapseWidget(
                            description: profileSummary ?? "",
                            isMobile: widget.isMobile,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                              left: Di.PSD,
                              right: Di.PSD,
                              top: Di.PSD,
                              bottom: Di.PSD,
                            ),
                            child: Text(
                              profileSummary ?? "",
                              maxLines: widget.isMobile ? 6 : null,
                              style: bodyLarge.copyWith(color: Cr.darkGrey1),
                            ),
                          ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: profileSummary == null,
                      greenCardText:
                          "Add a written profile summary about your professional career, skills, work experience and achievements. Promote yourself and get recognised by other people.",
                      greenCardTip:
                          "People with detailed profile summaries are 95% more likely to be viewed and connected with.",
                      onAddPressed: () {
                        showCustomDialog(
                          context,
                          ProfileSummaryDialogWidget(
                            userProfileData: DbData.getUserProfileData,
                          ),
                        );
                      },
                    ),
                    if (profileSummary != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          showCustomDialog(
                            context,
                            ProfileSummaryDialogWidget(
                              userProfileData: DbData.getUserProfileData,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (showSubMenu)
            Positioned(
              right: 8,
              top: 41,
              child: ViewTimeEditProfileSubmenu(
                donotShowTimeline: true,
                hideSubMenuCallback: () {
                  setState(() {
                    showSubMenu = false;
                  });
                },
                editText: 'profile summary',
              ),
            ),
        ],
      ),
    );
  }
}

class AreasOfExpertiseComponents extends StatefulWidget {
  const AreasOfExpertiseComponents({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  State<AreasOfExpertiseComponents> createState() =>
      _AreasOfExpertiseComponentsState();
}

class _AreasOfExpertiseComponentsState
    extends State<AreasOfExpertiseComponents> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final expertise = DbData.getUserProfileData.expertise;
    return DecoratedBox(
      decoration: Styles.boxDecorationWithShadow.copyWith(color: Cr.whiteColor),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed: () {
                  setState(() {
                    showSubMenu = !showSubMenu;
                  });
                },
                title: "Areas of expertise",
              ),

              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Di.SBHD,
                          DbData.getUserProfileData.expertise != null
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                    children: List<Widget>.generate(
                                      expertise!.length,
                                      (int idx) {
                                        return
                                            //  Di.SBWS,
                                            CustomCheckboxWithTitle(
                                          title: (expertise[idx]).title ?? "",
                                        );
                                      },
                                    ).toList(),
                                  ),
                                )
                              : Di.ESB,
                          Di.SBHD,
                        ],
                      ),
                    ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: expertise == null,
                      // dataIsNull: expertise == null,
                      greenCardText:
                          "List your skill set and areas of focus for other connections and potential employers to view.",
                      onAddPressed: () {
                        showCustomDialog(
                          context,
                          const ProfileExpertiseDialogWidget(),
                        );
                      },
                    ),
                    if (expertise != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          showCustomDialog(
                            context,
                            const ProfileExpertiseDialogWidget(),
                          );
                        },
                        onAddPressed: () {
                          showCustomDialog(
                            context,
                            const ProfileExpertiseDialogWidget(),
                          );
                          // buildAreaOfExpePopUp(context);
                        },
                      ),
                  ],
                ),
              ),
              // Training
            ],
          ),
          if (showSubMenu)
            Positioned(
              right: 8,
              top: 41,
              child: ViewTimeEditProfileSubmenu(
                donotShowTimeline: true,
                hideSubMenuCallback: () {
                  setState(() {
                    showSubMenu = false;
                  });
                },
                editText: 'area of expertise',
              ),
            ),
        ],
      ),
    );
  }
}
