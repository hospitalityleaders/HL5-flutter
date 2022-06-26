import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileWriteReferenceDialogWidget extends StatefulWidget {
  const ProfileWriteReferenceDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileWriteReferenceDialogWidget> createState() =>
      _ProfileWriteReferenceDialogWidgetState();
}

class _ProfileWriteReferenceDialogWidgetState
    extends State<ProfileWriteReferenceDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200),
      child: Center(
        child: SingleChildScrollView(
          // behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Container(
            color: Cr.darkGrey4,
            width: 655,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DialogTitleWidget(
                  title: "Write a reference",
                ),
                Di.SBHL,
                Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Cr.green1,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Svgs.plus,
                        color: Cr.whiteColor,
                        width: 30,
                      ),
                    ),
                  ),
                ),
                Di.SBHL,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Di.PSL),
                  width: 615,
                  child: DialogExpandedTile(),
                ),
                Di.SBHETS,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Di.PSL),
                  width: 615,
                  child: DialogExpandedTile(),
                ),
                Di.SBHD,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DialogExpandedTile extends StatefulWidget {
  const DialogExpandedTile({
    Key? key,
  }) : super(key: key);

  @override
  State<DialogExpandedTile> createState() => _DialogExpandedTileState();
}

class _DialogExpandedTileState extends State<DialogExpandedTile> {
  List<String> newTextField = [""];
  String? selectedValue;
  bool currentlyWorkHere = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpandedTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General Manager',
            style: h4Bold,
          ),
          Text(
            "Fairmont Zimbali Resort · Cape Town",
            style: bodySmallRegular.copyWith(
              color: Cr.accentBlue1,
            ),
          ),
          Text(
            "February 2012 – January 2013 (11 months)",
            style: bodySmallRegular.copyWith(
              color: Cr.darkGrey1,
            ),
          )
        ],
      ),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      leading: Container(
        width: 50,
        height: 50,
        color: Cr.accentBlue1,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      //  isExpanded
      //     ? SizedBox(
      //         width: 16,
      //         height: 16,
      //         child: Center(
      //           child: Container(
      //             width: 9.5,
      //             height: 1.5,
      //             color: Cr.accentBlue1,
      //           ),
      //         ),
      //       )
      //     : Icon(
      //         FontAwesomeIcons.pencil,
      //         color: Cr.accentBlue1,
      //         size: 16,
      //       ),
      theme: ExpandedTileThemeData(
        contentPadding: EdgeInsets.zero,
        headerPadding: EdgeInsets.all(17),
        headerRadius: 0,
        contentRadius: 0,
      ),
      controller: ExpandedTileController(isExpanded: isExpanded),
      content: Container(
        color: Cr.whiteColor,
        padding: EdgeInsets.all(Di.PSL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DialogLabelTextFormField(customLabel: "Title / position"),
                Di.SBHES,
                DialogTextFieldForm(),
                Di.SBCH(18),
                DialogLabelTextFormField(customLabel: "Company name"),
                Di.SBHES,
                DialogTextFieldForm(),
                Di.SBCH(18),
                DialogLabelTextFormField(customLabel: "Company website"),
                Di.SBHES,
                DialogTextFieldForm(hintText: "www.website.com"),
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
                DialogLabelTextFormField(
                  customLabel: "Salary per annum",
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
                  "This is for data report purposes only and will always be anonymously displayed",
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                ),
                Di.SBHES,
                Row(
                  children: [
                    DialogDropDownTextField(
                      width: 140,
                      hintText: 'Select Currency',
                      dataList: [
                        "Jaun",
                        "Feb",
                        "March",
                      ],
                    ),
                    Di.SBWES,
                    DialogTextFieldForm(
                      width: 110,
                      hintText: "Amount",
                    ),
                  ],
                ),
                Di.SBCH(18),
                DialogLabelTextFormField(
                  customLabel: "Leave days per annum",
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
                  "This is for data report purposes only and will always be anonymously displayed",
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                ),
                Di.SBHES,
                DialogDropDownTextField(
                  width: 140,
                  hintText: '10+ days',
                  dataList: [
                    "Jaun",
                    "Feb",
                    "March",
                  ],
                ),
                Di.SBCH(18),
                DialogLabelTextFormField(customLabel: "Job description"),
                Di.SBHES,
                DialogMultiLineTextField(
                  width: 575,
                )
              ],
            ),
            Di.SBCH(28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      newTextField.add('');
                    });
                  },
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
    );
  }
}

class DialogMultiLineTextField extends StatelessWidget {
  const DialogMultiLineTextField({
    Key? key,
    this.textEditingController,
    this.width,
    this.hintText,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final double? width;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 555,
      child: TextFormField(
        // controller: textEditingController,
        style: bodySmallRegular.copyWith(
          color: Cr.darkGrey1,
        ),
        maxLines: 100,
        minLines: 5,
        decoration: Styles.popUpDialogTextFieldInputDecoration.copyWith(
          // hintText: hintText,
          hintStyle: bodySmallRegular.copyWith(color: Cr.darkGrey4),
        ),
      ),
    );
  }
}

class CheckboxDialog extends StatelessWidget {
  const CheckboxDialog({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final bool value;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith((_) => const BorderSide(
                width: 1,
                color: Cr.darkGrey4,
              )),
          fillColor: MaterialStateProperty.all(Colors.white),
          checkColor: MaterialStateProperty.all(Cr.accentBlue1),
        ),
      ),
      child: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
