import 'package:flutter/material.dart';
import 'package:holedo/common/common_widget.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
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
          Container(
            width: 320,
            decoration: BoxDecoration(
              color: ColorPicker.kWhite,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.all(2),
            child: TextFormField(
              // controller: _searchController,
              // onChanged: (_) => _search(), // , onSubmitted: (_) => _search(),
              cursorColor: ColorPicker.kWhite,
              style: FontTextStyle.kWhite18W600PR,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(4),
                hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
                filled: true,
                fillColor: ColorPicker.kPrimaryLight,
                hintText: "Search",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPicker.kPrimary),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPicker.kPrimary),
                    borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPicker.kPrimary),
                    borderRadius: BorderRadius.circular(5)),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorPicker.kPrimaryLightBlue,
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                  height: 40,
                  width: 87,
                  decoration: BoxDecoration(
                    color: ColorPicker.kPrimaryLight1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: CommonWidget.text(
                      'People',
                      style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                    ),
                  ),
                ),
              ),
            ),
          ),

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
