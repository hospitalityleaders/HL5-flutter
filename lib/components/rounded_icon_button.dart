import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';

class RoundeIconButton extends StatelessWidget {
  const RoundeIconButton({
    Key? key,
    this.onPressed,
    required this.icon,
    this.circleSize,
    this.backgroundColor,
  }) : super(key: key);
  final void Function()? onPressed;
  final Icon icon;
  final double? circleSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        width: circleSize ?? 60,
        height: circleSize ?? 60,
        decoration: BoxDecoration(
          color: backgroundColor ?? Cr.whiteColor,
          borderRadius: BorderRadius.circular(400),
        ),
        child: icon,
      ),
    );
  }
}
