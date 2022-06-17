import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/rounded_icon_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';

class BlueEditStack extends StatelessWidget {
  const BlueEditStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: RoundeIconButton(
          backgroundColor: Cr.accentBlue1,
          icon: Icon(
            Icons.edit,
            color: Cr.whiteColor,
          ),
        ),
      ),
    );
  }
}
