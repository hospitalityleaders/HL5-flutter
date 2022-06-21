import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class TextWithBackground extends StatelessWidget {
  const TextWithBackground({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.border,
    this.fontSize,
    this.iconData,
    this.icon,
    this.textStyle,
    this.sizedBoxBetweenIconText,
    this.padding,
    this.paddingHorizantal,
  }) : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? border;
  final double? fontSize;
  final double? padding;
  final double? paddingHorizantal;
  final IconData? iconData;
  final Icon? icon;
  final TextStyle? textStyle;
  final SizedBox? sizedBoxBetweenIconText;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
        border: border,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: padding ?? 5,
          horizontal: paddingHorizantal ?? padding ?? 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (icon == null && iconData == null)
                ? Di.ESB
                : (icon ??
                    Icon(
                      iconData,
                      size: 12,
                      color: Cr.accentBlue1,
                    )),
            (icon != null || iconData != null)
                ? sizedBoxBetweenIconText ?? Di.SBWD
                : Di.ESB,
            Text(
              text,
              style: textStyle ??
                  bodySmallRegular.copyWith(
                    color: textColor ?? Cr.accentBlue1,
                  ),
            ),
          ],
        ),
        // : Text(
        //     text,
        //     style: bodySmallRegular.copyWith(
        //       color: Cr.accentBlue1,
        //     ),
        //   ),
      ),
    );
  }
}
