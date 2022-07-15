import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class CustomCheckboxWithTitle extends StatelessWidget {
  const CustomCheckboxWithTitle({
    Key? key,
    required this.title,
    this.showIconInTrailing = false,
  }) : super(key: key);

  final String title;
  final bool showIconInTrailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Di.PSS),
      decoration: const BoxDecoration(
        color: Cr.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            spreadRadius: -1,
            color: Color(0xffBDC4C7),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!showIconInTrailing) ...[
            const Icon(
              Icons.check_circle,
              color: Cr.accentBlue1,
              size: Di.FSL,
            ),
            Di.SBWES,
          ],
          Text(
            title,
            style: bodySmallRegular,
          ),
          if (showIconInTrailing) ...[
            Di.SBWES,
            const Icon(
              Icons.close,
              color: Cr.accentBlue1,
              size: Di.FSL,
            ),
          ],
        ],
      ),
    );
  }
}
