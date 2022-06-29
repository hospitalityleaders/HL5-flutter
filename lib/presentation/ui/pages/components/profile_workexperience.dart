import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/experience.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileWorkExperienceComponent extends StatelessWidget {
  const ProfileWorkExperienceComponent({
    Key? key,
    this.isMobile = false,
    this.isTablet = false,
    this.onEditPressed,
    required this.userProfileData,
  }) : super(key: key);

  final bool isMobile;
  final bool isTablet;
  final User userProfileData;

  final void Function()? onEditPressed;
  @override
  Widget build(BuildContext context) {
    final List<Experience>? experience = DbData.getUserProfileData.experiences;
    final bool hasData = experience != null ? experience.isNotEmpty : false;
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          Padding(
            padding: EdgeInsets.only(left: isMobile ? Di.PSD : Di.PSS),
            child: ListTile(
              title: Text(
                "Work experience",
                style: h2Regular,
              ),
            ),
          ),
          SizedBox(
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  if (hasData)
                    Column(
                      children: experience
                          .map(
                            (singleExperience) => Column(
                              children: [
                                Di.DWZH,
                                Di.SBHS,
                                Container(
                                  width: (isTablet || isMobile)
                                      ? double.infinity
                                      : 360,
                                  decoration: Styles.boxDecoration
                                      .copyWith(color: Cr.whiteColor),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: ContainerWithIcon(
                                          iconData:
                                              FontAwesomeIcons.buildingColumns,
                                          size: 50,
                                        ),
                                        title: Text(
                                          singleExperience.title ?? "",
                                          // "Food and Beverage Manager",
                                          style: h4Bold.copyWith(
                                            fontSize: Di.FSD,
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              singleExperience.companyName ??
                                                  "",
                                              // "Marriott Hotels)",
                                              style: bodySmallRegular.copyWith(
                                                color: Cr.accentBlue1,
                                                fontSize: Di.FSS,
                                              ),
                                            ),
                                            Text(
                                              singleExperience.workDuration ??
                                                  "",
                                              // "February 2013 – 2014 (1 year 6 months)",
                                              style: bodySmallRegular.copyWith(
                                                color: Cr.darkGrey1,
                                                fontSize: Di.FSS,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Di.SBHD,
                                      Di.DWZH,
                                      Container(
                                        width: double.infinity,
                                        color: Cr.lightGrey2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Di.SBHD,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Di.PSD),
                                              child: Text(
                                                singleExperience.description ??
                                                    "",
                                                // "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: bodyLarge.copyWith(
                                                  color: Cr.darkGrey1,
                                                ),
                                              ),
                                            ),
                                            Di.SBHS,
                                            CustomTextButton(
                                              text: "  - Close",
                                            ),
                                            Di.SBHS,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  EditBlueCardSheet(
                    context,
                    dataIsNull: !hasData,
                    greenCardText:
                        "Add your current and previous work experiences to your profile. Add as many as you like to highlight your work experience and skills.",
                    greenCardTip:
                        "Work experience is often the number one factor for employers and recruiters when looking to hire new candidates.",
                  ),
                  if (hasData)
                    EditAddButtonOfSheet(
                      context,
                      onEditPressed: () {
                        // showCustomDialog(
                        //   context,
                        //   Profi(
                        //     userProfileData: userProfileData,
                        //   ),
                        // );
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
