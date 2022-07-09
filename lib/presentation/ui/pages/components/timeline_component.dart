import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      decoration: Styles.boxDecorationBorder.copyWith(color: Cr.whiteColor),
      padding: const EdgeInsets.all(Di.PSD),
      height: 305,
      child: Stack(
        children: [
          Container(
            color: const Color(0xff0D9BDC),
          ),
          Positioned(
            left: -38,
            top: -15,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xff0E92CF),
                borderRadius: BorderRadius.circular(199),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 30,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: const Color(0xff0D9BDC),
                borderRadius: BorderRadius.circular(199),
              ),
            ),
          ),
          Positioned(
            left: 34,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: Di.PSD + 3,
                ),
                Container(
                  width: 2.5,
                  height: 27,
                  decoration: Styles.boxDecorationRounded.copyWith(
                    color: Cr.accentBlue2,
                  ),
                ),
                Di.SBHES,
                SvgPicture.asset(
                  Svgs.domain,
                  color: Cr.accentBlue2,
                  width: 18,
                ),
                Di.SBHES,
                Container(
                  width: 2.5,
                  height: 100,
                  decoration: Styles.boxDecorationRounded.copyWith(
                    color: Cr.accentBlue2,
                  ),
                ),
                Di.SBHES,
                SvgPicture.asset(
                  Svgs.school,
                  color: Cr.accentBlue2,
                  width: 18,
                ),
                Di.SBHES,
                Container(
                  width: 2.5,
                  height: 43,
                  decoration: Styles.boxDecorationRounded.copyWith(
                    color: Cr.accentBlue2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 83,
            child: SizedBox(
              height: 240,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: Di.PSD + 3,
                  ),
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
                      "New Noberto Holden’s career timeline.",
                      style: display3.copyWith(
                        color: Cr.accentBlue3,
                      ),
                    ),
                  ),
                  Di.SBHS,
                  CustomElevatedButton(
                    width: 200,
                    height: 35,
                    backgroundColor: Cr.accentBlue3,
                    icon: const Icon(Icons.menu),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Cr.accentBlue1,
                          size: 16,
                        ),
                        Di.SBWETS,
                        const Text(
                          "View Noberto’s timeline",
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
