import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ConnectionsComponent extends StatelessWidget {
  const ConnectionsComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHETS,
          const ListTile(
            title: Text(
              "Connections",
              style: h2Regular,
            ),
          ),
          Di.DWZH,
          Di.SBCH(18),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? Di.PSL : 0),
              height: 100,
              width: isMobile ? double.infinity : 324,
              color: Cr.whiteColor,
              child: Image.asset(
                "assets/images/profileConnectionBanner.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Di.SBCH(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
            child: Text(
              "You and Noberto have 25 shared connections.",
              style: bodySmallRegular.copyWith(color: Cr.darkGrey1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
            child: Text(
              "View mutual connections",
              style: bodySmallRegular.copyWith(color: Cr.accentBlue1),
            ),
          ),
          Di.DD,
          Di.SBHS,
          Center(
            child: SizedBox(
              width: isMobile ? Di.getScreenSize(context).width - 52 : 320,
              height: 35,
              child: const TextWithBackground(
                sizedBoxBetweenIconText: Di.SBWES,
                text: "Grow your network",
                iconData: Icons.person_add,
                backgroundColor: Cr.accentBlue3,
              ),
            ),
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}
