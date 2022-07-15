import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class BlueEditStack extends StatelessWidget {
  const BlueEditStack({
    Key? key,
  }) : super(key: key);

  // final double widg

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          // width: 560,
          // height: 385,
          color: Cr.accentBlue2.withOpacity(.8),
          padding: const EdgeInsets.all(Di.PSD),
        ),
      ),
    );
  }
}
