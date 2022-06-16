import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileWorkExperienceComponent extends StatelessWidget {
  const ProfileWorkExperienceComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          ListTile(
            title: Text(
              "Work experience",
              style: h2Regular,
            ),
          ),
          Divider(
            thickness: 1,
            height: 0,
          ),
          Di.SBHS,
          Container(
            width: 360,
            decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: ContainerWithIcon(
                    iconData: FontAwesomeIcons.buildingColumns,
                    size: 50,
                  ),
                  title: Text(
                    "Food and Beverage Manager",
                    style: h4Bold.copyWith(
                      fontSize: Di.FSD,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Di.PSETS + 1),
                      Text(
                        "Marriott Hotels)",
                        style: bodySmallRegular.copyWith(
                          color: Cr.accentBlue1,
                          fontSize: Di.FSS,
                        ),
                      ),
                      SizedBox(height: Di.PSETS + 1),
                      Text(
                        "February 2013 – 2014 (1 year 6 months)",
                        style: bodySmallRegular.copyWith(
                          color: Cr.darkGrey1,
                          fontSize: Di.FSS,
                        ),
                      ),
                    ],
                  ),
                ),
                Di.SBHD,
                Divider(
                  thickness: 1,
                  height: 0,
                ),
                Container(
                  color: Cr.lightGrey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Di.SBHD,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                        child: Text(
                          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
    );
  }
}
