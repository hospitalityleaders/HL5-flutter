import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.donotShowIcon = false,
    this.child,
    this.backgroundColor,
    this.icon,
    this.textColor,
    this.borderColor,
    this.onPressed,
    this.padding,
    this.makeWidthNull = false,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;
  final bool donotShowIcon;
  final Widget? child;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final double? padding;
  final bool makeWidthNull;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: makeWidthNull ? null : width ?? 130,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(Di.RSETS),
            ),
          ),
          splashFactory: NoSplash.splashFactory,
          // minimumSize: MaterialStateProperty.all(Size(23, 0)),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Cr.accentBlue1,
          ),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        // onPressed: () {

        // },
        child: child ??
            (!donotShowIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      donotShowIcon
                          ? SizedBox()
                          : icon ??
                              Icon(
                                Icons.edit,
                                color: Cr.whiteColor,
                                size: Di.FSD,
                              ),
                      Di.SBWS,
                      Text(
                        text ?? "Edit Profile",
                        style: bodySmallRegular.copyWith(
                          fontSize: Di.FSD - 3,
                          color: textColor ?? Cr.whiteColor,
                        ),
                      ),
                    ],
                  )
                : Text(
                    text ?? "Edit Profile",
                    style: bodySmallRegular.copyWith(
                      color: textColor ?? Cr.whiteColor,
                    ),
                  )),
      ),
    );
  }
}
