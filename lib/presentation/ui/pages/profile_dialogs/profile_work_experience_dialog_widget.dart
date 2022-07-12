import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/experience.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/data/presentation_data.dart';
import 'package:holedo/presentation/extensions/datetime_extension.dart';
import 'package:holedo/presentation/functions/helper_functions.dart';

import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/custom_expanded_tile.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:holedo/presentation/validators/form_validator.dart';

class ProfileWorkExperienceDialogWidget extends StatefulWidget {
  const ProfileWorkExperienceDialogWidget({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final List<Experience> experience;

  @override
  State<ProfileWorkExperienceDialogWidget> createState() =>
      _ProfileWorkExperienceDialogWidgetState();
}

class _ProfileWorkExperienceDialogWidgetState
    extends State<ProfileWorkExperienceDialogWidget> {
  late List<Experience> experiences;
  @override
  void initState() {
    experiences = widget.experience;
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
              title: "Work Experience",
            ),
            Di.SBHL,
            addingToProfile
                ? Container(
                    padding: const EdgeInsets.only(bottom: Di.PSS),
                    margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
                    child: _SingleWorkExperience(
                      isExpanded: true,
                      experience: Experience(),
                    ),
                  )
                : Center(
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
              itemCount: experiences.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: Di.PSS),
                  margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
                  width: 615,
                  child: _SingleWorkExperience(
                    index: index,
                    experience: experiences[index],
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

class _SingleWorkExperience extends StatefulWidget {
  const _SingleWorkExperience({
    Key? key,
    this.experience,
    this.isExpanded = false,
    this.index,
  }) : super(key: key);
  final Experience? experience;
  final bool isExpanded;
  final int? index;

  @override
  State<_SingleWorkExperience> createState() => __SingleWorkExperienceState();
}

class __SingleWorkExperienceState extends State<_SingleWorkExperience> {
  late final TextEditingController _titlePositionController;
  late final TextEditingController _companyNameController;
  late final TextEditingController _companyWebsiteController;
  late final TextEditingController _cityController;
  late final TextEditingController _jobDescriptionController;
  late final TextEditingController _salaryController;
  final _formKey = GlobalKey<FormState>();
  late Experience experience;
  // Job description

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    experience = widget.experience ?? Experience();
    _titlePositionController = TextEditingController(text: experience.title)
      ..addListener(() {
        setState(() {});
      });
    _companyNameController = TextEditingController(text: experience.companyName)
      ..addListener(() {
        setState(() {});
      });
    _companyWebsiteController = TextEditingController(
        text: experience.companyWebsite != null
            ? experience.companyWebsite.toString()
            : "")
      ..addListener(() {
        setState(() {});
      });
    _cityController = TextEditingController(text: experience.area)
      ..addListener(() {
        setState(() {});
      });
    _jobDescriptionController =
        TextEditingController(text: experience.description);
    experience.salary == null
        ? _salaryController = TextEditingController()
        : _salaryController = TextEditingController(
            text: experience.salary.toString(),
          );
    countryId = experience.countryId;
    super.initState();
  }

  @override
  void dispose() {
    _titlePositionController.dispose();
    _companyNameController.dispose();
    _companyWebsiteController.dispose();
    _cityController.dispose();
    _jobDescriptionController.dispose();
    _salaryController.dispose();

    super.dispose();
  }

  List<String> newTextField = [""];
  String? selectedValue;
  bool currentlyWorkHere = false;
  late bool isExpanded;
  int? countryId;
  String? startMonth, startYear, endMonth, endYear;

  @override
  Widget build(BuildContext context) {
    final userProfileData = DbData.getUserProfileData;

    return CustomExpandedTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _titlePositionController.text,
            style: h4Bold,
          ),
          Text(
            _companyNameController.text +
                (_cityController.text.isNotEmpty
                    ? " · ${_cityController.text}"
                    : ""),
            style: bodySmallRegular.copyWith(
              color: Cr.accentBlue1,
              fontWeight: _companyWebsiteController.text.isNotEmpty
                  ? FontWeight.bold
                  : null,
            ),
          ),
          Text(
            ((experience.fromDate != null)
                ? "${experience.fromDate!.getMonthInString} ${experience.fromDate!.year}${(experience.toDate != null) ? " - ${experience.toDate!.getMonthInString} ${experience.toDate!.year} (${experience.toDate!.month - experience.fromDate!.month} months)" : ""}"
                : ""),
            style: bodySmallRegular.copyWith(
              color: Cr.darkGrey1,
            ),
          )
          // Text(
          //   ((startMonth != null && startYear != null)
          //       ? "$startMonth $startYear" +
          //           ((endMonth != null && endYear != null)
          //               ? " – $endMonth $endYear"
          //               : "")
          //       : ""),
          //   style: bodySmallRegular.copyWith(
          //     color: Cr.darkGrey1,
          //   ),
          // )
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DialogLabelTextFormField(
                    customLabel: "Title / position",
                  ),
                  Di.SBHES,
                  DialogTextFieldForm(
                    validator: requiredValidator,
                    textEditingController: _titlePositionController,
                  ),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(
                    customLabel: "Company name",
                  ),
                  Di.SBHES,
                  DialogTextFieldForm(
                    validator: requiredValidator,
                    textEditingController: _companyNameController,
                  ),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(
                    isImportant: false,
                    customLabel: "Company website",
                  ),
                  Di.SBHES,
                  DialogTextFieldForm(
                    hintText: "www.website.com",
                    textEditingController: _companyWebsiteController,
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
                        validator: requiredValidator,
                        textEditingController: _cityController,
                        width: 250,
                      ),
                      const SizedBox(width: 18),
                      DialogDropDownTextField(
                        initialValue: countryId == null
                            ? null
                            : PresentationData.countries[countryId!.toString()],
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
                  Di.SBCH(18),
                  const DialogLabelTextFormField(customLabel: "Time period"),
                  Di.SBHES,
                  Row(
                    children: [
                      DialogDropDownTextField(
                        initialValue: experience.fromDate?.getMonthInString,
                        alignHintTextStart: true,
                        onChanged: (value) {
                          setState(() {
                            startMonth = value;
                          });
                        },
                        width: 122,
                        hintText: 'Select Month',
                        dataList: PresentationData.monthList,
                      ),
                      Di.SBWES,
                      DialogDropDownTextField(
                        initialValue: experience.fromDate?.getYearInString,
                        onChanged: (value) {
                          setState(() {
                            startYear = value;
                          });
                        },
                        width: 72,
                        hintText: 'Year',
                        dataList: PresentationData.yearsList,
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
                        initialValue: experience.toDate?.getMonthInString,
                        onChanged: (value) {
                          setState(() {
                            endMonth = value;
                          });
                        },
                        disable: currentlyWorkHere,
                        width: 122,
                        hintText: 'Select Month',
                        dataList: PresentationData.monthList,
                      ),
                      Di.SBWES,
                      DialogDropDownTextField(
                        initialValue: experience.fromDate?.getYearInString,
                        onChanged: (value) {
                          // setState(() {
                          //   endYear = value;
                          // });
                        },
                        disable: currentlyWorkHere,
                        width: 72,
                        hintText: 'Year',
                        dataList: PresentationData.yearsList,
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
                    "We collect this data to compile hospitatliy industry salary surveys. Holedo members participating in our survey get our report free of charge ",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  ),
                  Di.SBHES,
                  Row(
                    children: [
                      const DialogDropDownTextField(
                        width: 140,
                        hintText: 'Select Currency',
                        dataList: [
                          "ZAR - RAND",
                        ],
                      ),
                      Di.SBWES,
                      DialogTextFieldForm(
                        textEditingController: _salaryController,
                        validator: requiredValidator,
                        textInputType: TextInputType.number,
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
                  Di.SBHES,
                  const DialogDropDownTextField(
                    width: 100,
                    hintText: '10+ days',
                    dataList: [
                      "10",
                      "30",
                      "50",
                      "100",
                      "200",
                    ],
                  ),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(
                    customLabel: "Job description",
                    isImportant: false,
                  ),
                  Di.SBHES,
                  DialogMultiLineTextField(
                    textEditingController: _jobDescriptionController,
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
                          // if (_formKey.currentState!.validate()) {
                          showCircularProgressIndicator(context);
                          List<Experience> experiences =
                              userProfileData.experiences!;

                          experience.title = _titlePositionController.text;
                          experience.companyName = _companyNameController.text;
                          experience.companyWebsite =
                              _companyWebsiteController.text;
                          experience.area = _cityController.text;
                          if (countryId != null) {
                            experience.countryId = countryId;
                          }
                          if (startYear != null && startMonth != null) {
                            experience.fromDate = DateTime(
                              int.tryParse(startYear!)!,
                              int.tryParse(startMonth!)!,
                            );
                          }
                          if (endYear != null && endMonth != null) {
                            experience.toDate = DateTime(
                              int.tryParse(endYear!)!,
                              int.tryParse(endMonth!)!,
                            );
                          }
                          experience.salary = _salaryController.text;
                          // experience.leaveDayTypesId
                          experience.description =
                              _jobDescriptionController.text;
                          //update exiting list
                          if (widget.index != null) {
                            experiences[widget.index!] = experience;
                          } else {
                            experiences.add(experience);
                          }

                          await User(
                            experiences: experiences,
                          ).save(userProfileData);
                          Nav.pop(context);
                          Nav.pop(context);
                          // }
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
      ),
    );
  }
}
