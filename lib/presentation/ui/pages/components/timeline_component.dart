import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';

class TimelineComponent extends StatelessWidget {
  const TimelineComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: const Color(0xff0D9BDC)),
      // padding: const EdgeInsets.all(Di.PSD),
      height: 305,
      child: Stack(
        children: [
          Positioned(
            left: -38,
            top: -13,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xff0E92CF),
                borderRadius: BorderRadius.circular(199),
              ),
              child: Center(
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xff0D9BDC),
                    borderRadius: BorderRadius.circular(199),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Di.SBHL,
                Container(
                  width: 2,
                  height: 25,
                  decoration: Styles.boxDecorationRounded.copyWith(
                    color: Cr.accentBlue2,
                  ),
                ),
                Di.SBCH(7),
                SvgPicture.asset(
                  Svgs.domain,
                  color: Cr.accentBlue2,
                  width: 16,
                ),
                Di.SBCH(7),
                Container(
                  width: 2,
                  height: 130,
                  decoration: Styles.boxDecorationRounded.copyWith(
                    color: Cr.accentBlue2,
                  ),
                ),
                Di.SBCH(7),
                SvgPicture.asset(
                  Svgs.school,
                  color: Cr.accentBlue2,
                  width: 16,
                ),
                Di.SBCH(7),
                Container(
                  width: 2,
                  height: 43,
                  decoration: Styles.boxDecorationRounded.copyWith(
                    color: Cr.accentBlue2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 55,
            left: 83,
            child: SizedBox(
              // height: 240,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TIMELINE",
                    style: dividerTextSmall.copyWith(
                      color: Cr.accentBlue3,
                    ),
                  ),
                  Di.SBHES,
                  SizedBox(
                    width: 240,
                    child: Text(
                      "View ${DbData.getUserProfileData.fullName}\'s career timeline.",
                      style: display3.copyWith(
                        color: Cr.accentBlue3,
                      ),
                    ),
                  ),
                  Di.SBHS,
                  CustomElevatedButton(
                    onPressed: () {
                      // Provider.of<ProfileProvider>(context, listen: false)
                      //     .changeCurrentTabIndex(1);
                    },
                    width: 200,
                    height: 35,
                    backgroundColor: Cr.accentBlue3,
                    icon: const Icon(Icons.menu),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Cr.accentBlue1,
                          size: 16,
                        ),
                        Di.SBWETS,
                        Text(
                          "View ${DbData.getUserProfileData.firstName}\'s timeline",
                          style: TextStyle(
                            color: Cr.accentBlue1,
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
      // width: 360,
    );
  }
}
