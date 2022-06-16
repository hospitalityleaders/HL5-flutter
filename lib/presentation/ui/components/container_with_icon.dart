import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ContainerWithIcon extends StatelessWidget {
  const ContainerWithIcon({
    Key? key,
    required this.iconData,
    this.size,
    this.iconSize,
  }) : super(key: key);

  final IconData iconData;
  final double? size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? Di.FSOTL,
      height: size ?? Di.FSOTL,
      decoration: Styles.boxDecoration.copyWith(
        color: Cr.accentBlue1,
      ),
      child: Center(
        child: Icon(
          iconData,
          size: iconSize,
          color: Cr.whiteColor,
        ),
      ),
    );
  }
}
