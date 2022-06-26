import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/presentation/ui/components/base_functions.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';

class CustomCheckboxWithTitle extends StatelessWidget {
  const CustomCheckboxWithTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final double titleWidth = BaseFunction.getTextSize(
      title,
      bodySmallRegular,
    ).width;
    return SizedBox(
      width: titleWidth + 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle,
                color: Cr.accentBlue1,
                size: Di.FSL,
              ),
              Di.SBWES,
              Text(
                title,
                style: bodySmallRegular,
              ),
            ],
          ),
          SizedBox(
            width: titleWidth + 30,
            child: Divider(
              thickness: .7,
              color: Cr.darkGrey2,
            ),
          )
        ],
      ),
    );
  }
}

class CustomChoiceWithTrailingIcon extends StatelessWidget {
  const CustomChoiceWithTrailingIcon({
    Key? key,
    required this.title,
    this.iconData,
  }) : super(key: key);
  final IconData? iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double titleWidth = BaseFunction.getTextSize(
      title,
      bodySmallRegular,
    ).width;
    return SizedBox(
      width: titleWidth + 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: bodySmallRegular,
              ),
              Di.SBWES,
              SvgPicture.asset(
                Svgs.close,
                width: 16,
                color: Cr.accentBlue1,
              ),
            ],
          ),
          SizedBox(
            width: titleWidth + 30,
            child: Di.DD2,
          )
        ],
      ),
    );
  }
}
