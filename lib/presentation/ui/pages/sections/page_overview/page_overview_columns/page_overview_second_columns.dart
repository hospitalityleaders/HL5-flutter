import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/ui/pages/components/profile_workexperience.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileOverviewSecondColumn extends StatelessWidget {
  const ProfileOverviewSecondColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeaturedVideoComponent(),
          Di.SBHEL,
          ProfileWorkExperienceComponent(),
          Di.SBHEL,
          EducationComponent(),
          Di.SBHEL,
          AchievementComponent(),
          Di.SBHEL,
          LanguagesComponent(),
          Di.SBHEL,
        ],
      ),
    );
  }
}

class LanguagesComponent extends StatelessWidget {
  const LanguagesComponent({
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
              "Languages",
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
                  trailing: SizedBox(),
                  title: Text(
                    "English",
                    style: h4Bold.copyWith(
                      fontSize: Di.FSD,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Di.PSETS + 1,
                    ),
                    child: Text(
                      "Native and bilingual profiency",
                      style: bodySmallRegular.copyWith(
                        color: Cr.accentBlue1,
                        fontSize: Di.FSS,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: ContainerWithIcon(
                    iconData: FontAwesomeIcons.buildingColumns,
                    size: 50,
                  ),
                  trailing: SizedBox(),
                  title: Text(
                    "Spanish",
                    style: h4Bold.copyWith(
                      fontSize: Di.FSD,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Di.PSETS,
                    ),
                    child: Text(
                      "Native and bilingual profiency",
                      style: bodySmallRegular.copyWith(
                        color: Cr.accentBlue1,
                        fontSize: Di.FSS,
                      ),
                    ),
                  ),
                ),
                Di.SBHD,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AchievementComponent extends StatelessWidget {
  const AchievementComponent({
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
              "Achievement",
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
                  trailing: SizedBox(),
                  title: Text(
                    "Marriott Hotel and Resorts employee of the year awards",
                    style: h4Bold.copyWith(
                      fontSize: Di.FSD,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Di.SBHES,
                      Text(
                        "www.marriott.com/awards",
                        style: bodySmallRegular.copyWith(
                          color: Cr.accentBlue1,
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
                  width: 360,
                  color: Cr.lightGrey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Di.SBHS,
                      CustomTextButton(
                        text: "  + Course online",
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

class EducationComponent extends StatelessWidget {
  const EducationComponent({
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
              "Education",
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
                    "University of Cape Town",
                    style: h4Bold.copyWith(
                      fontSize: Di.FSD,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Di.PSETS + 1),
                      Text(
                        "Postgraduate Degree in Business Science",
                        style: bodySmallRegular.copyWith(
                          color: Cr.accentBlue1,
                          fontSize: Di.FSS,
                        ),
                      ),
                      SizedBox(height: Di.PSETS + 1),
                      Text(
                        "2010 - 2013",
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
                  width: 360,
                  color: Cr.lightGrey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Di.SBHS,
                      CustomTextButton(
                        text: "  + Course online",
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

class FeaturedVideoComponent extends StatelessWidget {
  const FeaturedVideoComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Di.PSD),
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Featured video",
              style: h2Regular,
            ),
          ),

          // Di.SBHD,
          Divider(thickness: 1),
          Di.SBHD,
          Stack(
            children: [
              SizedBox(
                height: 180,
                width: 360,
                child: Image.asset(
                  "assets/images/videoThumbnail.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child:
                      // Container(
                      //   width: 100,
                      //   height: 100,
                      //   color: Cr.accentBlue1,
                      // ),
                      SvgPicture.asset(
                    "assets/icons/smallPlayerIcon.svg",
                  ),
                ),
              ),
            ],
          ),
          Di.SBHL,

          Text(
            "Chef TV: Inside the kitchen of Noberto Holden",
            style: h4Bold,
          ),
          Di.SBHL,
          RichText(
            text: TextSpan(
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      "Noberto's career has revolved around causing corporate transformation projects designed to optimize the use of resources enha...",
                ),
                TextSpan(
                  text: "show more",
                  style: TextStyle(
                    color: Cr.accentBlue1,
                  ),
                ),
              ],
            ),
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}
