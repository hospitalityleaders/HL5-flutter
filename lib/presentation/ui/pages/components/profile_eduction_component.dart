import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/education.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_education_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class EducationComponent extends StatefulWidget {
  const EducationComponent({
    Key? key,
    this.onEditPressed,
    required this.userProfileData,
    this.isMobile = false,
    this.isTablet = false,
  }) : super(key: key);
  final User userProfileData;
  final void Function()? onEditPressed;
  final bool isMobile;
  final bool isTablet;

  @override
  State<EducationComponent> createState() => _EducationComponentState();
}

class _EducationComponentState extends State<EducationComponent> {
  @override
  Widget build(BuildContext context) {
    final List<Education>? education = DbData.getUserProfileData.educations;
    final bool hasData = education != null ? education.isNotEmpty : false;
    bool showMore = false;

    return Container(
      color: Cr.backgroundColor,
      child: Column(
        children: [
          Container(
            color: Cr.whiteColor,
            child: const ListTile(
              title: Text(
                "Education",
                style: h2Regular,
              ),
            ),
          ),
          Di.DWZH,
          IntrinsicHeight(
            child: Stack(
              children: [
                if (hasData)
                  Column(
                    children: education
                        .map(
                          (singleEductaion) => Container(
                            margin: EdgeInsets.only(
                                bottom: education.indexOf(singleEductaion) ==
                                        (education.length - 1)
                                    ? 0
                                    : Di.PSS),
                            width: widget.isMobile ? null : 360,
                            decoration: Styles.boxDecoration.copyWith(
                              color: Cr.whiteColor,
                              boxShadow: Styles.defaultBoxShadow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Di.SBCH(18),
                                ListTile(
                                  leading: const ContainerWithIcon(
                                    iconData: FontAwesomeIcons.buildingColumns,
                                    size: 50,
                                  ),
                                  title: Text(
                                    singleEductaion.institution ?? "",
                                    style: h4Bold.copyWith(
                                      fontSize: Di.FSD,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        singleEductaion.title ?? "",
                                        style: bodySmallRegular.copyWith(
                                          color: Cr.accentBlue1,
                                          fontSize: Di.FSS,
                                        ),
                                      ),
                                      const SizedBox(height: Di.PSETS),
                                      Text(
                                        singleEductaion.studyDuration ?? "",
                                        // "2010 - 2013",
                                        style: bodySmallRegular.copyWith(
                                          color: Cr.darkGrey1,
                                          fontSize: Di.FSS,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (singleEductaion.description != null) ...[
                                  Di.SBHD,
                                  Di.DWZH,
                                  ExpandedCollapseWidget(
                                    showText: "Course online",
                                    description: singleEductaion.description!,
                                    isTablet: widget.isTablet,
                                    isMobile: widget.isMobile,
                                  )
                                ],
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                EditBlueCardSheet(
                  context,
                  dataIsNull: !hasData,
                  greenCardText:
                      "Add the educational institutions you attended, the qualifications you achieved and the courses completed. ",
                ),
                if (hasData)
                  EditAddButtonOfSheet(
                    context,
                    onEditPressed: () {
                      showCustomDialog(
                        context,
                        ProfileEducationDialogWidget(
                          educations: DbData.getUserProfileData.educations ??
                              <Education>[],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
