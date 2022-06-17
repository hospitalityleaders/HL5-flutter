import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.colorPrimary,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.logo1,
            width: Di.FSOTL + 10,
          ),
          Di.SBWD,
          AppbarTextField(),

          // CustomTextField(
          //   width: 320,
          //   prefixIcon: Icon(
          //     Icons.search,
          //     color: Cr.darkBlue8,
          //   ),
          //   hintText: "Search",
          //   hintStyle: defaultRegular.copyWith(
          //     color: Cr.darkBlue8,
          //   ),
          //   suffixIcon: Align(
          //     alignment: Alignment.centerRight,
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: Di.PSES,
          //       ),
          //       child: CustomElevatedButton(
          //         width: 100,
          //         height: 34,
          //         // backgroundColor: Cr.darkBlue6,
          //         backgroundColor: Cr.darkBlue6,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           // mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text(
          //               "People",
          //               style: bodySmallRegular.copyWith(
          //                 color: Cr.darkBlue8,
          //               ),
          //             ),
          //             Icon(
          //               Icons.abc,
          //             ),
          //             // SvgPicture.asset(
          //             //   "assets/svgicons/menuDown.svg",
          //             //   color: Cr.darkBlue8,
          //             // ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          // SvgPicture.asset(
          //   "assets/svgicons/menu-down.svg",
          //   color: Cr.darkBlue8,
          // ),

          Di.SBWD,
          CustomTextButton(
            text: "Home",
            color: Cr.whiteColor,
          ),

          CustomTextButton(
            text: "Profile",
            color: Cr.darkBlue8,
          ),
          CustomTextButton(
            text: "News",
            color: Cr.darkBlue8,
          ),
          CustomTextButton(
            text: "Jobs",
            color: Cr.darkBlue8,
          ),

          CustomTextButton(
            text: "Recruitment",
            color: Cr.darkBlue8,
          ),

          CustomTextButton(
            text: "Help",
            color: Cr.darkBlue8,
          ),
          Di.SBWL,

          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),
          CustomIconButton(
            icon: SvgPicture.asset(
              Svgs.emailOpen,
              color: Cr.darkBlue9,
            ),
            // iconData: Icons.mail_rounded,
            showNotification: true,
          ),
          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          CustomIconButton(
            icon: SvgPicture.asset(
              Svgs.flag,
              color: Cr.darkBlue9,
            ),
            showNotification: true,
          ),

          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person_add,
                color: Cr.darkBlue9,
              ),
              Di.SBWES,
              TextWithBackground(
                text: "352",
                textColor: Cr.darkBlue9,
                padding: 0,
                paddingHorizantal: 4,
                backgroundColor: Cr.darkBlue5,
              )
            ],
          ),
          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          PersonAvatar(),

          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          // Recruitment
        ],
      ),
    );
  }
}
