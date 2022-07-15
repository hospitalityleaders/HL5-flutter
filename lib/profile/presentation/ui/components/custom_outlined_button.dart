import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    this.text,
    this.icon,
    this.textWidget,
    this.onPressed,
  }) : super(key: key);

  final String? text;
  final Widget? textWidget;
  final Widget? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon! else Di.ESB,
          Di.SBWES,
          textWidget ??
              Text(
                text ?? "",
                style: bodySmallRegular.copyWith(
                  color: Cr.darkGrey1,
                ),
              ),
        ],
      ),
    );
  }
}
