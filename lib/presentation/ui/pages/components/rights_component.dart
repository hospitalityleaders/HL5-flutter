import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/styles.dart';

class RightsComponent extends StatelessWidget {
  const RightsComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isMobile ? null : 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Holedo Limited\nAll Rights Reserved",
            // "Hospitality Leaders Ltd.\nAll Rights Reserved.\nTerms of service.",
            style: bodySmallRegular.copyWith(
              color: Cr.darkGrey1,
            ),
          ),
          // Di.SBHES,
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: SizedBox(
          //     width: isMobile ? null : 116,
          //     height: 20,
          //     child: TextWithBackground(
          //       decoration: BoxDecoration(
          //         color: Cr.whiteColor,
          //         borderRadius: BorderRadius.circular(2),
          //         boxShadow: const [
          //           BoxShadow(
          //             blurRadius: 2,
          //             color: Color.fromARGB(64, 0, 0, 0),
          //             offset: Offset.zero,
          //           ),
          //         ],
          //       ),
          //       sizedBoxBetweenIconText: Di.SBCW(2),
          //       textStyle: h5Bold.copyWith(
          //         color: Cr.darkGrey1,
          //       ),
          //       padding: 0,
          //       text: "Privacy Policy",
          //       icon: SvgPicture.asset(
          //         Svgs.informationVariant,
          //         width: 12,
          //         color: Cr.green1,
          //         //   color: Cr.green1,
          //       ),
          //       backgroundColor: Cr.whiteColor,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

  //  decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(2),
  //       boxShadow: [
  //         BoxShadow(
  //           blurRadius: 2,
  //           color: Color.fromARGB(64, 0, 0, 0),
  //           offset: Offset(0, 0),
  //         ),
  //       ],
  //     ),