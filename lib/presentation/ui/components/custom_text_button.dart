import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.textFontSize,
    this.color,
    this.textStyle,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final double? textFontSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Text(
        text,
        style: (textStyle ?? bodySmallRegular).copyWith(
          color: color ?? Cr.accentBlue1,
          fontSize: textFontSize,
        ),
      ),
    );
  }
}
