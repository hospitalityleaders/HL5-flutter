import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class RightsComponent extends StatelessWidget {
  const RightsComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? null : 360,
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHS,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
            child: Text(
              "Hospitality Leaders Ltd.\nAll Rights Reserved.\nTerms of service.",
              style: bodySmallRegular.copyWith(
                color: Cr.darkBlue1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
              child: SizedBox(
                width: isMobile ? null : 120,
                height: 20,
                child: TextWithBackground(
                  sizedBoxBetweenIconText: Di.SBWES,
                  textStyle: h5Bold.copyWith(
                    color: Cr.darkGrey1,
                  ),
                  padding: 0,
                  text: "Privacy Policy",
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: Cr.green1,
                    size: 15,
                  ),
                  backgroundColor: Cr.whiteColor,
                ),
              ),
            ),
          ),
          Di.SBHS,
        ],
      ),
    );
  }
}
