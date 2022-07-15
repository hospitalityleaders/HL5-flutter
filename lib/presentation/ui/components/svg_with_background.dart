import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/styles.dart';

class SvgWithBackground extends StatelessWidget {
  const SvgWithBackground({
    Key? key,
    required this.svg,
    this.size,
    this.iconSize,
  }) : super(key: key);

  final String svg;
  final double? size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 50,
      height: size ?? 50,
      decoration: boxDecoration.copyWith(
        color: Cr.accentBlue1,
      ),
      child: Center(
        child: SvgPicture.asset(
          svg,
          width: iconSize,
          color: Cr.whiteColor,
        ),
      ),
    );
  }
}
