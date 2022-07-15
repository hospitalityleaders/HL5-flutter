import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/models/holedoapi/education.dart';
import 'package:holedo/presentation/data/presentation_data.dart';
import 'package:holedo/presentation/extensions/datetime_extension.dart';

import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/custom_expanded_tile.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileEducationDialogWidget extends StatefulWidget {
  const ProfileEducationDialogWidget({
    Key? key,
    required this.educations,
  }) : super(key: key);

  final List<Education> educations;

  @override
  State<ProfileEducationDialogWidget> createState() =>
      _ProfileEducationDialogWidgetState();
}

class _ProfileEducationDialogWidgetState
    extends State<ProfileEducationDialogWidget> {
  late List<Education> educations;
  @override
  void initState() {
    educations = widget.educations;
    super.initState();
  }

  bool addingToProfile = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Cr.darkGrey4,
        width: 655,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DialogTitleWidget(
              title: "Education",
            ),
            Di.SBHL,
            if (addingToProfile)
              Container(
                padding: const EdgeInsets.only(bottom: Di.PSS),
                margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
                child: _SingleEducation(
                  isExpanded: true,
                  educations: Education(),
                ),
              )
            else
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    setState(() {
                      addingToProfile = true;
                    });
                  },
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
              ),
            Di.SBHL,
            ListView.builder(
              shrinkWrap: true,
              itemCount: educations.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: Di.PSS),
                  margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
                  width: 615,
                  child: _SingleEducation(
                    educations: educations[index],
                  ),
                );
              },
            ),
            Di.SBHD,
          ],
        ),
      ),
    );
  }
}

class _SingleEducation extends StatefulWidget {
  const _SingleEducation({
    Key? key,
    this.educations,
    this.isExpanded = false,
  }) : super(key: key);
  final Education? educations;
  final bool isExpanded;

  @override
  State<_SingleEducation> createState() => __SingleEducationState();
}

class __SingleEducationState extends State<_SingleEducation> {
  late final TextEditingController _educationalInstituteController;
  late final TextEditingController _qualificationTitleController;
  late final TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();
  late Education education;
  List<String> qualificationList = [""];
  String? selectedValue;
  bool currentlyWorkHere = false;
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    education = widget.educations ?? Education();
    _educationalInstituteController =
        TextEditingController(text: education.institution)
          ..addListener(() {
            setState(() {});
          });

    _qualificationTitleController =
        TextEditingController(text: education.qualification?.title)
          ..addListener(() {
            setState(() {});
          });

    _descriptionController = TextEditingController(text: education.description);

    super.initState();
  }

  @override
  void dispose() {
    _educationalInstituteController.dispose();
    _qualificationTitleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomExpandedTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _educationalInstituteController.text,
            style: h4Bold,
          ),
          Text(
            _qualificationTitleController.text,
            style: bodySmallRegular.copyWith(
              color: Cr.accentBlue1,
            ),
          ),
          Text(
            (education.durationFromDate != null)
                ? "${education.durationFromDate!.getMonthInString} ${education.durationFromDate!.year}${(education.durationToDate != null) ? " - ${education.durationToDate!.getMonthInString} ${education.durationToDate!.year} (${education.durationToDate!.month - education.durationFromDate!.month} months)" : ""}"
                : "",
            style: bodySmallRegular.copyWith(
              color: Cr.darkGrey1,
            ),
          ),
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
        child: Center(
          child: SvgPicture.asset(
            Svgs.domain,
            color: Cr.whiteColor,
            width: 20,
          ),
        ),
      ),
      trailing: const Icon(Icons.keyboard_arrow_right),
      theme: const CustomExpandedTileThemeData(
        contentPadding: EdgeInsets.zero,
        headerPadding: EdgeInsets.all(17),
        headerRadius: 0,
        contentRadius: 0,
      ),
      controller: CustomExpandedTileController(isExpanded: isExpanded),
      content: Container(
        color: Cr.whiteColor,
        padding: const EdgeInsets.all(Di.PSL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DialogLabelTextFormField(
                  customLabel: "Educational institution",
                ),
                Di.SBHES,
                DialogTextFieldForm(
                  textEditingController: _educationalInstituteController,
                ),
                Di.SBCH(18),
                const DialogLabelTextFormField(customLabel: "Time period"),
                Di.SBHES,
                Row(
                  children: [
                    DialogDropDownTextField(
                      initialValue:
                          education.durationFromDate?.getMonthInString,
                      alignHintTextStart: true,
                      // onChanged: (value) {
                      //   setState(() {
                      //     startMonth = value;
                      //   });
                      // },
                      width: 122,
                      hintText: 'Select Month',
                      dataList: monthList,
                    ),
                    Di.SBWES,
                    DialogDropDownTextField(
                      initialValue: education.durationFromDate?.getYearInString,
                      onChanged: (value) {
                        // setState(() {
                        //   startYear = value;
                        // });
                      },
                      width: 72,
                      hintText: 'Year',
                      dataList: yearsList,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSS),
                      child: Container(
                        width: 9,
                        height: 1.5,
                        color: Cr.accentBlue1,
                      ),
                    ),
                    DialogDropDownTextField(
                      initialValue: education.durationToDate?.getMonthInString,
                      onChanged: (value) {
                        // setState(() {
                        //   endMonth = value;
                        // });
                      },
                      disable: currentlyWorkHere,
                      width: 122,
                      hintText: 'Select Month',
                      dataList: monthList,
                    ),
                    Di.SBWES,
                    DialogDropDownTextField(
                      initialValue: education.durationToDate?.getYearInString,
                      onChanged: (value) {
                        // setState(() {
                        //   endYear = value;
                        // });
                      },
                      disable: currentlyWorkHere,
                      width: 72,
                      hintText: 'Year',
                      dataList: yearsList,
                    ),
                  ],
                ),
                Di.SBCH(18),
                const DialogLabelTextFormField(
                  isImportant: false,
                  customLabel: "Qualification title",
                ),
                Di.SBHES,
                DialogTextFieldForm(
                  textEditingController: _qualificationTitleController,
                ),
                Di.SBCH(18),
                const DialogLabelTextFormField(
                  customLabel: "Description",
                  isImportant: false,
                ),
                Di.SBHES,
                DialogMultiLineTextField(
                  textEditingController: _descriptionController,
                  width: 575,
                ),
                Di.SBCH(18),
                const DialogLabelTextFormField(
                  customLabel: "Course outline",
                  isImportant: false,
                ),
                Di.SBHES,
                ...getNewContactPhoneFields(),
                Di.SBHS,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      qualificationList.add('');
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
            Di.SBCH(28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      qualificationList.add('');
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
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getNewContactPhoneFields() {
    final textField = <Widget>[];
    for (var i = 0; i < qualificationList.length; i++) {
      textField.add(
        _QualificationField(
          onCloseTap: () {
            setState(() {
              qualificationList.removeAt(i);
            });
          },
        ),
      );
    }
    return textField;
  }
}

class _QualificationField extends StatefulWidget {
  const _QualificationField({
    Key? key,
    this.onCloseTap,
  }) : super(key: key);
  final void Function()? onCloseTap;

  @override
  State<_QualificationField> createState() => __QualificationFieldState();
}

class __QualificationFieldState extends State<_QualificationField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Di.SBHES,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: DialogTextFieldForm(
                hintText: "Course name",
              ),
            ),
            Di.SBCW(12),
            Material(
              child: InkWell(
                onTap: widget.onCloseTap,
                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
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
