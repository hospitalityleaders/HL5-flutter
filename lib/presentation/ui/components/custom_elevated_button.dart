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
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;
  final bool donotShowIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: width ?? 130,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Di.RSETS),
            ),
          ),
          splashFactory: NoSplash.splashFactory,
          minimumSize: MaterialStateProperty.all(Size(23, 0)),
          backgroundColor: MaterialStateProperty.all(Cr.accentBlue1),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            donotShowIcon
                ? SizedBox()
                : Icon(
                    Icons.edit,
                    color: Cr.whiteColor,
                    size: Di.FSD,
                  ),
            Di.SBWS,
            Text(
              text ?? "Edit Profile",
              style: bodySmallRegular.copyWith(color: Cr.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
