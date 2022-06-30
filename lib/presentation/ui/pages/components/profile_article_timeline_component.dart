import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileArticleTimelineComponent extends StatelessWidget {
  const ProfileArticleTimelineComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecorationBorder.copyWith(color: Cr.whiteColor),
      height: 720,
      child: Stack(
        children: [
          Container(
            color: Cr.darkBlue5,
          ),
          Positioned(
            left: -38,
            top: -15,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Cr.darkBlue2,
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
                color: Cr.darkBlue5,
                borderRadius: BorderRadius.circular(199),
              ),
            ),
          ),
          // Positioned(
          //   left: 37,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         height: Di.PSD + 3,
          //       ),
          //       Container(
          //         width: 2.5,
          //         height: 27,
          //         decoration: Styles.boxDecorationRounded.copyWith(
          //           color: Cr.darkBlue7,
          //         ),
          //       ),
          //       Di.SBHES,
          //       SvgPicture.asset(
          //         Svgs.domain,
          //         color: Cr.darkBlue7,
          //         width: 16,
          //       ),
          //       Di.SBHES,
          //       Container(
          //         width: 2.5,
          //         height: 100,
          //         decoration: Styles.boxDecorationRounded.copyWith(
          //           color: Cr.darkBlue7,
          //         ),
          //       ),
          //       Di.SBHES,
          //       SvgPicture.asset(
          //         Svgs.school,
          //         color: Cr.darkBlue7,
          //         width: 16,
          //       ),
          //       Di.SBHES,
          //       Container(
          //         width: 2.5,
          //         height: 43,
          //         decoration: Styles.boxDecorationRounded.copyWith(
          //           color: Cr.darkBlue7,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Positioned(
            top: 20,
            left: 44,
            child: Container(
              width: 2.5,
              height: 675,
              decoration: Styles.boxDecorationRounded.copyWith(
                color: Cr.darkBlue7,
              ),
            ),
          ),

          Positioned(
            // left: 83,
            left: 37,
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Di.SBHOTL,
                  Di.SBHS,
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.symmetric(vertical: Di.PSS),
                        color: Cr.darkBlue5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            Svgs.domain,
                            color: Cr.darkBlue7,
                            width: 20,
                          ),
                        ),
                      ),
                      Di.SBWD,
                      Text(
                        "SIGN UP TO SEE NOBERTOS COLLECTION",
                        style: dividerTextSmall.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: SizedBox(
                      width: 240,
                      child: Text(
                        "Get priority\nnews access.",
                        style: display3.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Di.SBHOTL,
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.symmetric(vertical: Di.PSS),
                        color: Cr.darkBlue5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            Svgs.checkCircle,
                            color: Cr.darkBlue7,
                            width: 20,
                          ),
                        ),
                      ),
                      Di.SBWD,
                      Text(
                        "All the latest news",
                        style: h4Bold.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: SizedBox(
                      width: 265,
                      child: Text(
                        "Stay up to date with news from the tourism and hospitality industry.",
                        style: bodyLarge.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Di.SBHEL,
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.symmetric(vertical: Di.PSS),
                        color: Cr.darkBlue5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            Svgs.checkCircle,
                            color: Cr.darkBlue7,
                            width: 20,
                          ),
                        ),
                      ),
                      Di.SBWD,
                      Text(
                        "Credible sources",
                        style: h4Bold.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: SizedBox(
                      width: 265,
                      child: Text(
                        "I’ts gathered from hundreds of trusted sources and updates in real time.",
                        style: bodyLarge.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Di.SBHEL,
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.symmetric(vertical: Di.PSS),
                        color: Cr.darkBlue5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            Svgs.checkCircle,
                            color: Cr.darkBlue7,
                            width: 20,
                          ),
                        ),
                      ),
                      Di.SBWD,
                      Text(
                        "Wide scope of research",
                        style: h4Bold.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: SizedBox(
                      width: 265,
                      child: Text(
                        "We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.",
                        style: bodyLarge.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Di.SBHEL,
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: CustomElevatedButton(
                      width: 200,
                      height: 35,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add,
                            color: Cr.darkBlue1,
                            size: 12,
                          ),
                          Di.SBWES,
                          Text(
                            "Sign up now. It’s free",
                            style: bodySmallSemibold,
                          ),
                        ],
                      ),
                      backgroundColor: Cr.whiteColor,
                      icon: Icon(Icons.menu),
                    ),
                  ),
                  Di.SBHS,
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.symmetric(vertical: Di.PSS),
                        color: Cr.darkBlue5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            Svgs.download,
                            color: Cr.darkBlue7,
                            width: 20,
                          ),
                        ),
                      ),
                      Di.SBWD,
                      Text(
                        "OR IMPORT YOUR DETAILS FROM",
                        style: dividerTextLarge.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Di.SBHS,
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 36,
                          color: Cr.facebook,
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            color: Cr.whiteColor,
                            size: 14,
                          ),
                        ),
                        Di.SBWES,
                        Container(
                          width: 80,
                          height: 36,
                          color: Cr.google,
                          child: Icon(
                            FontAwesomeIcons.googlePlusG,
                            color: Cr.whiteColor,
                            size: 14,
                          ),
                        ),
                        Di.SBWES,
                        Container(
                          width: 80,
                          height: 36,
                          color: Cr.xing,
                          child: Icon(
                            FontAwesomeIcons.xing,
                            color: Cr.whiteColor,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Di.SBHOTL,
                ],
              ),
            ),
          ),
        ],
      ),
      // width: 360,
    );

    // Container(
    //   padding: EdgeInsets.all(Di.PSD),
    //   decoration: Styles.boxDecoration.copyWith(color: Cr.darkBlue5),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "25",
    //             style: display1.copyWith(
    //               color: Cr.whiteColor,
    //             ),
    //           ),
    //           Di.SBWETS,
    //           Padding(
    //             padding: const EdgeInsets.only(top: Di.PSES),
    //             child: Text(
    //               "%",
    //               style: h2Regular.copyWith(
    //                 color: Cr.whiteColor,
    //                 fontSize: Di.FSOL,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Di.SBHD,
    //       LinearPercentIndicator(
    //         lineHeight: 10.0,
    //         alignment: MainAxisAlignment.center,
    //         percent: 0.25,
    //         backgroundColor: Colors.black,
    //         barRadius: Radius.circular(20),
    //       ),
    //       Di.SBHD,
    //       SizedBox(
    //         width: 300,
    //         child: Text(
    //           "Your profile is only 25% complete. Improve it now. Here’s how.",
    //           textAlign: TextAlign.center,
    //           style: h2Regular.copyWith(
    //             color: Cr.whiteColor,
    //           ),
    //         ),
    //       ),
    //       Di.SBHD,
    //       CustomListTile(),
    //       CustomListTile(),
    //       CustomListTile(),
    //       CustomListTile(),
    //       CustomElevatedButton(
    //         width: 320,
    //         text: "Edit my profile",
    //         donotShowIcon: true,
    //       ),
    //       Di.SBHS,
    //     ],
    //   ),
    // );
  }
}
