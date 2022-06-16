import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/custom_text_field.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';

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
          CustomTextField(
            width: 320,
            prefixIcon: Icon(
              Icons.search,
              color: Cr.darkBlue8,
            ),
            hintText: "Search",
            hintStyle: defaultRegular.copyWith(
              color: Cr.darkBlue8,
            ),
          ),
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
            iconData: Icons.mail_rounded,
            showNotification: true,
          ),
          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),
          CustomIconButton(
            iconData: Icons.flag,
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
