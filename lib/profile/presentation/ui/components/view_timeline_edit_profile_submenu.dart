import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/onhover.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/images.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

class ViewTimeEditProfileSubmenu extends StatelessWidget {
  const ViewTimeEditProfileSubmenu({
    Key? key,
    required this.hideSubMenuCallback,
    this.donotShowTimeline = false,
    required this.editText,
  }) : super(key: key);

  final void Function() hideSubMenuCallback;
  final bool donotShowTimeline;
  final String editText;

  @override
  Widget build(BuildContext context) {
    return CustomSubMenu(
      customSubMenuItems: [
        if (!donotShowTimeline)
          CustomSubmenuItem(
            onTap: () {
              Provider.of<ProfileProvider>(context, listen: false)
                  .changeCurrentTabIndex(1);
              // ref
              //     .read(profileNotifierProvider.notifier)
              //     .changeCurrentTabIndex(1);
            },
            width: 245,
            textIconColor: Cr.accentBlue1,
            textStyle: bodySmallRegular.copyWith(
              color: Cr.accentBlue1,
            ),
            icon: SvgPicture.asset(
              Svgs.menu,
              width: 16,
              color: Cr.accentBlue1,
            ),
            text: "View in timeline",
          ),
        CustomSubmenuItem(
          onTap: () {
            Provider.of<ProfileProvider>(context, listen: false)
                .changeIsProfieEditableState(true);
            hideSubMenuCallback();
          },
          width: 245,
          textIconColor: Cr.accentBlue1,
          textStyle: bodySmallRegular.copyWith(
            color: Cr.accentBlue1,
          ),
          icon: SvgPicture.asset(
            Svgs.pencil,
            width: 16,
            color: Cr.accentBlue1,
          ),
          text: "Edit $editText",
        ),
      ],
    );
  }
}

class HideFromProfileDeleteRefereneceSubmenu extends StatelessWidget {
  const HideFromProfileDeleteRefereneceSubmenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSubMenu(
      customSubMenuItems: [
        CustomSubmenuItem(
          icon: SvgPicture.asset(
            Svgs.eyeOff,
            width: 16,
            color: Cr.darkGrey1,
          ),
          text: "Hide from my profile",
        ),
        const CustomSubmenuItem(
          iconData: Icons.delete,
          text: "Delete",
        ),
      ],
    );
  }
}

class CustomSubMenu extends StatelessWidget {
  const CustomSubMenu({
    Key? key,
    required this.customSubMenuItems,
  }) : super(key: key);
  final List<CustomSubmenuItem> customSubMenuItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: Di.PSS),
          child: SvgPicture.asset(
            Svgs.menuAboveArrow,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 2,
                color: Color.fromARGB(13, 0, 0, 0),
              )
            ],
            border: Border.all(
              color: Cr.grey3,
            ),
          ),
          child: Column(
            children: customSubMenuItems,
          ),
        ),
      ],
    );
  }
}

class CustomSubmenuItem extends StatelessWidget {
  const CustomSubmenuItem({
    Key? key,
    required this.text,
    this.iconData,
    this.icon,
    this.textIconColor,
    this.textStyle,
    this.width,
    this.onTap,
  }) : super(key: key);
  final String text;
  final IconData? iconData;
  final Widget? icon;
  final Color? textIconColor;
  final TextStyle? textStyle;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (bool isHovered) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isHovered ? Cr.accentBlue3 : Cr.whiteColor,
            ),
            width: width ?? 180,
            height: 38,
            padding: const EdgeInsets.symmetric(
              horizontal: Di.PSS,
            ),
            child: Row(
              children: [
                icon ??
                    (iconData != null
                        ? Icon(
                            iconData,
                            color: textIconColor ?? Cr.darkGrey1,
                            size: 14,
                          )
                        : Di.ESB),
                Di.SBCW(6.5),
                Text(
                  text,
                  style: textStyle ??
                      bodySmallSemibold.copyWith(
                        color: textIconColor ?? Cr.darkGrey1,
                      ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
